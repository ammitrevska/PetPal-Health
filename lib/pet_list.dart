// screens/pet_list.dart
import 'package:flutter/material.dart';
import 'package:petpal/screens/pet_form.dart';
import 'models/pet.dart';

class PetList extends StatelessWidget {
  final List<Pet> petList;
  final VoidCallback onPetAdded;

  const PetList({required this.petList, required this.onPetAdded});

  @override
  Widget build(BuildContext context) {
    return petList.isEmpty
        ? Container(
            width: 355,
            height: 140,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 7,
                  offset: Offset(3, 7),
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 27, top: 23),
                  child: Text(
                    "No pets to display",
                    style: TextStyle(
                      color: Color(0xFF242D68),
                      fontSize: 17,
                      fontFamily: 'Comic Sans MS',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    dynamic result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddPetForm(),
                      ),
                    );

                    if (result != null) {
                      // Notify the parent widget to update the pet list
                      onPetAdded();
                    }
                  },
                  child: const Text('Add a Pet'),
                ),
              ],
            ),
          )
        : Column(
            children: [
              for (Pet pet in petList)
                Card(
                  child: ListTile(
                    title: Text('Name: ${pet.name}'),
                    subtitle: Text('Age: ${pet.age}, Sex: ${pet.sex}'),
                  ),
                ),
            ],
          );
  }
}
