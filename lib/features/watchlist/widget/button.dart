import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onTap;
  const ColorButton({super.key, required this.color, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,width: 140,
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(5),
          color: color
        ),
        child: Center(
          child: Text(title,style: TextStyle(color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
}