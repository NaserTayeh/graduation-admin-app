class RecipeModel {
  num? recipe_id;
  String? recipe_preparation;
  String? ingredients;
  String? protein;
  String? calu;
  String? img;
  String? descr;
  String? title;
  String? category;
  String? carb;

  RecipeModel(
      {this.recipe_id,
      this.recipe_preparation,
      this.ingredients,
      required this.protein,
      required this.calu,
      this.img,
      required this.category,
      required this.descr,
      required this.title,
      required this.carb});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    recipe_id = json['recipe_id'];
    recipe_preparation = json['Recipe_preparation'];
    ingredients = json['Ingredients'];
    protein = json['protein'];
    calu = json['calu'];
    img = json['img'];
    descr = json['descr'];
    title = json['title'];
    category = json['category'];
    carb = json['carb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipe_id'] = this.recipe_id;
    // data['Recipe_preparation'] = this.recipe_preparation;
    // data['Ingredients'] = this.ingredients;
    data['protein'] = this.protein;
    data['calu'] = this.calu;
    // data['img'] = this.img;
    data['descr'] = this.descr;
    data['title'] = this.title;
    data['category'] = this.category;
    data['carb'] = this.carb;

    return data;
  }
}
