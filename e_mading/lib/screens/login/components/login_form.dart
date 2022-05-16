import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';
import '../../../components/input.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final myUsername = TextEditingController();
  final myPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 40),
                SvgPicture.asset('assets/img/login.svg'),
                const SizedBox(height: 40),
                //USERNAME INPUT CONTAINER
                InputContainer(
                  child: TextField(
                    controller: myUsername,
                    cursorColor: kPrimaryColor,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.mail,
                          color: kPrimaryColor,
                        ),
                        hintText: 'username',
                        border: InputBorder.none),
                  ),
                ),
                //PASSWORD INPUT CONTAINER
                InputContainer(
                    child: TextField(
                  controller: myPassword,
                  cursorColor: kPrimaryColor,
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock, color: kPrimaryColor),
                      hintText: 'password',
                      border: InputBorder.none),
                )),
                const SizedBox(height: 10),
                //BUTTON SEND
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kPrimaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
