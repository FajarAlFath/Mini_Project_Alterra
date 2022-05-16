import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/constants.dart';
import '../../../components/input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final String myUsername;
  late final String myPassword;
  late final String myName;
  final formkey = GlobalKey<FormState>();

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
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widget.size.width,
            height: widget.defaultLoginSize,
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
                  Form(
                    key: formkey,
                    child: Column(children: [
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
                      InputContainer(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama masih kosong';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            myUsername == value;
                          },
                          cursorColor: kPrimaryColor,
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: 'Nama',
                              border: InputBorder.none),
                        ),
                      ),
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
                    ]),
                  ),
                  const SizedBox(height: 10),
                  //BUTTON SEND
                  InkWell(
                    onTap: () {},
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
