class TraineeModel {
  int? traineeId;
  String? height;
  String? weight;
  String? age;
  String? planId;
  String? fullName;
  String? gender;
  String? personalPic;
  String? medicalConditions;
  String? fitnessLevel;
  int? nutrientsPlanId;
  String? startDate;
  String? endDate;
  int? isPrem;

  TraineeModel(
      {this.traineeId,
      this.height,
      this.weight,
      this.age,
      this.planId,
      this.fullName,
      this.gender,
      this.personalPic,
      this.medicalConditions,
      this.fitnessLevel,
      this.nutrientsPlanId,
      this.startDate,
      this.endDate,
      this.isPrem});

  TraineeModel.fromJson(Map<String, dynamic> json) {
    traineeId = json['Trainee_id'];
    height = json['Height'];
    weight = json['Weight'];
    age = json['Age'];
    planId = json['plan_id'];
    fullName = json['FullName'];
    gender = json['Gender'];
    personalPic = json['Personal_pic'];
    medicalConditions = json['medical_conditions'];
    fitnessLevel = json['Fitness_level'];
    nutrientsPlanId = json['nutrients_plan_id'];
    startDate = json['start_date'];
    endDate = json['End_date'];
    isPrem = json['is_prem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Trainee_id'] = traineeId;
    data['Height'] = height;
    data['Weight'] = weight;
    data['Age'] = age;
    data['plan_id'] = planId;
    data['FullName'] = fullName;
    data['Gender'] = gender;
    data['Personal_pic'] = personalPic;
    data['medical_conditions'] = medicalConditions;
    data['Fitness_level'] = fitnessLevel;
    // data['nutrients_plan_id'] = this.nutrientsPlanId;
    data['start_date'] = startDate;
    data['End_date'] = endDate;
    data['is_prem'] = isPrem;
    return data;
  }
}
