import 'package:flutter/material.dart';



class InfoUser extends StatelessWidget {

  final String textt;
  final IconData icon;
  final VoidCallback onPressedd;

  InfoUser({required this.textt,
    required this.icon,
    required this.onPressedd

  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedd,
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        child: ListTile(
          leading: Icon(icon,color: Colors.teal,

          ),
          title: Text(
            textt,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20,

            ),
          ),
        ),
      ),
    ) ;
  }
}