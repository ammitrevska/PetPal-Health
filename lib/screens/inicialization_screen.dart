// screens/initialize_pet_screen.dart
import 'package:flutter/material.dart';
import 'package:petpal/enum/TaskCategory.dart';
import 'package:petpal/models/pet.dart';
import 'package:petpal/pet_manager.dart';
import 'package:petpal/screens/pet_list.dart';
import 'package:petpal/screens/map_screen.dart';
import 'package:petpal/task_command.dart';
import 'package:petpal/screens/task_list.dart';
import 'package:petpal/widgets/nav_bar.dart';
import 'package:petpal/widgets/petDetails.dart';

class InitializePet extends StatefulWidget {
  final List<String> taskList;
  final List<TaskCategory> categories;

  const InitializePet({
    super.key,
    required this.taskList,
    required this.categories,
  });
  
  get petList => null;

  @override
  State<InitializePet> createState() => _InitializePetState();
}

class _InitializePetState extends State<InitializePet> {
  Pet? _addedPet;

  List<String> taskList = [];
  List<TaskCommand> executedCommands = [];
  List<TaskCategory> categories = [
    TaskCategory.getPillsCategory,
    TaskCategory.getFoodCategory,
    TaskCategory.getSnacksCategory,
    TaskCategory.getWaterCategory,
  ];

  @override
  void initState() {
    super.initState();
    PetManager.instance.onPetAdded.listen((newPet) { 
      setState(() {
        _addedPet = newPet;
      });
    });
  }

  // @override
  // void dispose() {
  //   PetManager.instance.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 197, 126, 1),
        title: const Padding(
          padding: EdgeInsets.only(left: 27),
          child: Text(
            "Hello",
            style: TextStyle(
                fontFamily: 'Comic Sans Ms',
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        //so there wont be a back arrow in the nav bar
        automaticallyImplyLeading: false,
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
            if (_addedPet == null) ...[
              PetList(
                petList: PetManager.instance.petList,
                onPetAdded: (newPet) {
                  setState(() {
                    _addedPet = newPet;
                  });
                },
              ),
            ] else ...[
              PetDetails(pet: _addedPet!),
            ],
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
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
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
