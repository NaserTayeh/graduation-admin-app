class CoachModel {
  int? coachId;
  String? height;
  String? weight;
  String? yearOfExp;
  String? age;
  String? coachingFoucs;
  String? gender;
  String? fullName;
  String? personalPic;
  String? qualifications;
  String? nationality;
  int? skillsId;
  String? services;
  String? subscriptionTax;
  String? salary;
  String? language;
  String? numOfTrainee;

  CoachModel(
      {this.coachId,
      this.height,
      this.weight,
      this.yearOfExp,
      this.age,
      this.coachingFoucs,
      this.gender,
      this.fullName,
      this.personalPic,
      this.qualifications,
      this.nationality,
      this.skillsId,
      this.services,
      this.subscriptionTax,
      this.salary,
      this.language});

  CoachModel.fromJson(Map<String, dynamic> json) {
    print('b' * 18);
    print(json);
    print('b' * 18);

    height = json['Height'];
    weight = json['Weight'];
    yearOfExp = json['Year_of_exp'];
    age = json['Age'];
    coachingFoucs = json['coaching_Foucs'];
    gender = json['Gender'];
    fullName = json['Full_name'];
    personalPic = json['Personal_pic'];
    qualifications = json['Qualifications'];
    nationality = json['Nationality'];
    skillsId = json['Skills_id'];
    services = json['services'];
    subscriptionTax = json['subscription_tax'];
    salary = json['Salary'];
    language = json['Language'];
    coachId = json['Coach_id'];
    numOfTrainee = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Height'] = height;
    data['Weight'] = weight;
    data['Year_of_exp'] = yearOfExp;
    data['Age'] = age;
    data['coaching_Foucs'] = coachingFoucs;
    data['Gender'] = gender;
    data['Full_name'] = fullName;
    data['Personal_pic'] = personalPic;
    data['Qualifications'] = qualifications;
    data['Nationality'] = nationality;
    data['Skills_id'] = skillsId;
    data['services'] = services;
    data['subscription_tax'] = subscriptionTax;
    data['Salary'] = salary;
    data['Language'] = language;
    data['capacity'] = numOfTrainee;
    return data;
  }
}
