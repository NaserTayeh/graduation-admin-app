class GymModel {
  String? name;
  String? gymDesc;
  String? location;
  String? email;
  String? about;
  String? logo;

  GymModel(
      {this.name,
      this.gymDesc,
      this.location,
      this.email,
      this.about,
      this.logo});

  GymModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    gymDesc = json['gym_desc'];
    location = json['Location'];
    email = json['Email'];
    about = json['About'];
    logo = json['Logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['gym_desc'] = this.gymDesc;
    data['Location'] = this.location;
    data['Email'] = this.email;
    data['About'] = this.about;
    data['Logo'] = this.logo;
    return data;
  }
}
