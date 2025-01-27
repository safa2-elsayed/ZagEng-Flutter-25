class Task
{
  String? _task;
  bool _finished = false;
  Task(){}
  Task.named(String task)
  {
    this._task = task;
  }
  void setTask(String? task)
  {
    this._task = task;
  }
  void setIsFinished(bool finished)
  {
    this._finished = finished;
  }
  String? getTask()
  {
    return _task;
  }
  bool getIsFinished()
  {
    return _finished;
  }
  void TaskFinished()
  {
    setIsFinished(true);
  }
  void printTask()
  {
    if (_finished)
      print("$_task -> finished");
    else
      print("$_task -> Not Finished");
  }
}