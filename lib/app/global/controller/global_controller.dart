import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PositionController {
  getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Serviço de localização ativado no celular
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço de localização não habilitado.');
    }

    //Pedir e checar permissão de localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização recusada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Permissão de localização recusadda permanente, nós não podemos requisitar a permissão.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  double getDistancia(
      double Userlat, double Userlong, double Farmlat, Farmlong) {
    return Geolocator.distanceBetween(Userlat, Userlong, Farmlat, Farmlong);
  }

  //Pegar a cidade por latitude e longitude
  Future<String> getCidade(Position posUser) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(posUser.latitude, posUser.longitude);
    return placemarks[1].subAdministrativeArea!;
  }

  //Pegar o estado pela latitude e longitude
  Future<String> getEstado(Position posUser) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(posUser.latitude, posUser.longitude);
    return placemarks[1].administrativeArea!;
  }

  double getFrete(double distancia, double frete) {
    if (distancia < 1) {
      return frete;
    } else {
      return distancia.round() * frete;
    }
  }
}
