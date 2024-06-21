import 'package:flutter/material.dart';

class TextButtonWithIconWidget extends StatelessWidget {
  IconData myIconData;
  MaterialColor myIconColor;
  Color myButtonColor;
  void Function()? myPressedOnFunction;
  String myTextInButton;
  TextButtonWithIconWidget(
      {super.key,
      required this.myIconData,
      required this.myIconColor,
      required this.myButtonColor,
      required this.myPressedOnFunction,
      required this.myTextInButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            myIconData,
            color: myIconColor,
            size: 40,
          ),
        ),
        TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(myButtonColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rectangle shape
                ),
              ),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15), // Add some space around the text
              ),
            ),
            onPressed: myPressedOnFunction,
            child: Text(
              myTextInButton,
              style: const TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
