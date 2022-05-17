import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';
import '../../../components/input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
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

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formkey = GlobalKey<FormState>();
  late final String myUsername;
  late final String myPassword;

  bool cekInput() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void ProsesLogin() {
    try {
      if (cekInput()) {}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.size.width,
          height: widget.defaultLoginSize,
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
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      InputContainer(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email masih kosong';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            myUsername == value;
                          },
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
                          child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password masih kosong';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          myPassword == value;
                        },
                        cursorColor: kPrimaryColor,
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.lock, color: kPrimaryColor),
                            hintText: 'password',
                            border: InputBorder.none),
                      )),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                //BUTTON SEND
                InkWell(
                  onTap: () {
                    ProsesLogin();
                    Navigator.pushNamed(context, '/navbar');
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: widget.size.width * 0.8,
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
