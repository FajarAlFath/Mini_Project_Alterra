import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Slider extends StatelessWidget {
  const Slider({super.key, required this.title, required this.description, required this.image});

  final String title;
  final String description;
  final String image;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            image,
            width: width*0.6,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(padding: 
          const EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            description,
            style: const TextStyle(
              height: 1.5,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              letterSpacing: 0.7,
            ),
            textAlign: TextAlign.center,
          ),),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}