import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order.dart';

class FoodApp extends StatefulWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title:const Center(child: Text('FOOD LIST',style: TextStyle(color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold),)),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height:250,
                width: 250,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text('NON VEG',
                        style: TextStyle(color:Colors.green,
                        fontSize: 20),

                      ),
                    ),
                    color: Colors.white,
                  ),
                ),

              ),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child:Padding(
                padding: const EdgeInsets.all(40.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Order()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                      image:DecorationImage(
                        image: NetworkImage('https://thumbs.dreamstime.com/b/indian-food-curry-butter-chicken-palak-paneer-chiken-tikka-biryani-vegetable-curry-papad-dal-palak-sabji-jira-alu-rice-138549925.jpg')
                      ,fit: BoxFit.fill)
                    ),

                  ),
                ),
              ) ,


            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Container(
                height: 70,
                width: 300,
                color: Colors.grey,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.brown, 
                      borderRadius: BorderRadius.circular(10)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.brown,
                        borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(color: Colors.brown,
                      borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
