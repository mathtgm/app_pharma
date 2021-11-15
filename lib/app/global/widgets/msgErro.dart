import 'package:flutter/material.dart';

class msgErro {
  Widget telaErro(String mensagem, String image) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
            width: 300,
          ),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 49, 175, 180)),
          )
        ],
      ),
    );
  }
}
