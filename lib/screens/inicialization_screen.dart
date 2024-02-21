// screens/initialize_pet_screen.dart
import 'package:flutter/material.dart';
import 'package:petpal/enum/TaskCategory.dart';
import 'package:petpal/models/pet.dart';
import 'package:petpal/pet_list.dart';
import 'package:petpal/task_command.dart';
import 'package:petpal/task_list.dart';

class InitializePet extends StatefulWidget {
  const InitializePet({super.key});

  @override
  State<InitializePet> createState() => _InitializePetState();
}

class _InitializePetState extends State<InitializePet> {
  List<Pet> petList = [];
  List<String> taskList = [];
  List<TaskCommand> executedCommands = [];
  late List<TaskCategory> categories;

  @override
  void initState() {
    super.initState();
    categories = [
      TaskCategory.getPillsCategory,
      TaskCategory.getFoodCategory,
      TaskCategory.getSnacksCategory,
      TaskCategory.getWaterCategory,
    ];
  }

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
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:petpal/enum/TaskCategory.dart';
// import 'package:petpal/models/pet.dart';
// import 'package:petpal/models/task.dart';
// import 'package:petpal/screens/pet_form.dart';
// import 'package:petpal/task_command.dart';

// class InitializePet extends StatefulWidget {
//   const InitializePet({super.key});

//   @override
//   State<InitializePet> createState() => _InitializePet();
// }

// class _InitializePet extends State<InitializePet> {
//   List<Pet> petList = [];
//   List<String> taskList = [];
//   List<TaskCommand> executedCommands = [];

//   late List<TaskCategory> categories; 

//   @override
//   void initState() {
//     super.initState();
//     categories = [
//       TaskCategory.getPillsCategory,
//       TaskCategory.getFoodCategory,
//       TaskCategory.getSnacksCategory,
//       TaskCategory.getWaterCategory,
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(253, 197, 126, 1),
//         title: const Text("Hello"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromRGBO(253, 197, 126, 1),
//               Color.fromRGBO(249, 235, 162, 0.27),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 30),

//             // Display pet information
//             if (petList.isEmpty)
//               Container(
//                 width: 355,
//                 height: 140,
//                 clipBehavior: Clip.antiAlias,
//                 margin: const EdgeInsets.only(left: 16, right: 16),
//                 decoration: const ShapeDecoration(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(40),
//                     ),
//                   ),
//                   shadows: [
//                     BoxShadow(
//                       color: Color(0x3F000000),
//                       blurRadius: 7,
//                       offset: Offset(3, 7),
//                       spreadRadius: 2,
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(left: 27, top: 23),
//                       child: Text(
//                         "No pets to display",
//                         style: TextStyle(
//                           color: Color(0xFF242D68),
//                           fontSize: 17,
//                           fontFamily: 'Comic Sans MS',
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () async {
//                         dynamic result = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const AddPetForm()),
//                         );
              
//                         if (result != null) {
//                           setState(() {
//                             petList.add(result);
//                           });
//                         }
//                       },
//                       child: const Text('Add a Pet'),
//                     ),
//                   ],
//                 ),
//               )
//             else
//               for (Pet pet in petList)
//                 Card(
//                   child: ListTile(
//                     title: Text('Name: ${pet.name}'),
//                     subtitle: Text('Age: ${pet.age}, Sex: ${pet.sex}'),
//                   ),
//                 ),

//             const SizedBox(height: 20),

//             // Task
//             Container(
//               width: 355,
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     taskList.isEmpty ? "No tasks to display" : "Tasks",
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 22,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w300),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       TextEditingController taskController =
//                           TextEditingController();
//                       TaskCategory? selectedCategory;
//                       TaskCategory defaultCategory =
//                           TaskCategory.getPillsCategory;

//                       selectedCategory = await showDialog<TaskCategory>(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text("Add a Task"),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TextField(
//                                   controller: taskController,
//                                   decoration: const InputDecoration(
//                                       labelText: 'Task Name'),
//                                 ),
//                                 const SizedBox(height: 16),

//                                 // Category
//                                 DropdownButton<TaskCategory>(
//                                   value: selectedCategory,
//                                   onChanged: (TaskCategory? newValue) {
//                                     if (newValue != null) {
//                                       setState(() {
//                                         selectedCategory = newValue;
//                                       });
//                                     }
//                                   },
//                                   items: categories
//                                       .map<DropdownMenuItem<TaskCategory>>(
//                                           (TaskCategory category) {
//                                     return DropdownMenuItem<TaskCategory>(
//                                       value: category,
//                                       child: Text(category.getCategoryName()),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ],
//                             ),
//                             actions: <Widget>[
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(
//                                       context, null); // Cancel pressed
//                                 },
//                                 child: const Text("Cancel"),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   if (taskController.text.isNotEmpty) {
//                                     Task newTask = Task(
//                                       name: taskController.text,
//                                       date: DateTime.now(),
//                                       category:
//                                           selectedCategory ?? defaultCategory,
//                                       frequency: 1,
//                                     );

//                                     TaskCommand addTaskCommand = AddTaskCommand(
//                                       taskList: taskList,
//                                       task: newTask.name,
//                                       onTaskAdded: () {
//                                         setState(() {
//                                            taskList = List.from(taskList);
//                                         });
//                                       }
//                                     );
//                                     addTaskCommand.execute();
//                                     executedCommands.add(addTaskCommand);
//                                     Navigator.pop(context,
//                                         selectedCategory); // Task added
//                                   }
//                                 },
//                                 child: const Text('Add'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: const Text("Add a Task"),
//                   ),
//                   for (String task in taskList)
//                     ListTile(
//                       title: Text(task),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.remove),
//                         onPressed: () {
//                           TaskCommand removeTaskCommand =
//                               RemoveTaskCommand(taskList: taskList, task: task);
//                           removeTaskCommand.execute();
//                           executedCommands.add(removeTaskCommand);
//                         },
//                       ),
//                     )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
