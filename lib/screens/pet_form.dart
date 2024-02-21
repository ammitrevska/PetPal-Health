import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petpal/pet_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddPetForm extends StatefulWidget {
  const AddPetForm({super.key});

  @override
  State<StatefulWidget> createState() => AddPetFormState();
}

class AddPetFormState extends State<AddPetForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedSex = 'Male';
  String selectedType = "Dog";

  late File _selectedImage = File('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a pet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),

            //name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Pet Name'),
            ),

            //age
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),

            //weight
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Weight"),
            ),

            //sex dropdown
            DropdownButtonFormField<String>(
              value: selectedSex,
              onChanged: (String? value) {
                setState(() {
                  selectedSex = value!;
                });
              },
              items: ["Male", "Female"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: "Sex"),
            ),

            //image - to be able to take a picture
            const SizedBox(
              height: 20,
            ),

            _selectedImage != null && _selectedImage.path.isNotEmpty
                ? Image.file(_selectedImage)
                : const Text("please select an image"),

            ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: const Text("Select an image")),

            ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child: const Text("Open camera")),

            //type of pet
            DropdownButtonFormField<String>(
              value: selectedType,
              onChanged: (String? value) {
                setState(() {
                  selectedType = value!;
                });
              },
              items: ['Dog', 'Cat', 'Rabbit']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Type'),
            ),

            const SizedBox(
              height: 20,
            ),

            //submit
            ElevatedButton(
              onPressed: () {
                String petName = nameController.text;
                int petAge = int.tryParse(ageController.text) ?? 0;
                double petWeight =
                    double.tryParse(weightController.text) ?? 0.0;

                if (_selectedImage != null) {
                  PetManager.instance.addPet(
                    name: petName,
                    sex: selectedSex,
                    age: petAge,
                    weight: petWeight,
                    image: _selectedImage!,
                    type: selectedType,
                  );
                  nameController.clear();
                  ageController.clear();
                  weightController.clear();
                  setState(() {
                    _selectedImage = File('');
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select an image"),
                    ),
                  );
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    }
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage != null) {
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
