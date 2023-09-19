
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
String currentId='';
class Catogories extends StatefulWidget {
  const Catogories({Key? key}) : super(key: key);

  @override
  State<Catogories> createState() => _CatogoriesState();
}

class _CatogoriesState extends State<Catogories> {
  late TextEditingController Additems;
  late TextEditingController description;
  String imgUrl='';
  String editImgUrl='';
  late File imgFile;
  late final String image;
  bool edit=false;

  @override
  void initState() {
    super.initState();
    Additems = TextEditingController(text: '');
    description = TextEditingController(text: '');
  }
  Future uploadImageToFirebase(BuildContext context) async {
    print('start');
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('deposits/${imgFile.path}');
    UploadTask uploadTask = firebaseStorageRef.putFile(imgFile);
    TaskSnapshot taskSnapshot = (await uploadTask);
    String value = await taskSnapshot.ref.getDownloadURL();
    print(value);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
            appBar: AppBar(
                 title: Text('Catogories',style: TextStyle(color: Colors.red,fontSize: 35),),
             ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  edit==true?

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: TextButton(onPressed: (){
                          edit=false;
                          Additems.text='';
                          description.text='';
                          imgUrl='';

                          setState(() {

                          });
                        }, child: Text('clear')
                        ),
                      ),
                      Container(height: 150,width: 150,
                        child: CachedNetworkImage(imageUrl: editImgUrl==''?imgUrl:editImgUrl ,),),
                      //Icon(Icons.image,color: Colors.black,size: 40,),
                      TextButton(onPressed: (){
                        editImgUrl='';
                        _pickImage();
                        setState(() {
                        });
                      }, child: Text('change image')),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:
                            TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: Additems,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(hintText: 'please enter item',
                              ),


                            )
                        ),
                      ),

                      Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:
                          TextFormField(


                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                            controller: description,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(hintText: 'please enter description',
                            ),



                          )

                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          imgUrl=editImgUrl;
                          if(Additems.text!='' && description.text!='' && imgUrl!=''){

                            FirebaseFirestore.instance.collection('Category')
                                .doc(currentId).update({
                              'name':Additems.text,
                              'description':description.text,
                              'img':imgUrl,
                            });
                            edit=false;

                            showUploadMessage(context, 'category updated Successfully');
                            Additems.text='';
                            description.text='';
                            imgUrl='';
                            editImgUrl='';
                            setState(() {

                            });
                          }else{
                            Additems.text==''?showUploadMessage(context,'please enter item'):imgUrl==''?showUploadMessage(context,'please Upload image')
                                :showUploadMessage(context,'please enter description');

                          }
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text('Update',style: TextStyle(color: Colors.black,fontSize: 20),),),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ):
                  Column(
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
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:
                            TextFormField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: Additems,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(hintText: 'please enter item',
                              ),


                            )
                        ),
                      ),

                      Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:
                          TextFormField(


                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                            controller: description,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(hintText: 'please enter description',
                            ),



                          )

                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          if(Additems.text!='' && description.text!='' && imgUrl!=''){
                            FirebaseFirestore.instance.collection('Category').add({
                              'name':Additems.text,
                              'description':description.text,
                              'img':imgUrl,
                            }).then((value) => {
                              value.update({
                                'categoryId':value.id,
                              })
                            });

                            showUploadMessage(context, 'categoryAdded Successfully');
                            Additems.text='';
                            description.text='';
                            imgUrl='';
                          }else{
                            Additems.text==''?showUploadMessage(context,'please enter item'):imgUrl==''?showUploadMessage(context,'please Upload image')
                                :showUploadMessage(context,'please enter description');

                          }
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text('Add',style: TextStyle(color: Colors.black,fontSize: 20),),),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                         Container(
                    height: 350,
                    width: 300,
                    color: Colors.yellow,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('Category').snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return CircularProgressIndicator();
                        }
                        var abc=snapshot.data?.docs;
                        return ListView.builder(
                          itemCount: abc?.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  edit=true;

                                  setState(() {
                                    currentId=abc![index].id;
                                    Additems.text=abc[index]['name'];
                                    editImgUrl=abc[index]['img'];
                                    description.text=abc[index]['description'];
                                  });
                                },
                                onLongPress: (){
                                  showDialog(context: context, builder:(buildcontext)
                                  {
                                    return AlertDialog(
                                      title: Text('Delete'),
                                      content: Text('are you sure?'),
                                      actions: [
                                        TextButton(onPressed: () {
                                FirebaseFirestore.instance.collection('Category').doc(abc?[index].id).delete();

                                          Navigator.pop(context);
                                        },
                                            child: Text('delete')),
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        },
                                            child: Text('cancel')),

                                      ],
                                    );
                                  });

                                },
                                child: Container(

                                  height: 40,
                                  width: 120,
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      Container(
                                        height: 30,
                                        width: 100,
                                        child: Text(abc![index]['name']),
                                      ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    child: Text(abc[index]['description']),
                                  ),
                                      Container(
                                        height: 40,
                                        width: 80,
                                        child: Image.network(abc[index]['img']),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    ),
                  )
                ],


              ),
            ),

    );
  }
}
