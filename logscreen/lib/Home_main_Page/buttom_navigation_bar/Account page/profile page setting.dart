import 'package:flutter/material.dart';

class profilesettings extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;


  profilesettings({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.06,
      margin: const EdgeInsets.all(13),
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),
          textAlign: TextAlign.justify,
        ),
        leading: Icon(leadingIcon, color: Colors.black,size: 22,),
        trailing: Icon(trailingIcon, color: Colors.black),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),

      ),
    );
  }
}