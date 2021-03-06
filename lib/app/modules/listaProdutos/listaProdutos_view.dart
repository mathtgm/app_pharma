import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_app/app/data/model/modelProduto.dart';
import 'package:pharma_app/app/modules/listaProdutos/listaProdutos_controller.dart';
import 'package:pharma_app/app/routes/app_routes.dart';

class ListaProdutosFarmacia extends GetView<ListaProdutosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.carrinho, arguments: Get.arguments);
        },
        label: Text('Ver carrinho'),
        icon: Icon(Icons.shopping_cart_rounded),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 49, 175, 180),
              ),
            );
          },
        ),
        title: Text(
          "PharmApp",
          style: TextStyle(
              color: Color.fromARGB(255, 49, 175, 180),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: controller.obx(
        (list) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            farmaciaCard(),
            botaoAjuda(),
            Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 202),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Produto prod = list[index];
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.produto, arguments: prod.toMap());
                      },
                      child: Stack(
                        children: [
                          prodCardContent(prod),
                          Hero(
                              tag: prod.id_produto,
                              child: prodImage(prod.imagem))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        onError: (err) => Text(err!),
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/results-not-found.png",
                height: 300,
                width: 300,
              ),
              Text(
                'A farmacia n??o tem nenhum produto cadastrado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 175, 180),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget prodImage(String? imagem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        child: imagem == null
            ? Image.asset(
                'assets/produto_default.png',
                width: 100,
              )
            : Image.network(
                imagem,
                width: 100,
                errorBuilder: (context, exception, stackTrace) {
                  return Image.asset(
                    'assets/produto_default.png',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  );
                },
              ),
      ),
    );
  }

  Widget prodCardContent(Produto prod) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 50.0, 0, 0),
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Text(
              prod.nome,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                color: Color.fromARGB(255, 49, 175, 180),
                fontSize: 20,
              ),
            ),
            Text(
              prod.descricao == null
                  ? prod.descricao = '\n\n'
                  : prod.descricao!,
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: true,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 175, 180),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                "R\$ " +
                    num.parse(prod.preco_unid.toString())
                        .toStringAsFixed(2)
                        .replaceAll('.', ','),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget farmaciaCard() {
    double dist = (controller.location.getDistancia(
            controller.distUser.latitude,
            controller.distUser.longitude,
            Get.arguments['lat'],
            Get.arguments['long']) /
        1000);
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          child: Get.arguments['foto'] == null
              ? Image.asset(
                  'assets/StandartIcon.png',
                  fit: BoxFit.cover,
                )
              : Image.network(
                  Get.arguments['foto'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stackTrace) {
                    return Image.asset(
                      'assets/StandartIcon.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    );
                  },
                ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Get.arguments['nome_fantasia'],
                style: TextStyle(
                  color: Color.fromARGB(255, 49, 175, 180),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      dist.toPrecision(1).toString() + ' Km',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      ' ??? ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      Get.arguments['tempo'] + ' min',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                'Frete: R\$ ' +
                    (Get.arguments['frete'] == 0
                        ? 'GR??TIS'
                        : controller.location
                            .getFrete(dist, Get.arguments['frete'])
                            .toStringAsFixed(2)
                            .replaceAll('.', ',')),
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget botaoAjuda() {
    return Container(
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 49, 175, 180),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: () {
          Get.toNamed(Routes.farmaceutico,
              arguments: Get.arguments['id_farmacia']);
        },
        child: SizedBox(
          width: Get.width,
          child: Text(
            'Pedir ajuda',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
