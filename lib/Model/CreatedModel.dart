


class CreatedModel {
  String? id;
  String? created;
  String? firstName;
  String? lastName;


  CreatedModel({this.id, this.created, this.firstName, this.lastName,});

  CreatedModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    created = json["createdAt"];
    firstName = json["firstName"];
    lastName = json["lastName"];
  }

}