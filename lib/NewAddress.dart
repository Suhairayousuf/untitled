// //@dart=2.9
// import 'dart:collection';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_place_picker/google_maps_place_picker.dart' as gMapPlacePicker;
// import 'package:untitled/Loginpage.dart';
// import 'Catogories.dart';
// import 'package:geocode/geocode.dart';
// import 'Customeradress.dart';
// class NewAddress extends StatefulWidget {
//   final double latitude;
//   final double longitude;
//   final HashMap address;
//   final void Function(double latitude,double longitude) validateinput;
//   const NewAddress({Key key, this.latitude, this.longitude, this.address, this.validateinput}) :super(key: key);
//
//   @override
//   State<NewAddress> createState() => _NewAddressState();
// }
// class _NewAddressState extends State<NewAddress> {
//   TextEditingController Name;
//   TextEditingController Phonenumber;
//   TextEditingController Housenumber;
//   TextEditingController Roadname;
//   TextEditingController city;
//   TextEditingController pincode;
//   gMapPlacePicker.PickResult result;
//   double lat;
//   double long;
//   set(){
//     setState(() {
//
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     Name = TextEditingController(text: '');
//     Phonenumber = TextEditingController(text: '');
//     Housenumber = TextEditingController(text: '');
//     Roadname = TextEditingController(text: '');
//     city = TextEditingController(text: '');
//     pincode = TextEditingController(text: '');
//   }
//   Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white,
//         elevation: 0,
//         title:Text('Add Delivery Address',style: TextStyle(color: Colors.black),),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(
//               height:230,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     offset: Offset(
//                       5.0,
//                       5.0,
//                     ),
//                     blurRadius: 10.0,
//                     spreadRadius: 2.0,
//                   ), //BoxShadow
//                   BoxShadow(
//                     color: Colors.white,
//                     offset: Offset(0.0, 0.0),
//                     blurRadius: 0.0,
//                     spreadRadius: 0.0,
//                   ), //BoxShadow
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Row(
//                         children: [
//                           Icon(Icons.call,color: Colors.pink,size: 30,),
//                           Text('Contact Detailes',style: TextStyle(color: Colors.black,fontSize: 20),)
//                         ],
//                       ),
//                     ),
//                     TextFormField(
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       controller: Name,
//                       keyboardType: TextInputType.text,
//                       decoration: const InputDecoration(hintText: 'Name',labelText: 'Name',labelStyle: TextStyle(color: Colors.pink),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       controller: Phonenumber,
//                       keyboardType: TextInputType.text,
//                       decoration: const InputDecoration(hintText: 'phonenumber',labelText: 'phonenumber',labelStyle: TextStyle(color: Colors.pink),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               height:400,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15,top: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.location_on,color: Colors.pink,size: 30,),
//                         Text('Address',style: TextStyle(color: Colors.black,fontSize: 20),)
//                       ],
//                     ),
//                     TextFormField(
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       controller: Housenumber,
//                       keyboardType: TextInputType.text,
//                       decoration: const InputDecoration(hintText: 'House no./Building name',labelText: 'House no./Building name',labelStyle: TextStyle(color: Colors.pink),
//                       ),
//
//                     ),
//                     TextFormField(
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       controller: Roadname,
//                       keyboardType: TextInputType.text,
//                       decoration: const InputDecoration(hintText: 'Road name/area',labelText: 'Road name/area',labelStyle: TextStyle(color: Colors.pink),
//                       ),
//
//
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 180,
//                           child: TextFormField(
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             controller: city,
//                             keyboardType: TextInputType.text,
//                             decoration: const InputDecoration(hintText: 'city',labelText: 'city',labelStyle: TextStyle(color: Colors.pink),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 20,),
//                         Container(
//                           width: 180,
//                           child: TextFormField(
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             controller: pincode,
//                             keyboardType: TextInputType.text,
//                             decoration: const InputDecoration(hintText: 'state',labelText: 'state',labelStyle: TextStyle(color: Colors.pink),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => gMapPlacePicker.PlacePicker(
//                               apiKey: "AIzaSyCfSWYXBcU_tvYV8vljjokKGMAyUvfQKrE",
//                               // Put YOUR OWN KEY here.
//
//                               searchForInitialValue: true,
//                               selectInitialPosition: true,
//
//                               onPlacePicked: (res) async {
//                                 GeoCode geoCode = GeoCode();
//                                 Address address=await geoCode.reverseGeocoding(latitude: res.geometry.location.lat,longitude: res.geometry.location.lng);
//                                 result=res;
//                                 Housenumber.text=address.streetNumber.toString();
//                                 Roadname.text=address.region;
//                                 city.text=address.city;
//                                 pincode.text=address.postal;
//                                 lat=result.geometry.location.lat;
//                                 long=result.geometry.location.lng;
//                                 Navigator.of(context).pop();
//                                 set();
//                               },
//                               useCurrentLocation: true,
//                             ),
//                           ),
//                         );
//                       },
//                         child:
//                         Container(
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on, color: Colors.pink, size: 25,),
//                               Text('Use my current location', style: TextStyle(
//                                   color: Colors.black, fontSize: 15),)
//                             ],
//                           ),
//                         ),
//                 ),
//                 SizedBox(height: 20),
//                 InkWell(
//                   onTap: (){
//                     if(Housenumber.text!='') {
//                       List shippingaddress=[];
//                        shippingaddress.add({
//                         'name': Name.text,
//                         'housenumber': Housenumber.text,
//                         'Road/area': Roadname.text,
//                         'city': city.text,
//                         'pincode': pincode.text,
//                         'phonenumber': Phonenumber.text,
//                          'lat':lat,
//                          'long':long,
//                       });
//
//                       FirebaseFirestore.instance.collection('users').doc(currentuserid).update({
//                         'Shippingaddress':FieldValue.arrayUnion(shippingaddress),
//                   });
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressWidget()));
//                 }
//                 else{
//                   showUploadMessage(context, "please choose delivery location");
//                 }
//               },
//               child: Container(
//                 height: 50,
//                 width: 300,
//                 decoration: BoxDecoration( color: Colors.pink,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Center(
//                   child: Text('Save and Continue',style:
//                   TextStyle(color: Colors.white,
//                       fontSize: 20),),
//                 ),
//               ),
//             )
//           ],
//         ),
//     ),
//     ),
//   ],  ),
//       ),
//     );
//   }
// }
//
