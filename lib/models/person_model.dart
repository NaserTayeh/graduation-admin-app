class PersonModel {
  int? personId;
  String? password;
  String? email;
  String? phoneNumber;
  String? userName;
  String? personalPic;

  PersonModel(
      {this.personId,
      this.password,
      this.email,
      this.phoneNumber,
      this.userName});

  PersonModel.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    password = json['Password'];
    email = json['Email'];
    phoneNumber = json['phone_number'];
    userName = json['User_Name'];
    personalPic = json['Personal_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Password'] = password;
    data['Email'] = email;
    data['Phone_Num'] = phoneNumber;
    data['User_Name'] = userName;
    data['Personal_pic'] = personalPic;
    return data;
  }
}
