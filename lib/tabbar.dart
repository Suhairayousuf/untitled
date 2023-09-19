import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Tablist extends StatefulWidget {
  const Tablist({Key? key}) : super(key: key);

  @override
  State<Tablist> createState() => _TablistState();
}

class _TablistState extends State<Tablist> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
      child:Scaffold(
      appBar: AppBar(
        title: Text('item list',style: TextStyle(color: Colors.black),),
        bottom: const TabBar(
          tabs: [

            Tab(text: 'Burger',),
            Tab(text: 'Pizza',),
            Tab(text: 'Ordered Items'),
        ],
        ),
      ),
        body: TabBarView(
          children: [
            Container(
              height: 100,

              color: Colors.white60,
              child: ListView(
                children:[

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0)
                        ),


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 190,
                                color: Colors.red,
                                child: Image.network('https://media.istockphoto.com/photos/jui'
                                    'cy-hamburger-on-white-background-picture-id1206323282?k=20&m=1206323282&s=612x612&w=0&h=yat'
                                    'lq6BHRCCvoTzFZLSwaJc0O8Quct_tRPWtH0dj9Fc=',fit: BoxFit.fill,),
                              ),
                            ),
                            Text('Chicken \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$150',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://media.istockphoto.com/phot'
                                  'os/burger-isolated-on-white-picture-id840902892?k=20&m=84'
                                  '0902892&s=612x612&w=0&h=QyhWATI6dWT7nAlpxWqmNVcU1_uLIQzKIOFYcrMA-UA=',fit: BoxFit.fill,),
                            ),
                            Text('Beef \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$150',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                            Colors.white,
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
                              child: Image.network('https://previews.123rf.com/images/rvlsoft/rvlsoft1708/rvlsoft170800003/83655665-healthy-vegan-burger-with-raw-vegetables-on-white-background.jpg',fit: BoxFit.fill,),
                            ),
                            Text('vegetable \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$100',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://thumbs.dreamstime.com/b/beef-burger-isolated-white-background-hamburger-single-fresh-classic-217013426.jpg',fit: BoxFit.fill,),
                            ),
                            Text('Steak \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$150',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://thumbs.dreamstime.com/b/crispy-chicken-burger-white-background-74761768.jpg',fit: BoxFit.fill,),
                            ),
                            Text('Zinger \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$150',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQahQDAyUW2h39ck-eWHGZ1nEia7L1mo5ZHRw&usqp=CAU',fit: BoxFit.fill,),
                            ),
                            Text('paneer \nburger',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$200',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],

              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.white60,
              child: ListView(
                children:[

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0)
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
                              child: Image.network('https://previews.123rf.com/images/gbh007/gbh0071408/gbh007140800039/30406006-pepperoni-pizza-on-white-background.jpg',fit: BoxFit.fill,),
                            ),
                            Text('Pepparoni \n pizza',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$400',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://previews.123rf.com/images/photopips/photopips1109/photopips110900560/10596045-%E7%99%BD%E3%81%84%E8%83%8C%E6%99%AF%E3%81%AE%E4%B8%8A%E3%81%AE%E3%82%A4%E3%82%BF%E3%83%AA%E3%82%A2%E3%81%AE%E3%83%94%E3%82%B6.jpg',fit: BoxFit.fill,),
                            ),
                            Text('italian \nPizza',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$300',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://previews.123rf.com/images/valentinarr/valentinarr1311/valentinarr131100015/23803690-pizza-schnitte-mit-verschiedenen-bel%C3%A4gen-auf-wei%C3%9Fem-hintergrund-.jpg',fit: BoxFit.fill,),
                            ),
                            Text('Pizza \n Slice',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$100',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                              child: Image.network('https://media.istockphoto.com/photos/pizza-margarita-with-cheese-top-view-isolated-on-white-background-picture-id1168754685?k=20&m=1168754685&s=612x612&w=0&h=XauWtcSx53Ey0yswLWggNGQi7gmTjba0TXloXO4NAIs=',fit: BoxFit.fill,),
                            ),
                            Text('Cheese \nPizza',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$300',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.white60,
              child: ListView(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0)
                        ),
                        height: 190,
                        width: 190,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text('Your Orders',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                            Container(
                              height: 130,
                              width: 150,
                              color: Colors.red,
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmApJ-VMhbGbmC7rb9z9wpyxm-PFWYTcrMyg&usqp=CAU',fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),






                ],

              ),
            ),



        ],

        ),
      ),
    );
  }
}
