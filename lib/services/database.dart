import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petpal/models/pet.dart';

//DatabaseService class handles interactions with Firestore and provides
//methods to fetch, update, and delete pet data in the database.

class DatabaseService {
  final CollectionReference petCollection =
      FirebaseFirestore.instance.collection('pets');

  // Create or add new pet
  Future<void> addPetData(Pet pet) async {
    try {
      await petCollection.add({
        'name': pet.name,
        'sex': pet.sex,
        'age': pet.age,
        'weight': pet.weight,
        'image': pet.image,
        'type': pet.type,
      });
    } catch (e) {
      print("Error adding pet data: $e");
    }
  }

  //fetch
  Future<List<Pet>> fetchPetsData() async {
    try {
      QuerySnapshot querySnapshot = await petCollection.get();
      List<Pet> petList = [];

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        Pet pet = Pet(
          id: document.id,
          name: data['name'] ?? '',
          sex: data['sex'] ?? '',
          age: data['age'] ?? 0,
          weight: data['weight'] ?? 0.0,
          image: data['image'] ?? '',
          type: data['type'] ?? '',
        );
        petList.add(pet);
      }
      return petList;
    } catch (e) {
      print('Error fetching pet data: $e');
      return [];
    }
  }

  //update
  Future<void> updatePetsData(Pet pet) async {
    try {
      await petCollection.doc(pet.id).set({
        'name': pet.name,
        'sex': pet.sex,
        'age': pet.age,
        'weight': pet.weight,
        'image': pet.image,
        'type': pet.type,
      });
    } catch (e) {
      print("Error updating pet data: $e");
    }
  }

  //delete
  Future<void> deletePetData(String petId) async {
    try {
      await petCollection.doc(petId).delete();
    } catch (e) {
      print("Error deleting pet data: $e");
    }
  }

  //image upload
Future<String> uploadImageToFirebase(File image) async {
  try {
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$imageName.jpg');
    UploadTask uploadTask = storageReference.putFile(image);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100}%');
    }, onError: (Object e) {
      print('Error during upload task: $e');
    });

    await uploadTask;

    String imageUrl = await storageReference.getDownloadURL();

    print('Image uploaded successfully. URL: $imageUrl');

    return imageUrl;
  } catch (e) {
    print('Error uploading image to Firebase: $e');
    return 'Error during image upload';
  }
}
}
