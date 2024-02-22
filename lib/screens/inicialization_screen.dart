// screens/initialize_pet_screen.dart
import 'package:flutter/material.dart';
import 'package:petpal/enum/TaskCategory.dart';
import 'package:petpal/models/pet.dart';
import 'package:petpal/pet_list.dart';
import 'package:petpal/task_command.dart';
import 'package:petpal/task_list.dart';
import 'package:petpal/widgets/nav_bar.dart';

class InitializePet extends StatefulWidget {
  const InitializePet({super.key});

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
              onPetAdded: () {
                setState(() {
                  petList = List.from(petList);
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
            bottomNavigationBar: NavBar(),

    );
  }
}
