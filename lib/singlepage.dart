import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Loginpage.dart';

import 'myorder.dart';
String cu='';
List<Map<String, dynamic>>cartList = [];
class Single extends StatefulWidget {
  final String id;
  const Single({Key? key, required this.id}) : super(key: key);

  @override
  State<Single> createState() => _SingleState();
}
class _SingleState extends State<Single> {

  var category;
  int qty=1;
  double amount=0;
  late String total;

  getData(){
    FirebaseFirestore.instance.collection('newProducts').doc(widget.id).snapshots().listen((event) {
      category=event.data();
      amount=double.tryParse(category['Price'].toString())!;
      print(event.data());
      if(mounted){
        setState(() {

        });
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print(currentuserid);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: category==null?Center(child: CircularProgressIndicator(),):

      Padding(
        padding: const EdgeInsets.only(top: 30,right: 30,left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.55,
              decoration: BoxDecoration(
                color: Colors.green,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(category['img']),fit: BoxFit.fill
                  )
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(category['name'],style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                Text(category['Price'],style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  height: 40,
                  width: 90,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          if(qty>1)
                            {
                              qty--;
                              setState(() {

                              });
                            }
                          } ,
                          child: Icon(Icons.remove)),
                      Text(qty.toString()),
                      InkWell(
                        onTap: (){
                          if(qty>=0)
                            {
                              qty++;
                              setState(() {

                              });
                            }
                        },
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),

                  Container(
                    height: 100,
                    width: 190,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text(total=(double.tryParse(qty.toString())! * amount).toString(),),
                        TextButton(onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){

                                    cartList.add(
                                        {
                                            'name': category['name'],
                                            'price': category['Price'],
                                            'qty': qty,
                                            'image': category['img'],
                                            'total': total,

                                        });

                                    FirebaseFirestore.instance.collection('users').doc(currentuserid).update({
                                      'bag':FieldValue.arrayUnion(cartList),
                                    });
                                    cartList=[];
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>MyOrder()));
                                  },
                                    child: Column(
                                      children: [
                                        Text('Add to Cart'),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration:BoxDecoration(color: Colors.black,
                                            image: DecorationImage(
                                              image: NetworkImage('https://media.istockphoto.com/vectors/shopping-cart-icon-isolated-on-white-background-vector-id1206806317?k=20&m=1206806317&s=612x612&w=0&h=waK8qOHV2Fgz2ntEWHWBQtXpNDAQ_wdhd4tkTUz6tfE='),fit: BoxFit.fill
                                            ),
                                        ),
                                        ),
                                      ],
                                    )),


                              ],
                            )),

                      ],
                    ),
                  ),


                ],
              ),
            ),

           ],
        ),
      ),
    );
  }
}
