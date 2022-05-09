import 'package:e_mading/components/slider.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List<Widget> _pages = [
    const SliderPage(
      title: '',
      description: 'Welcome to E-Mading Politeknik Negeri Lhokseumawe',
      image: 'assets/img/1.svg',
      tinggi: 0,
      tinggi2: 0,
    ),
    const SliderPage(
      title: 'on-boarding1',
      description:
          'E-Mading Politeknik Negeri Lhokseumawe is a news and article platform for all students in Politeknik Negeri Lhokseumawe. With this App you can update any information or news in Politeknik Negeri Lhokseumawe',
      image: 'assets/img/2.svg',
      tinggi: 50,
      tinggi2: 20,
    ),
    const SliderPage(
      title: 'on boarding 2',
      description:
          'whith E-Mading you can also add your own personal article to share around community in campus. Add your creativity and improve your writing skill',
      image: 'assets/img/3.svg',
      tinggi: 70,
      tinggi2: 5,
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, index) => _pages[index],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.yellow
                            : Colors.yellow.withOpacity(0.5)),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(duration: 
                  const Duration(milliseconds: 800),
                  curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  height: 70,
                  width: (_currentPage == (_pages.length - 1))? 200 : 75,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(35)),
                    child: (_currentPage == (_pages.length - 1))? 
                    const Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,fontSize: 20,
                    ),) : const Icon(
                      Icons.navigate_next,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
            ],
          ),
        ],
      ),
    );
  }
}
