import 'package:betweenapp/Home/UserInformation.dart';
import 'package:flutter/material.dart';





const url="https://meshivanshsingh.me";
const email="Dohaqatar5546@icloud.com";
const phone="+967773954360";
const location="Sana'a, Yemen";
const password="Software690";


class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white10,
     body: SafeArea(
       minimum: const EdgeInsets.only(top: 100),
       child: Column(
         children:<Widget> [

           CircleAvatar(

             radius: 110,
             backgroundImage: AssetImage('images/R.jpg'),
           ),
           Text("David Watson",
             style: TextStyle(
                 fontSize: 40.0,
                 color: Colors.black,
                 fontWeight: FontWeight.bold
             ),
           ),



           InfoUser(textt: email, icon: Icons.mail_outline, onPressedd:()async {}),
           InfoUser(textt: password, icon: Icons.lock_outline, onPressedd:()async {}),
           InfoUser(textt: phone, icon: Icons.phone, onPressedd:()async {}),
           InfoUser(textt: url, icon: Icons.web, onPressedd:()async {}),
           InfoUser(textt: location, icon: Icons.location_city, onPressedd:()async {}),
         ],
       ),
     ),

   );
  }
}
