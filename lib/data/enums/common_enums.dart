enum Priority { low, medium, high }

// enum Status {
//   "queue",
//   "progress",
//   "finished";

//   // String get queueValue => "In Queue";
//   // String get progressValue => "In Progress";
//   // String get finishedValue => "Finished";
// }
class Status {
  static const String queue = "In Queue";
  static const String progress = "In Progress";
  static const String finished = "Finished";
  static int get inProgressID => 1;
  static int get finisedID => 2;
  static int get inQueueID => 0;
}
