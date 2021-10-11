import 'package:pharma_app/models/modelFarmacia.dart';

abstract class IFarmaciaRepository {
  Future<List<Farmacia>> findAllUsers();
}
