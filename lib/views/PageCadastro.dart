import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharma_app/views/FormUsuario.dart';
import 'package:pharma_app/views/FormFarmacia.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 2,
                  effect: JumpingDotEffect(
                    dotColor: Colors.white,
                    paintStyle: PaintingStyle.stroke,
                    activeDotColor: Colors.white,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            )
          ],
        ),
      ),
    );
  }
}
