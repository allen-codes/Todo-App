class TodoModel {
  late String title;
  late String description;
  late DateTime? duedate;
  late String folderName;

  TodoModel({required this.title, required this.folderName, required this.description, this.duedate});
}