import 'package:petpal/models/pet.dart';

class PetFactory{
  static Pet createPet({
    required String name,
    required String sex,
    required int age,
    required double weight,
    required String image,
    required String type,
  }){
     return Pet(
      id: '',
      name: name,
      sex: sex,
      age: age,
      weight: weight,
      image: image,
      type: type,
    );
  }
}