import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/google_sign.dart';
import 'package:untitled/products.dart';
import 'package:untitled/singlepage.dart';

import 'Loginpage.dart';
import 'Loginpage.dart';

import 'Signup.dart';
String name='';
String mail='';
String photo='';
String id='';
String currentuserid='';
  String currentuser='';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override

  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  late TextEditingController Username;
  late TextEditingController Password;
  void initState() {
    super.initState();
    Username = TextEditingController(text: '');
    Password = TextEditingController(text: '');
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 300,
              color: Colors.blueAccent,
              child: TextFormField(
                controller: Username,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: 'Username',
                    prefixIcon: Icon(Icons.person,color: Colors.black,)),
              )
            ),
            SizedBox(height: 20,),

            Container(
              height: 40,
              width: 300,
              color: Colors.blueAccent,
                child: TextFormField(
                  controller: Password,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Password',
                      prefixIcon: Icon(Icons.password,color: Colors.black,)),
                )
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){

                FirebaseAuth.instance.signInWithEmailAndPassword(email: Username.text, password: Password.text,).then((value){

                  currentuserid=value.user!.uid;
                  currentuser=Username.text;
                  print(currentuserid);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Product()));
                }).catchError((err){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));

                });
                },
              child: Container(

                height: 45,
                width: 230,
                color: Colors.white,
                child: Center(child: Text('Login',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account?',style: TextStyle(color: Colors.white,fontSize: 15),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                    child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 15),)),

              ],
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () async {
                // function to implement the google signin

// creating firebase instance
                final FirebaseAuth auth = FirebaseAuth.instance;


                  final GoogleSignIn googleSignIn = GoogleSignIn();
                  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                  if (googleSignInAccount != null) {
                    final GoogleSignInAuthentication googleSignInAuthentication =
                    await googleSignInAccount.authentication;
                    final AuthCredential authCredential = GoogleAuthProvider.credential(
                        idToken: googleSignInAuthentication.idToken,
                        accessToken: googleSignInAuthentication.accessToken);
                    // Getting users credential
                    UserCredential result = await auth.signInWithCredential(authCredential);
                    User? user = result.user;
                    currentuserid=user!.uid;
                    if (result != null) {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => Product()));
                    }
                    // if result not null we simply call the MaterialpageRoute,
                    // for go to the HomePage screen
                    FirebaseFirestore.instance.collection('logindata').add(
                      {
                        'name':googleSignInAccount.displayName,
                        'email':googleSignInAccount.email,
                        'img':googleSignInAccount.photoUrl,
                      }
                    );
                    name=googleSignInAccount.displayName!;
                    mail=googleSignInAccount.email;
                    photo=googleSignInAccount.photoUrl!;
                //    id=googleSignInAccount.id;
                  }
              },
              child: Container(
                height: 50,
                width: 290,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(20),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(   color: Colors.red,
                        image: DecorationImage(image:
                        NetworkImage('https://blog.hubspot.com/hubfs/image8-2.jpg'),fit: BoxFit.fill),
                      ),
                    ),
                    Text('Signin with Google',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),)
                  ],
                ),

              ),
            ),

          ],
        ),

      ),

    );
  }
}
