// screens/task_list.dart
import 'package:flutter/material.dart';
import 'package:petpal/enum/TaskCategory.dart';
import 'models/task.dart';
import 'task_command.dart';

class TaskList extends StatelessWidget {
  final List<String> taskList;
  final List<TaskCategory> categories;
  final VoidCallback onTaskAdded;

  const TaskList({
    required this.taskList,
    required this.categories,
    required this.onTaskAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            taskList.isEmpty ? "No tasks to display" : "Tasks",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              TextEditingController taskController = TextEditingController();
              TaskCategory? selectedCategory;
              TaskCategory defaultCategory = TaskCategory.getPillsCategory;

              selectedCategory = await showDialog<TaskCategory>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Add a Task"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: taskController,
                          decoration:
                              const InputDecoration(labelText: 'Task Name'),
                        ),
                        const SizedBox(height: 16),

                        // Category
                        DropdownButton<TaskCategory>(
                          value: selectedCategory,
                          onChanged: (TaskCategory? newValue) {
                            if (newValue != null) {
                              selectedCategory = newValue;
                            }
                          },
                          items: categories
                              .map<DropdownMenuItem<TaskCategory>>(
                                  (TaskCategory category) {
                            return DropdownMenuItem<TaskCategory>(
                              value: category,
                              child: Text(category.getCategoryName()),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, null); // Cancel pressed
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (taskController.text.isNotEmpty) {
                            Task newTask = Task(
                              name: taskController.text,
                              date: DateTime.now(),
                              category: selectedCategory ?? defaultCategory,
                              frequency: 1,
                            );

                            TaskCommand addTaskCommand = AddTaskCommand(
                              taskList: taskList,
                              task: newTask.name,
                              onTaskAdded: onTaskAdded,
                            );
                            addTaskCommand.execute();
                            Navigator.pop(context, selectedCategory);
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Add a Task"),
          ),
          for (String task in taskList)
            ListTile(
              title: Text(task),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  TaskCommand removeTaskCommand =
                      RemoveTaskCommand(taskList: taskList, task: task);
                  removeTaskCommand.execute();
                },
              ),
            ),
        ],
      ),
    );
  }
}
