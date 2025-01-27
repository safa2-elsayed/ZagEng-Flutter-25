import 'Task.dart';
import 'dart:io';
class Category extends Task
{
  String? _name;
  List<Task> _tasks = [];

  Category(){}
  Category.named(String? name)
  {
    this._name = name;
  }
  void EditCategoryName(String? name)
  {
    this._name = name;
  }
  String? getName()
  {
    return _name;
  }
  void addTask(Task task)
  {
    this._tasks.add(task);
  }
  void removeTask(Task task)
  {
    if (_tasks.isEmpty == true)
    {
      print("No Tasks To Remove");
      return;
    }
    this._tasks.remove(task);
  }
  List<Task> getTasks()
  {
    return _tasks;
  }
  void printCategory()
  {
    int i = 0;
    print("Category : $_name");
    print("Tasks : ");
    _tasks.forEach((task)
    {
      i++;
      stdout.write("\t$i. ");
      task.printTask();
    });

  }
}