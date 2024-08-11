class Model {
  String name;
  String birthDate;
  String birthPlace;
  String father;
  String mother;
  String state;
  String sex;
  bool checked=false;
  int id;
  Model(
      {required this.id,
      required this.name,
      required this.birthDate,
      required this.birthPlace,
      required this.father,
      required this.mother,
      required this.state,
      required this.sex});
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "birthDate": birthDate,
      "birthPlace": birthPlace,
      "father": father,
      "mother": mother,
      "state": state,
      "sex": sex
    };
  }
}
