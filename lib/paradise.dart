import 'package:flutter/material.dart';
class Paradise extends StatefulWidget {
  const Paradise({Key? key}) : super(key: key);

  @override
  State<Paradise> createState() => _ParadiseState();
}

class _ParadiseState extends State<Paradise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
      title: Text('STACK',style: TextStyle(color: Colors.black,fontSize: 30),),
    ),
      body: Stack(
           clipBehavior: Clip.none,
           children: [
           Container(
            color: Colors.lightBlue,
            height: 150,
          ),
           Positioned(
             bottom: -30,
               left: 0,
               right: 0,
               child: Center(
                 child: Container(
             height: 100,
             width: 80,
             decoration: BoxDecoration(color: Colors.pink,
                   borderRadius: BorderRadius.circular(10),
                 boxShadow: [BoxShadow(
                   color: Colors.pinkAccent,
                   spreadRadius: 5.0,
                 ),],
                   image: DecorationImage(
                   image: NetworkImage('https://encrypted-tbn0.gstati'
                       'c.com/images?q=tbn:ANd9GcS3YdPBz9QbF1O7jG4GaLW5bZLmD'
                       'ucacYvoRg&usqp=CAU',),fit: BoxFit.cover
             )
           ),
         ),
               )
           )
        ],
      ),


    );
  }
}
