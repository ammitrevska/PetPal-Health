import 'package:flutter/material.dart';
import 'package:petpal/models/pet.dart';

class InitializePet extends StatefulWidget {
  const InitializePet({super.key});

  @override
  State<InitializePet> createState() => _InitializePet();
}

class _InitializePet extends State<InitializePet> {
  List<Pet> petList = [];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display pet information
          for (Pet pet in petList)
            Card(
              child: ListTile(
                title: Text('Name: ${pet.name}'),
                subtitle: Text('Age: ${pet.age}, Sex: ${pet.sex}'),
              ),
            ),

          const SizedBox(height: 20),

          // Expanded to take remaining vertical space
          Expanded(
            child: Container(),
          ),

          // Button to add a pet
          ElevatedButton(
            onPressed: () async {
              // Navigate to the AddPetForm screen
              // Pet? newPet = await Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddPetForm()),
              // );

              // Check if a new pet was added and update the UI
              // if (newPet != null) {
              //   setState(() {
              //     // Update your UI with the new pet information
              //     petList.add(newPet);
              //   });
              // }
            },
            child: const Text('Add a Pet'),
          ),
        ],
      ),
    ),
  );
}
}