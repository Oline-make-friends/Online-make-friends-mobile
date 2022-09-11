import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.buttonColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
            color: buttonColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
