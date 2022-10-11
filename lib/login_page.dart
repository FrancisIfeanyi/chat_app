import 'package:chatup_app/utils/spaces.dart';
import 'package:chatup_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('login successful');
    } else {
      print('login unsuccessful');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _mainUrl = 'https://www.linkedin.com/in/success-ifeanyi-475489114';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   'Let\'s Sign you in',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Colors.blueGrey,
              //     fontSize: 30,
              //     fontWeight: FontWeight.w500,
              //     letterSpacing: 0.5,
              //   ),
              // ),
              // Text(
              //   'Welcome Back! \n  You\'ve been Missed!!!',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              // ),
              Image.asset(
                'assets/logos/chat223.png',
                height: 150,
                width: 90,
              ),
              verticalSpacing(10),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: 'Enter Your Username',
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return 'Your username should be morethan 5 characters';
                        } else if (value != null && value.isEmpty) {
                          return 'Please type your username';
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(16),
                    LoginTextField(
                      controller: passwordController,
                      hintText: 'Type your password',
                      hasAsterisks: true,
                    ),
                  ],
                ),
              ),
              verticalSpacing(16),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: Text(
                    'login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  )),
              GestureDetector(
                onTap: () async {
                  print('link clicked');
                  if (!await launch(_mainUrl)) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('find us on'),
                    Text(_mainUrl),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(Buttons.LinkedIn, mini: true, onPressed: () {
                        _showButtonPressDialog(context, 'LinkedIn (mini)');
                      }),
                      SignInButton(
                        Buttons.Apple,
                        mini: true,
                        onPressed: () {
                          _showButtonPressDialog(context, 'Apple');
                        },
                      ),
                      SignInButton(Buttons.Twitter, mini: true, onPressed: () {
                        _showButtonPressDialog(context, 'Twitter (mini)');
                      }),
                      SignInButton(Buttons.GitHub, mini: true, onPressed: () {
                        _showButtonPressDialog(context, 'GitHub (mini)');
                      }),
                    ],
                  ),
                  SignInButton(Buttons.Facebook, onPressed: () {
                    _showButtonPressDialog(context, 'Facebook (mini)');
                  }),
                  SignInButton(
                    Buttons.GoogleDark,
                    onPressed: () {
                      _showButtonPressDialog(context, 'Google (dark)');
                    },
                  ),
                  // SignInButtonBuilder(
                  //     icon: Icons.email,
                  //     text: "Ignored for mini button",
                  //     mini: true,
                  //     onPressed: () {
                  //       _showButtonPressDialog(context, 'Email (mini)');
                  //     },
                  //     backgroundColor: Colors.cyan)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
}
