import 'package:betweenapp/Home/OrdersPage.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





//في هذه الدالة يوجد بها العروض التي تكون في الصفحة الرئيسية على شكل عرض شرائح ويوجد به الازرار التي بها تنقلنا للصفحة العروض و صفحة الطلبات
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    body:
    ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions( autoPlay: true,height: 250.0),
            items: [

            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Image.network(i),
                  );
                },
              );
            }).toList(),
          ),





          Padding(
     padding: const EdgeInsets.all(100.0),
     child: Container(
       margin: EdgeInsets.all(0),
       child:Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children:<Widget> [
          FlatButton(
            child: const Text("Orders"),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrdersPage()
)
);
          },
          ),


  ]
       )
        ),
   )
  ]
    ),
  );

}

