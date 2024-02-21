abstract class TaskCommand {
  void execute();
}

class AddTaskCommand implements TaskCommand {
  final List<String> taskList;
  final String task;
  final Function() onTaskAdded;

  AddTaskCommand({required this.taskList, required this.task, required this.onTaskAdded});

  @override
  void execute() {
    print('Adding task: $task');
    taskList.add(task);
    onTaskAdded();
    print('Task added. Task list: $taskList');
  }
}

class RemoveTaskCommand implements TaskCommand {
  final List<String> taskList;
  final String task;

  RemoveTaskCommand({required this.taskList, required this.task});

  @override
  void execute() {
    taskList.remove(task);
  }
}
