import 'package:flutter/material.dart';

import 'home_page.dart';

class SighUpPage extends StatefulWidget {
  SighUpPage({super.key});
  static String id = 'SighUpPage';
  @override
  State<SighUpPage> createState() => _SighUpPageState();
}

class _SighUpPageState extends State<SighUpPage> {
  var formKey = GlobalKey<FormState>();
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

              Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // TextFormField(
                    //   onChanged: (value) {},
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'error username';
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.person,
                    //     ),
                    //     label: Text(
                    //       'username',
                    //     ),
                    //     hintText: 'Enter your username',
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //     ),
                    //   ),
                    // ),
                    customTextFormField(
                        text: 'username',
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.black,
                        )),

                    const SizedBox(height: 10),
                    customTextFormField(
                        text: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 10),
                    customTextFormField(
                        text: 'age',
                        icon: Icon(
                          Icons.equalizer,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 10),
                    customTextFormField(
                        text: 'password',
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    customTextFormField(
                        text: 'Favorite',
                        icon: Icon(
                          Icons.border_inner,
                          color: Colors.black,
                        )),
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text('Sign Up')),
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
                          'have an account ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '   Login',
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
