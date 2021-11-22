import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma_app/app/modules/mapa/mapa_controller.dart';

class Mapa extends GetView<MapaController> {
  List<Marker> mark = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        (value) => Container(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(value.latitude, value.longitude),
                    zoom: 15.0),
                onTap: addMark,
                markers: Set.from(mark),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Text(
                    'Toque na posição do endereço no mapa',
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 175, 180), fontSize: 18),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: 200,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        if (mark.length > 0) {
                          Get.back(result: [
                            mark.first.position.latitude,
                            mark.first.position.longitude
                          ]);
                        } else {
                          Get.defaultDialog(
                              title: 'Erro',
                              middleText:
                                  'Clique no mapa para definir a posição do endereço');
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 49, 175, 180)),
                      child: Text(
                        'Confirmar Localização',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addMark(LatLng pos) {
    mark = [];
    mark.add(
      Marker(markerId: MarkerId('toque'), position: pos),
    );
    controller.mapaView();
  }
}
