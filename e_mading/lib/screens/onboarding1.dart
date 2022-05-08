import 'package:flutter/material.dart';
import '../components/slider.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();
  
  List<Widget>_pages = [
    Slider(
      title: title, description: description, image: image)
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );  
  }
}