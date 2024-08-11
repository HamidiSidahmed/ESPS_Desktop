class VaccinModel {
  String id;
  String age;
  String vaccin;
  String technic;
  String place;
  String date;
  String lot;
  int personId;
  VaccinModel(
      {required this.id,
      required this.age,
      required this.vaccin,
      required this.technic,
      required this.place,
      required this.date,
      required this.lot,
      required this.personId,
      });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "age": age,
      "vaccin": vaccin,
      "technic": technic,
      "place": place,
      "date": date,
      "lot": lot,
      "personid":personId
    };
  }
}
