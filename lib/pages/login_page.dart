import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'sighup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(
              //     'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png',
              //     fit: BoxFit.cover,
              //   ),
              // ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                ),
                height: 150,
                width: 150,
                alignment: Alignment.center,
                child: Text(
                  'hulu',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    TextFormField(
                      onChanged: (value) {
                        username = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'error username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        label: Text(
                          'username',
                        ),
                        hintText: 'Enter your username',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    // customTextFormField(
                    //     text: 'username',
                    //     icon: Icon(
                    //       Icons.person,
                    //       color: Colors.black,
                    //     )),
                    // const SizedBox(height: 10),
                    // customTextFormField(
                    //     text: 'password',
                    //     icon: Icon(
                    //       Icons.lock,
                    //       color: Colors.black,
                    //     )),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'error password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        label: Text(
                          'password',
                        ),
                        hintText: 'Enter your password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              // side: BorderSide(color: Colors.red),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {}

                          try {
                            var user =
                                await auth.createUserWithEmailAndPassword(
                                    email: username, password: password);
                          } catch (e) {
                            print('-----> $e');
                          }
                        },
                        child: Text('Login')),
                    const SizedBox(height: 10),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HomePage.id);
                      },
                      child: Text('Next'),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'dont\t have an account ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SighUpPage.id);
                          },
                          child: Text(
                            '   Register',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customTextFormField({String? text, Icon? icon}) {
  return TextFormField(
    onChanged: (value) {},
    validator: (value) {
      if (value!.isEmpty) {
        return 'error $text';
      }
      return null;
    },
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(50.0),
      ),
      prefixIcon: icon,
      label: Text(
        '$text',
      ),
      hintText: 'Enter your $text',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(50.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        borderRadius: BorderRadius.circular(50.0),
      ),
    ),
  );
}
