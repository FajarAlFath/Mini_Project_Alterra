import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';
import '../../../components/input.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({
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
  final myName = TextEditingController();
  final myPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset('assets/img/register.svg'),
                  const SizedBox(height: 10),
                  //USERNAME
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
                  InputContainer(
                    child: TextField(
                      controller: myName,
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.face_rounded,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Name',
                          border: InputBorder.none),
                    ),
                  ),
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
                        'SIGNUP',
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
      ),
    );
  }
}
