import 'Categories.dart';
import 'Task.dart';
import 'dart:io';

late List<Category> categories;
void main() {
  categories = [];
  while (true) {
    ShowMenu();
    stdout.write("Choose An Option : ");
    int choice;
    String? input = stdin.readLineSync();
    choice = int.parse(input!);
    switch (choice) {
      case 1:
        Category category = Category();
        AddCategory(categories, category);
        break;
      case 2:
        EditCategory(categories);
        break;
      case 3:
        AddNewTask(categories);
        break;
      case 4:
        EditTask(categories);
        break;
      case 5:
        Task task = Task();
        MarkAsfinished(categories, task);
        break;
      case 6:
        RemoveTask(categories);
        break;
      case 7:
        RemoveCategory(categories);
        break;
      case 8:
        PrintAllCategories(categories);
        break;
      case 9:
        PrintTasksOfaCategory(categories);
        break;
      case 10:
        return;
      default:
        print("Invalid Option");
    }
  }
}

void ShowMenu() {
  print("\t\t\t\t\t\t\t\t -------------------------------------------------------------------");
  print("\t\t\t\t\t\t\t\t|                          To Do List                               |");
  print("\t\t\t\t\t\t\t\t -------------------------------------------------------------------");
  print("\t\t\t\t\t\t\t\t|     1. Add New Category                                           |");
  print("\t\t\t\t\t\t\t\t|     2. Edit Category                                              |");
  print("\t\t\t\t\t\t\t\t|     3. Add a New Task                                             |");
  print("\t\t\t\t\t\t\t\t|     4. Edit Task                                                  |");
  print("\t\t\t\t\t\t\t\t|     5. Mark Task As Finished                                      |");
  print("\t\t\t\t\t\t\t\t|     6. Remove Task                                                |");
  print("\t\t\t\t\t\t\t\t|     7. Remove Category                                            |");
  print("\t\t\t\t\t\t\t\t|     8. Print All Categories                                       |");
  print("\t\t\t\t\t\t\t\t|     9. Print Tasks Of a Specific Category                         |");
  print("\t\t\t\t\t\t\t\t|     10. Exit                                                      |");
  print("\t\t\t\t\t\t\t\t -------------------------------------------------------------------");
}

void AddCategory(List<Category> categories, Category category) {
  stdout.write("What is The Category Name ? ");
  String? input = stdin.readLineSync();
  category.EditCategoryName(input);
  categories.add(category);
  String? s = category.getName();
  print("$s Added Successfully :)");
}

void EditCategory(List<Category> categories) {
  bool found =  false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  categories.forEach((category) {
    if (category.getName() == input) {
      stdout.write("What is The New Name ? ");
      input = stdin.readLineSync();
      category.EditCategoryName(input);
      print(" Edited Successfully :)");
      found = true;
    }
  });
  if (!found)
    print("This Category Is Not Found ");
}
void AddNewTask(List<Category> categories) {
  bool foundCategory =false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  categories.forEach((category) {
    if (category.getName() == input) {
      do {
        foundCategory=true;
        Task task = Task();
        stdout.write("What is The Task ? ");
        input = stdin.readLineSync();
        task.setTask(input);
        category.addTask(task);
        stdout.write("Do You Want To Add Another Task ? y/n ");
        input = stdin.readLineSync();
      }while(input == "y");
    }
  });
  if(!foundCategory)
    print("This Category Is Not Found");
}

void EditTask(List<Category> category) {
  bool foundCategory =  false;
  bool foundTask = false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  categories.forEach((category) {
    if (category.getName() == input) {
      foundCategory =  true;
      stdout.write("Which Task ? ");
      input = stdin.readLineSync();
      category.getTasks().forEach((task) {
        if (task.getTask() == input) {
          foundTask = true;
          stdout.write("New Task ? ");
          input = stdin.readLineSync();
          task.setTask(input);
          print("This Task Is Edited Successfully");
        }
      });
      if (!foundTask)
        print("This Task Is Not Found");
    }
  });
  if (!foundCategory)
    print("This Category Is Not Found");
}

void PrintAllCategories(List<Category> categories) {
  if (categories.isEmpty == true) print("No categories available.");
  categories.forEach((category) {
    category.printCategory();
  });
}

void MarkAsfinished(List<Category> category, Task task) {
  bool foundCategory=false;
  bool foundTask=false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  categories.forEach((category) {
    if (category.getName() == input) {
      foundCategory=true;
      stdout.write("Which Task ? ");
      input = stdin.readLineSync();
      category.getTasks().forEach((task) {
        if (task.getTask() == input) {
          foundTask=true;
          task.setIsFinished(true);
        }
      });
      if(!foundTask)
        print("This Task Is Not Found ");
    }
  });
  if(!foundCategory)
    print("This Category Is Not Found ");
}

void RemoveTask(List<Category> categories) {
  bool foundCategory=false;
  bool foundTask=false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  Task t = Task();
  categories.forEach((category) {
    if (category.getName() == input) {
      foundCategory=true;
      stdout.write("Which Task ? ");
      input = stdin.readLineSync();
      category.getTasks().forEach((task) {
        if (task.getTask() == input) {
          foundTask=true;
          t = task;
        }
      });
      if(!foundTask) {
        print("This Task Is Not Found");
      }else {
        category.removeTask(t);
        print("$input Is Deleted Successfully .");
      }
    }
  });
  if(!foundCategory)
    print("This Category Is Not Found ");
}

void RemoveCategory(List<Category> categories) {
  bool foundCategory=false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  Category c = Category();
  categories.forEach((category) {
    if (category.getName() == input) {
      foundCategory=true;
      c = category;
    }
  });
  if(!foundCategory) {
    print("This Category Is Not Found");
  }else {
    categories.remove(c);
    print("$input Is Deleted Successfully .");
  }
}

void PrintTasksOfaCategory(List<Category> categories) {
  bool found=false;
  stdout.write("Which Category ? ");
  String? input = stdin.readLineSync();
  categories.forEach((category) {
    if (category.getName() == input) {
      category.printCategory();
      found=true;
    }
  });
  if(!found)
    print("This Category Is Not Found");
}