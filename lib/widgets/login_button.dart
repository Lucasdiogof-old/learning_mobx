import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  Function onPressed;

  LoginButton({onPressed});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      height: 50,
      width: width/1.5,
      child: RaisedButton(
        color: Colors.pink,
        disabledColor: Colors.pink.withAlpha(150),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: onPressed,
        child: Text(
          "Cadastrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
