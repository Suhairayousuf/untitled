import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/Customeradress.dart';
import 'package:untitled/singlepage.dart';
import 'package:untitled/stagg.dart';
import 'package:untitled/status.dart';

import 'Catogories.dart';
import 'CurrentOrder.dart';
import 'FileUp.dart';
import 'FileUpload.dart';
import 'Loginpage.dart';
import 'addproduct.dart';
import 'myorder.dart';
class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future logout() async {
    await FirebaseAuth.instance.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Login()),(route) => false);
  }
  @override
  Widget build(BuildContext context) {
    print(currentuser);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

         leading: InkWell(
           onTap: (){
             Navigator.pop(context,MaterialPageRoute(builder: (context)=>Login()));
           },
             child: Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
        actions: [
          IconButton(
            onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Status()),
                );

            },
            icon: Icon(Icons.food_bank,color: Colors.black,size: 30,)),
             Builder(

            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),

          // IconButton(
          //     onPressed: (){},
          //     icon: Icon(Icons.menu,color: Colors.black,size: 30,))

        ],
        
      ),
      endDrawer: Drawer(
        child:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('logindata').snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
                        return ListView(
            //  physics: NeverScrollableScrollPhysics(),
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child:Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 30,
                              backgroundImage:NetworkImage(photo),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 180,top: 20),
                              child: Text(name,style: TextStyle(color: Colors.green,fontSize: 11,fontWeight: FontWeight.bold),),
                            ),
                            Align(alignment:Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(mail,style: TextStyle(color: Colors.green,fontSize: 10,),),
                                    Icon(Icons.arrow_drop_down_rounded,size: 30,)
                                  ],
                                )),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Catogories()));
                        },
                        child: const ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Add Catogory',textScaleFactor: 1.2,),
                          trailing: Icon(Icons.done),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Addpdt()));

                        },
                        child: const ListTile(
                          leading: Icon(Icons.group),
                          title: Text('add product',textScaleFactor: 1.2,),

                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Contact',textScaleFactor: 1.2,),),
                      const ListTile(
                        leading: Icon(Icons.group),
                        title: Text('New group',textScaleFactor: 1.2,),

                      ),
                      InkWell(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => Order()));

                       },
                        child: const ListTile(
                          leading: Icon(Icons.call),
                          title: Text('Currentorder',textScaleFactor: 1.2,),),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>MyOrder()));
                        },
                        child: const ListTile(
                          leading: Icon(Icons.shopping_cart,color: Colors.red,),
                          title: Text('Go to Cart',textScaleFactor: 1.2,),),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressWidget()));

                        },
                        child: const ListTile(
                          leading: Icon(Icons.add),
                          title: Text('Add  customer address',textScaleFactor: 1.2,),),
                      ),
                      const ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings',textScaleFactor: 1.2,),),
                      const Divider(),
                      ListTile(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Upload()));


                        },
                        leading: Icon(Icons.person_add),
                        title: Text('Fileupload',textScaleFactor: 1.2,),),
                      ListTile(
                        onTap: (){
                          logout();

                                                  },
                        leading: Icon(Icons.logout_rounded),
                        title: Text('Logout',textScaleFactor: 1.2,),),




                    ],
            );
          }
        ),


      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('FOOD LIST',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('120 Category',
                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),),
                  Text('Popular Dishes',
                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 628,
                width: 450,
                color: Colors.white,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Category').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    var pdt=snapshot.data?.docs;
                    return GridView.builder(
                      itemCount: pdt?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                        (
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: .81
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ), //BoxShadow
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Stagg()));
                                      },
                                      child: Container(
                                        height:180,
                                        decoration: BoxDecoration(
                                            image:DecorationImage(
                                                image: NetworkImage(pdt![index]['img']),
                                                fit: BoxFit.fill)), ),
                                    ),
                                    Text(pdt[index]['name'],
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,),),
                                     Text(pdt[index]['description'],
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 15,
                                      ),),
                                                                  ],
                                ),
                              ),
                            ),
                          ],
                        );

                    },


              );
                  }
                )

              ),
            ],
          ),
        ),
      ),

    );
  }
}


