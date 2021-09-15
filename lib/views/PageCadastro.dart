import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharma_app/views/FormUsuario.dart';
import 'package:pharma_app/views/FormFarmacia.dart';

class pageCadastro extends StatefulWidget {
  const pageCadastro({Key? key}) : super(key: key);

  @override
  _pageCadastroState createState() => _pageCadastroState();
}

class _pageCadastroState extends State<pageCadastro> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 175, 180),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                formUser(),
                formFarm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
