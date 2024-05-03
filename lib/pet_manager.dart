import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:petpal/models/pet.dart';
import 'package:petpal/services/database.dart';

class PetManager {
  // Singleton instance
  static final PetManager _instance = PetManager._();

  static PetManager get instance => _instance;

  final _petAddedController = StreamController<Pet>.broadcast();
  Stream<Pet> get onPetAdded => _petAddedController.stream;

  List<Pet> _petList = [];
  List<Pet> get petList => _petList;

  final DatabaseService databaseService = DatabaseService();

  PetManager._() {
    _initializePetList();
  }

  //fetch data from Firestore
  Future<void> _initializePetList() async {
    List<Pet> fetchedPets = await databaseService.fetchPetsData();

    _petList = fetchedPets;
  }

  // Add pet
  void addPet({
    required String name,
    required String sex,
    required int age,
    required double weight,
    required File image,
    required String type,
  }) async {
    String imageUrl = await databaseService.uploadImageToFirebase(image);

    if (imageUrl.isNotEmpty) {
      int numId = math.Random().nextInt(100);

      Pet newPet = Pet(
        id: numId.toString(),
        weight: weight,
        image: imageUrl,
        type: type,
        name: name,
        age: age,
        sex: sex,
      );

      _petList.add(newPet);
      databaseService.addPetData(newPet);

      //notfy the ui
      if(onPetAdded != null){
        _petAddedController.add(newPet);
      }
    }
    else{
      print("Image URl is empty");
    }
  }

    void dispose() {
    _petAddedController.close();
  }

  // Delete pet
  void deletePet(String petId) {
    _petList.removeWhere((pet) => pet.id == petId);
    databaseService.deletePetData(petId);
  }

  // Update pet
  void updatePet(Pet updatedPet) {
    int index = _petList.indexWhere((pet) => pet.id == updatedPet.id);
    if (index != -1) {
      _petList[index] = updatedPet;
      databaseService.updatePetsData(updatedPet);
    }
  }
}
