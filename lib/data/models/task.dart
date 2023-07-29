class Task {
  final int taskID;
  final String title;
  final String? description;
  final String createdTime;
  final int priority; //0: low, 1: medium, 2: high
  final String startTime;
  final String dueDate;
  final int status; //0: in queue, 1: in progress, 2: finished

  Task(
    this.taskID,
    this.title,
    this.description,
    this.createdTime,
    this.priority,
    this.startTime,
    this.dueDate,
    this.status,
  );

  Task.fromJson(Map<String, dynamic> json)
      : taskID = json["taskID"],
        title = json["title"],
        description = json["description"],
        createdTime = json["createdTime"],
        priority = json["priority"],
        startTime = json["startTime"],
        dueDate = json["dueDate"],
        status = json["status"];

  Map<String, dynamic> toJson() => {
        'taskID': taskID,
        'title': title,
        'description': description,
        "createdTime": createdTime,
        "priority": priority,
        'startTime': startTime,
        'dueDate': dueDate,
        'status': status
      };
}
