import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

void showUploadMessage(BuildContext context, String message,
    {bool showLoading = false}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: showLoading?Duration(minutes: 30):Duration(seconds: 4),
        content: Row(
          children: [
            if (showLoading)
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: CircularProgressIndicator(),
              ),
            Text(message),
          ],
        ),
      ),
    );
}
class Addpdt extends StatefulWidget {

  const Addpdt({Key? key}) : super(key: key);

  @override
  State<Addpdt> createState() => _AddpdtState();
}

//List<DropdownMenuItem>categoryList=[];
//Map<String,dynamic>categoryId={};
class _AddpdtState extends State<Addpdt> {


  late TextEditingController Productname;
  late TextEditingController Price;
  late TextEditingController subtitle;
    String imgUrl='';
    late File imgFile;
    late final String image;
  // late TextEditingController imgurl;
  late String dropdownvalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Productname = TextEditingController(text: '');
    Price = TextEditingController(text: '');
    subtitle = TextEditingController(text: '');
    if(fetchedCategory.isEmpty){
      getBrands().then((value){
        setState(() {

        });
      });
    }


  }
    Future uploadImageToFirebase(BuildContext context) async {
      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child('deposits/${imgFile.path}');
      UploadTask uploadTask = firebaseStorageRef.putFile(imgFile);
      TaskSnapshot taskSnapshot = (await uploadTask);
      String value = await taskSnapshot.ref.getDownloadURL();
      setState(() {
        imgUrl = value;
        showUploadMessage(context, 'Upload Success',
        );
      });
    }
   _pickImage() async {
      final imageFile = await ImagePicker.platform.pickImage(
          source: ImageSource.gallery);
      //print(imageFile);
      setState(() {
        imgFile = File(imageFile!.path);
        uploadImageToFirebase(context);
        showUploadMessage(context, 'Uploading', showLoading: true,);
      });
    }
  List<DropdownMenuItem> fetchedCategory=[];
  Map<String,dynamic>categorylist={};
  String selectedCategory='';
   getBrands() async {
    QuerySnapshot data1 =
    await FirebaseFirestore.instance.collection('Category').get();
    for (var doc in data1.docs) {
      print(data1.docs.length);
      // Map<String , dynamic> data = doc.data();
      categorylist[doc.get('name')]=(doc.get('description')+doc.get('img'));
      print(categorylist);

      fetchedCategory.add(DropdownMenuItem(
        child: Text(doc.get('name')),
        value: doc.get('name'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text('Products',style: TextStyle(color: Colors.black87,fontSize: 35),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:50 ,top: 50),
          child: Column(
            children: [
              ElevatedButton(

                  onPressed: () =>_pickImage(),
                  child: Text('Select Image')),

              imgUrl==''?Container():
              Container(height: 150,width: 150,
              child: CachedNetworkImage(imageUrl: imgUrl ,),),
              //Icon(Icons.image,color: Colors.black,size: 40,),
              TextButton(onPressed: (){

              }, child: Text('Upload')),
              Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:
                  TextFormField(

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: Productname,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'please enter new product',
                    ),


                  )
              ),
              SizedBox(height: 20,),
              Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:
                  TextFormField(

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: Price,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'Price',
                    ),


                  )
              ),
              SizedBox(height: 20,),
              Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:
                  TextFormField(

                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    controller: subtitle,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: 'Subtitle',
                    ),


                  )
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if(Productname.text!='' && Price.text!=''
                      && subtitle.text!='' && imgUrl!='')
                    {
                       showDialog(context: context,
                           builder: (buildcontext)
                       {
                         return AlertDialog(
                           title: Text('Confirm'),
                           content: Text('Do you want to confirm?'),
                           actions: [
                             TextButton(onPressed: (
                                 ){
                               Navigator.pop(context);
                             },
                                 child: Text('Cancel')),
                             TextButton(onPressed: (){
                               Navigator.pop(context);
                               FirebaseFirestore.instance.collection('newProducts').add({
                                 'name':Productname.text,
                                 'Price':Price.text,
                                 'Subtitle':subtitle.text,
                                 'img':imgUrl,

                               });
                               setState(() {
                               });
                               showUploadMessage(context, 'product addded successfully');
                               Productname.text='';
                               Price.text='';
                               imgUrl ='';
                               subtitle.text='';
                             },
                                 child: Text('confirm')),
                           ],
                         );

                       });
                    }else{
                       Productname.text==''?showUploadMessage(context,'please enter product')
                           :Price.text==''? showUploadMessage(context,'please enter price'):
                      subtitle.text==''?showUploadMessage(context,'please enter subtitle'):showUploadMessage(context,'please Upload image');}
                  },
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('submit')),

                ),
              ),
              Container(
                height: 100,
                child: SearchableDropdown.single(
                  items: fetchedCategory,
                  value: selectedCategory,
                  hint: "Select one",
                  searchHint: "Select one",
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      print(selectedCategory);
                      print(categorylist[selectedCategory]);
                    });
                  },
                                  ),
              ),
        ],),

    ),
      )
    );
  }

  }

