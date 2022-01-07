import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback pressHandler;
  final String type;
  final String title;

  const AppButton({ Key? key, required this.pressHandler, required this.type, required this.title }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = type == 'light' ? ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(10, 132, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ) : ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(44, 44, 46, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: style,
        onPressed: pressHandler,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}