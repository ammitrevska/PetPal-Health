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
        backgroundColor: const Color.fromRGBO(253, 197, 126, 1),
        title: const Text("Add a pet",  
              style: TextStyle(
              fontFamily: 'Comic Sans Ms',
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(253, 197, 126, 1),
              Color.fromRGBO(249, 235, 162, 0.27),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              //name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Pet Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.75),
                  ),
                ),
              ),

              //age
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.75),
                  ),
                ),
              ),

              //weight
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.75),
                  ),
                ),
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
                decoration: const InputDecoration(
                  labelText: 'Sex',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.75),
                  ),
                ),
              ),

              //image - to be able to take a picture
              const SizedBox(
                height: 20,
              ),

              _selectedImage.path.isNotEmpty
                  ? Image.file(_selectedImage)
                  : const Text(
                      "Please select an image",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),

              ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text(
                    "Select an image",
                    style: TextStyle(
                      color: Color(0xFF242D68),
                    ),
                  )),

              ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                child: const Text(
                  "Open camera",
                  style: TextStyle(
                    color: Color(0xFF242D68),
                  ),
                ),
              ),

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
                decoration: const InputDecoration(
                  labelText: 'Type of Pet',
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.75),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //submit
              ElevatedButton(
                onPressed: () {
                  String petName = nameController.text;
                  int petAge = int.tryParse(ageController.text) ?? 0;
                  double petWeight = double.tryParse(weightController.text) ?? 0.0;

                  if (_selectedImage != null) {
                    PetManager.instance.addPet(
                      name: petName,
                      sex: selectedSex,
                      age: petAge,
                      weight: petWeight,
                      image: _selectedImage!,
                      type: selectedType,
                    );

                    //clear the fields
                    nameController.clear();
                    ageController.clear();
                    weightController.clear();
                    setState(() {
                      _selectedImage = File('');
                    });

                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select an image"),
                      ),
                    );
                  }
                },

                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                ),
                
                child: const Text("Submit", style: TextStyle(
                  color:Color(0xFF242D68),
                ),),
              )
            ],
          ),
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
