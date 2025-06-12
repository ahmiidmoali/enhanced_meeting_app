import 'package:flutter/material.dart';

class customTextFormAuth extends StatelessWidget {
  final String lable;
  final String hint;
  final IconData? icon;
  final TextEditingController? myController;
  final String? Function(String?)? vaild;
  final bool isNumber;
  final bool? obscureText;
  final Function()? onPressedIcon;
  final Color? fillColor;
  const customTextFormAuth(
      {super.key,
      required this.lable,
      required this.hint,
      required this.icon,
      required this.myController,
      this.vaild,
      required this.isNumber,
      this.obscureText,
      this.onPressedIcon,
      required this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        validator: vaild,
        controller: myController,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(lable)),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 15),
            suffixIcon: IconButton(
              icon: Icon(icon),
              onPressed: onPressedIcon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
