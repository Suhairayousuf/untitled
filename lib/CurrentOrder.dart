//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Loginpage.dart';
class Order extends StatefulWidget {
  const Order({Key key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Order Detailes'),
      ),
      body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child:  StreamBuilder<QuerySnapshot> (
              stream: FirebaseFirestore.instance.collection('Orders').where('Userid',isEqualTo: currentuserid)
                  .snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }
                var data=snapshot.data.docs;

                if(data.isEmpty){
                  return const Center(
                    child: Text('No Cart Found'),
                  );
                }

                return data.length==0?
                Center(
                  child: Text('No items Found'),
                ):
                ListView.builder(
                  itemCount: data.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    List items=data[index]['item'];
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Card(
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                return Container(
                                  height:100 ,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                            image: DecorationImage(
                                              image: NetworkImage(items[index]['image']),
                                              fit: BoxFit.fill,
                                            )
                                        ),
                                      ),
                                      Text(items[index]['name'],style: TextStyle(fontSize: 20),),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text('Rs:  '+items[index]['price'],style: TextStyle(fontSize: 13),),
                                          Text('Qty:'+items[index]['qty'].toString(),style: TextStyle(fontSize: 13),),
                                          Text('total: '+items[index]['total'].toString(),style: TextStyle(fontSize: 13),),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },

                            ),
                            Container(
                              height:60 ,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10,left: 20),
                                child:
                                data[index]['orderstatus']!=0?
                                Text("Status : ${data[index]['orderstatus']==1?'Accepted':'rejected'}",
                                  style: TextStyle(fontSize: 20),
                              ):
                                Container(
                                  height: 60,
                                  width: 40.0,
                                    decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/42976-order-success.gif'),
                                    ),
                                  ),
                                ),


                            ),),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
      ));
  }
}
