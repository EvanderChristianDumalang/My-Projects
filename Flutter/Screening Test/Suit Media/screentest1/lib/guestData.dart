class GuestData{
  String name = '';
  String birthdate = '';
  int id = 0;

  GuestData(this.birthdate, this.id, this.name);

  GuestData.fromJson(Map<dynamic, dynamic> json ){
    name = json['name'];
    birthdate = json['birthdate'];
    id = json['id'];
  }
}