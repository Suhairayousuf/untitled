import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text('Items ordered',
            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold
          ),
      ),
        ),
      ),
      body:selectedIndex==0?Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.green,
              ),
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.green,
              )



            ],
          ),
        ],
      ):selectedIndex==1?Container(color: Colors.red,):Container(color: Colors.green,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
       onTap: (i){
       setState(() {
         print(i);
       selectedIndex=i;
});
      },
      items:  <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.call),
    label: 'Calls',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.camera),
    label: 'Camera',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.chat),
    label: 'Chats',
    ),
    ],
        selectedItemColor:
        selectedIndex==0?Colors.blue:selectedIndex==1?Colors.red:Colors.green,
    ),
    );
  }
}
