import 'package:firebase_sample/utils/styles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String placeholder;
  final bool isPassword;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.placeholder,
    required this.isPassword,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 328.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.labelText,
                style: const TextStyle(
                    fontSize: 12, color: primaryColor, fontFamily: 'Roboto'),
              ),
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: widget.controller,
                  obscureText: widget.isPassword ? obscureText : false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.placeholder,
                    filled: true,
                    fillColor: paleSecondaryColor,
                  ),
                ),
                Visibility(
                  visible: widget.isPassword,
                  child: Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
