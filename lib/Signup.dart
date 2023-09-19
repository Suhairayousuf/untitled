import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController username;
  late TextEditingController Password;
  late TextEditingController ConfrmPassword;
  late TextEditingController FirstName;
  late TextEditingController LastName;
  late TextEditingController phonenumber;

  @override
  //final auth=FirebaseAuth.instance;
  void initState() {
    super.initState();
    username = TextEditingController(text: '');
    Password = TextEditingController(text: '');
    ConfrmPassword = TextEditingController(text: '');
    FirstName = TextEditingController(text: '');
    LastName = TextEditingController(text: '');
    phonenumber = TextEditingController(text: '');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.redAccent,),
          onPressed: () {
            Navigator.pop(context);
          },),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 45,),
            Text('SIGN UP', style: const TextStyle(color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
            const SizedBox(height: 35,),
            Container(
                height: 40,
                width: 300,
                color: Colors.grey,
                child: TextFormField(
                  controller: username,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Username',
                      prefixIcon: Icon(Icons.person, color: Colors.black,)),
                )
            ),
            SizedBox(height: 35,),
            Container(
                height: 40,
                width: 300,
                color: Colors.grey,
                child: TextFormField(
                  controller: Password,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Password',
                      prefixIcon: Icon(Icons.password, color: Colors.black,)),
                )
            ),
            const SizedBox(height: 35,),
            Container(
                height: 40,
                width: 300,
                color: Colors.grey,
                child: TextFormField(
                  controller: ConfrmPassword,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'confirmPassword',
                      prefixIcon: Icon(Icons.password, color: Colors.black,)),
                )
            ),
            SizedBox(height: 25,),
            MaterialButton(
              onPressed: () {
                if (Password.text == ConfrmPassword.text) {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: username.text, password: Password.text)
                      .then((user) {

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("user added successfully")));
                    showDialog(context: context, builder: (buildcontext)
                    {
                      return AlertDialog(
                        title: const Text('add informations'),
                        content: Column(
                          children: [
                            TextFormField(

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: FirstName,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: 'FirstName',
                              ),
                            ),
                            TextFormField(

                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: LastName,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: 'LastName',
                              ),


                            ),
                            TextFormField(

                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                              controller: phonenumber,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: 'phonenumber',
                              ),


                            )
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: ()
                      {

                          FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set(
                              {
                                'username': username.text,
                                'firstname': FirstName.text,
                                'lastname': LastName.text,
                                'Phonenumber': phonenumber.text,
                                'created_date': FieldValue.serverTimestamp(),
                                'bag': [],
                                'wishlist': [],
                                'userId': user.user!.uid,
                              });
                          Navigator.pop(context);
                      },child: Text('accept'))
                        ],
                        );
                      });
                    });
                      }
                      else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password mismatch")));
                      }
                  },
              color: Colors.redAccent,
              elevation: 5,
              minWidth: MediaQuery.of(context).size.width * .5,
              child: Text('SignUp'),)
          ],
        ),
      ),
    );
  }
}
