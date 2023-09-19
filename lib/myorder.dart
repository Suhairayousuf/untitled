//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/CurrentOrder.dart';
import 'package:untitled/Customeradress.dart';
import 'package:untitled/Loginpage.dart';
import 'package:untitled/addproduct.dart';
import 'package:untitled/singlepage.dart';

import 'Catogories.dart';
class MyOrder extends StatefulWidget {

  const MyOrder({Key key, }) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  List items;
  var name;
  var price;
  var image;
  var quantity;
  var total;

  @override
    Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Your Order',style: TextStyle(color: Colors.red),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.8,
            child:  StreamBuilder<DocumentSnapshot>(
                 stream: FirebaseFirestore.instance.collection('users').doc(currentuserid)
                     .snapshots(),
                    builder: (context, snapshot) {
                   if(!snapshot.hasData){
                     return const CircularProgressIndicator();
                   }
                   var data=snapshot.data;

                   if(!data.exists){
                     return Center(
                       child: Text('No Cart Found'),
                     );
                   }
                   items=data['bag'];
                      return items.length==0?
                      Center(
                        child:  Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/5081-empty-box.gif'),fit: BoxFit.fill
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text('Empty Cart'),
                          ),
                        ),
                      ):
                        ListView.builder(
                     itemCount: items.length,
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context, index) {
                       return Padding(
                         padding: const EdgeInsets.all(7.0),
                         child: Card(
                           child: Container(
                            height:120 ,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(
                                   height: 150,
                                   width: 150,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(75),
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
                                     const SizedBox(height: 20,),
                                     InkWell(
                                         onTap: (){
                                           FirebaseFirestore.instance.collection('users').doc(currentuserid)
                                               .update({
                                             'bag': FieldValue.arrayRemove([items[index]]),
                                           });
                                         },
                                         child: Icon(Icons.delete,size: 25,))
                                   ],
                                 ),
                               ],
                             ),
                           ),

                         ),
                       );
                       },

                        );
                 }
                 )),
                            InkWell(
                              onTap: (){
                                FirebaseFirestore.instance.collection('users').doc(currentuserid).update({
                                  'bag':FieldValue.arrayRemove(cartList),

                                });
                                List<Map<String, dynamic>>itemList =[];
                                for(var i = 0 ; i < items.length; i++){
                                  itemList.add(
                                      {

                                        'name': items[i]['name'],
                                        'price': items[i]['price'],
                                        'qty': items[i]['qty'],
                                        'image': items[i]['image'],
                                        'total': items[i]['total'],
                                        'status':0,


                                      });
                                }

                                FirebaseFirestore.instance.collection('Orders').add({
                                  'item':itemList,
                                  'DeliveryAddress':DeliveryAddress,
                                  'Userid':currentuserid,
                                  'orderstatus':0,
                                  'placedDate':DateTime.now(),

                                }).then((value){
                                  value.update({
                                    'orderId':value.id,
                                  });

                                });
                                FirebaseFirestore.instance.collection('users').doc(currentuserid)
                                    .update({
                                  'bag': [],
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Order()));

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30,bottom: 10),
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(color: Colors.red,
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Center(child: Text('place Order')),
                                ),
                              ),
                            )
        ],
      ));
  }}