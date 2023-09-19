import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NewAddress.dart';
int selectedAddress=0;
Map DeliveryAddress={};
class AddressWidget extends StatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  Icon(Icons.keyboard_backspace_sharp),
        title: Text('Add customer address')
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAddress()));
                    },
                    child: Container(
                      height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.add,color: Colors.pink,size: 20,)),
                  ),
                  SizedBox(width: 20,),
                  Text('Add new Address',style: TextStyle(color: Colors.pink,fontSize: 20),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Expanded(
                child: Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('users').snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return CircularProgressIndicator();
                        }
                        var addr=snapshot.data?.docs;
                        List customeradress=addr![0]['Shippingaddress'];
                        return ListView.builder(
                          itemCount: customeradress.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20,bottom: 20),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedAddress=index;
                                    DeliveryAddress.addAll({
                                      'name':customeradress[index]['name'],
                                      'Houseno':customeradress[index]['housenumber'],
                                      'Road/area':customeradress[index]['Road/area'],
                                      'Pincode':customeradress[index]['pincode'],
                                      'Ph':customeradress[index]['phonenumber'],
                                      'lat':customeradress[index]['lat'],
                                      'long':customeradress[index]['long'],
                                    });
                                  });
                                 },
                                child: Container(
                                  height: 160,
                                  width: 300,
                                  decoration: BoxDecoration(color: Colors.blueGrey.shade100,
                                  border: Border.all(
                                    color: selectedAddress==index?Colors.red: Colors.blueGrey.shade100,
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                        Text(customeradress[index]['name'],
                                          style: const TextStyle(color: Colors.pink,
                                              fontSize:25,
                                              fontWeight: FontWeight.bold ),),
                                         Row(
                                           children: [
                                             Text('Houseno:', style: const TextStyle(color: Colors.black,
                                                 fontSize:15,
                                                 fontWeight: FontWeight.bold ),),
                                             Text(customeradress[index]['housenumber'],
                                               style: const TextStyle(color: Colors.black,
                                                   fontSize:15,
                                                   fontWeight: FontWeight.bold ),),
                                           ],
                                         ),
                                         Text(customeradress[index]['Road/area'],
                                           style: const TextStyle(color: Colors.black,
                                               fontSize:15,
                                               fontWeight: FontWeight.bold ),),
                                         Row(
                                           children: [
                                             Text('pin:',
                                               style: const TextStyle(color: Colors.black,
                                                   fontSize:15,
                                                   fontWeight: FontWeight.bold ),),
                                             Text(customeradress[index]['pincode'],
                                               style: const TextStyle(color: Colors.black,
                                                   fontSize:15,
                                                   fontWeight: FontWeight.bold ),),
                                           ],
                                         ),
                                         Row(
                                           children: [
                                             Text('Ph:+91',
                                               style: const TextStyle(color: Colors.black,
                                                   fontSize:17,
                                                   fontWeight: FontWeight.bold ),),
                                             Text(customeradress[index]['phonenumber'],
                                              style: const TextStyle(color: Colors.black,
                                                fontSize:15,
                                                fontWeight: FontWeight.bold ),),
                                           ],
                                         ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
