class UserModel {
  late List<dynamic>? folders;

  UserModel({this.folders});

  factory UserModel.fromJSON(Map<String, dynamic> userJSON) {
    return UserModel(folders: userJSON["folders"]);
  }
}