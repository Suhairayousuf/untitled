import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Dynm extends StatefulWidget {
  const Dynm({Key? key}) : super(key: key);
  @override
  State<Dynm> createState() => _DynmState();
}
class _DynmState extends State<Dynm> {
  List<Map<String,dynamic>>burger=[
    {
      'image':'https://media.istockphoto.com/photos/jui'
          'cy-hamburger-on-white-background-picture-id1206323282?k=20&m=1206323282&s=612x612&w=0&h=yat'
          'lq6BHRCCvoTzFZLSwaJc0O8Quct_tRPWtH0dj9Fc=',
      'name':'chicken burger',
      'price':150.00,
    },
    {
      'image':'https://media.istockphoto.com/phot'
          'os/burger-isolated-on-white-picture-id840902892?k=20&m=84'
          '0902892&s=612x612&w=0&h=QyhWATI6dWT7nAlpxWqmNVcU1_uLIQzKIOFYcrMA-UA=',
      'name':'chicken burger',
      'price':200.00,
    },
    {
      'image':'https://media.istockphoto.com/photos/jui'
          'cy-hamburger-on-white-background-picture-id1206323282?k=20&m=1206323282&s=612x612&w=0&h=yat'
          'lq6BHRCCvoTzFZLSwaJc0O8Quct_tRPWtH0dj9Fc=',
      'name':'chicken burger',
      'price':300.00,
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic list vew'),
      ),
      body:ListView.builder(
        itemCount:burger.length,

        itemBuilder: (context,index){
          Map<String,dynamic>item=burger[index];
          return  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 190,
                width: 190,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 130,
                      width: 150,
                      color: Colors.red,
                      child: Image.network(item['image'],fit: BoxFit.fill,),
                    ),
                    Text(item['name'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    Text(item['price'].toString(),style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          );
        }

      )



    );
  }
}
