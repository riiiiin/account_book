import 'package:flutter/material.dart';

enum ButtonSize {
  small,
  large,
}

class MyButton extends StatelessWidget {
  final size;
  final String text;
  final VoidCallback? onPressed;

  // コンストラクタで引数を受け取る
  const MyButton({
    super.key,
    required this.size,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size == ButtonSize.small ? 135 : 328,
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF373a4d)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 14,
            ),
          ),
        ));
  }
}
