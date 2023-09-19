import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/rendering/sliver_staggered_grid.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:untitled/singlepage.dart';
class Stagg extends StatefulWidget {
  const Stagg({Key? key}) : super(key: key);

  @override
  State<Stagg> createState() => _StaggState();
}

class _StaggState extends State<Stagg> {
  // List<Map<String,dynamic>>sweets=[
  //   {
  //     'image':'https://handletheheat.com/wp-content/uploads/2015/03/Best-Birthday-Cake-with-milk-chocolate-buttercream-SQUARE.jpg',
  //     'name':'cake',
  //     'price':150.00,
  //   },
  //   {
  //     'image':'https://media.istockphoto.com/phot'
  //         'os/burger-isolated-on-white-picture-id840902892?k=20&m=84'
  //         '0902892&s=612x612&w=0&h=QyhWATI6dWT7nAlpxWqmNVcU1_uLIQzKIOFYcrMA-UA=',
  //     'name':'chicken burger',
  //     'price':200.00,
  //   },
  //   {
  //     'image':'https://media.istockphoto.com/photos/jui'
  //         'cy-hamburger-on-white-background-picture-id1206323282?k=20&m=1206323282&s=612x612&w=0&h=yat'
  //         'lq6BHRCCvoTzFZLSwaJc0O8Quct_tRPWtH0dj9Fc=',
  //     'name':'chicken burger',
  //     'price':300.00,
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Special Meals'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('newProducts').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            {
              return CircularProgressIndicator();
            }
          var product=snapshot.data?.docs;
          return GridView.builder(
            itemCount: product?.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              // Map<String, dynamic>item = sweets[index];
              return InkWell(
                onTap:
              (){Navigator.push(context, MaterialPageRoute(builder: (context) => Single(
                id: product![index].id,)));
    },
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 200,
                        width: 200,
                        color: Colors.blueGrey,
                        child: Image.network(product![index]['img'],fit: BoxFit.fill,),
                      ),
                      Text(product[index]['name'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                      Text(product[index]['Price'].toString(),style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              );
            },
            //shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount:2,
                 crossAxisSpacing: 8,
                 mainAxisSpacing: 8,
                  childAspectRatio: 0.7
                ),
          );
        }
      ),

    );

  }
}
