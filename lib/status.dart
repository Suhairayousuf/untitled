import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/products.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          height: 250,
          width: 500,
          color: Color(0xfffbd04e),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: //Icon(Icons.cancel,size: 30,),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                            size: 40,
                          )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Your Order Status \n is processing',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.access_time,
                      size: 40,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'it could take up to 5 minutes\n You will be notified when the order is \nconfirmed by staff',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )),
      Column(children: [
        Card(
          child: Container(
              height: 120,
              width: 400,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      width: 90,

                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              'images/food.jpg',
                            ),
                            fit: BoxFit.fill,
                            // image: NetworkImage('https://media.istockphoto.com/photos/close-up-of-kebab-sandwich-picture-id851493796?k=20&m=851493796&s=612x612&w=0&h=jet3Ej7Is9w4KdnqixO4ApvvHfd8jlGGawzqI3CrsDQ=',),fit: BoxFit.fill,
                          )),

                      // Image.network('https://media.istockphoto.com/photos/close-up-of-kebab-sandwich-picture-id851493796?k=20&m=851493796&s=612x612&w=0&h=jet3Ej7Is9w4KdnqixO4ApvvHfd8jlGGawzqI3CrsDQ=',fit: BoxFit.fill,),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Doner',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Medium size\nOrange sause\n2xLambmins')
                        ],
                      ),
                    ),
                    Text(
                      'rs 5',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
        Card(
          child: Container(
              height: 120,
              width: 400,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                            image: NetworkImage(
                              'https://media.istockphoto.com/photos/turkis'
                                  'h-kofta-with-fresh-vegetables-on-a-flat-bread-closeup-picture-i'
                                  'd627840330?s=612x612',
                                  ), fit: BoxFit.fill,)
                          ),
                          width: 90,

                        ),
                        SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'kefta',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Medium size\nOrange sause')
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      'rs 150',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                height: 120,
                width: 400,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,top: 10),
                          child: Container(

                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.foodrepublic.com/wp-content/uploads/2013/01/tagine.jpeg',),
                                fit: BoxFit.fill,
                                )
                              )
                            ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Merquez',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text('Medium size\nwhite sause\n')
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        'rs 200',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Payment should be performed during\n picking upof order in restaurent',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'Rs 5',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('when you want order to be done',
                    style: TextStyle(
                      fontSize: 10,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                '14.30',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Color(0xfffbd04e), borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Text(
            'Ok,got it.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
      )
    ]));
  }
}
