// screens/initialize_pet_screen.dart
import 'package:flutter/material.dart';
import 'package:petpal/enum/TaskCategory.dart';
import 'package:petpal/models/pet.dart';
import 'package:petpal/pet_list.dart';
import 'package:petpal/screens/map_screen.dart';
import 'package:petpal/task_command.dart';
import 'package:petpal/task_list.dart';
import 'package:petpal/widgets/nav_bar.dart';

class InitializePet extends StatefulWidget {
  final List<Pet> petList;
  final List<String> taskList;
  final List<TaskCategory> categories;

  const InitializePet({
    super.key,
    required this.petList,
    required this.taskList,
    required this.categories,
  });

  @override
  State<InitializePet> createState() => _InitializePetState();
}

class _InitializePetState extends State<InitializePet> {
  List<Pet> petList = [];
  List<String> taskList = [];
  List<TaskCommand> executedCommands = [];
  List<TaskCategory> categories = [
    TaskCategory.getPillsCategory,
    TaskCategory.getFoodCategory,
    TaskCategory.getSnacksCategory,
    TaskCategory.getWaterCategory,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 197, 126, 1),
        title: const Text("Hello"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            PetList(
              petList: petList,
              onPetAdded: (newPet) {
                setState(() {
                  petList.add(newPet);
                });
              },
            ),
            const SizedBox(height: 20),
            TaskList(
              taskList: taskList,
              categories: categories,
              onTaskAdded: () {
                setState(() {
                  taskList = List.from(taskList);
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(249, 235, 162, 0.27),
        selectedItemColor: const Color.fromRGBO(253, 197, 126, 1),
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Assuming you want the first tab selected initially
        onTap: (index) {
          if (index == 2) {
            // If the Map tab is selected (index 2), navigate to MapScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_rounded),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Medic',
          ),
        ],
      ),
    );
  }
}
