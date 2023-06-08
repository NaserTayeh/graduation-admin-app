// ignore_for_file: public_member_api_docs, sort_constructors_first

class MarketModel {
  int? supplementId;
  String? supplementName;
  String? logo;
  String? supplementDesc;
  String? protein;
  String? carbohydrates;
  String? fats;
  String? vitamins;
  String? hydration;
  String? quantityStock;
  String? price;
  String? flavor;
  // String? flavor;
  int? categorie;

  MarketModel({
    this.supplementId,
    this.supplementName,
    this.logo,
    this.supplementDesc,
    this.protein,
    this.carbohydrates,
    this.fats,
    this.vitamins,
    this.hydration,
    this.quantityStock,
    this.categorie,
    this.price,
    this.flavor,
  });

  MarketModel.fromJson(Map<String, dynamic> json) {
    supplementId = json['supplement_id'];
    supplementName = json['supplement_name'];
    logo = json['logo'];
    supplementDesc = json['supplement_desc'];
    protein = json['Protein'];
    carbohydrates = json['Carbohydrates'];
    fats = json['fats'];
    vitamins = json['Vitamins'];
    hydration = json['hydration'];
    quantityStock = json['Quantity_Stock'];
    price = json['price'];
    flavor = json['Flavor'];
    categorie = json['categorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supplement_id'] = this.supplementId;
    data['supplement_name'] = this.supplementName;
    data['logo'] = this.logo;
    data['supplement_desc'] = this.supplementDesc;
    data['Protein'] = this.protein;
    data['Carbohydrates'] = this.carbohydrates;
    data['fats'] = this.fats;
    data['Vitamins'] = this.vitamins;
    data['hydration'] = this.hydration;
    data['Quantity_Stock'] = this.quantityStock;
    data['price'] = this.price;
    data['Flavor'] = this.flavor;
    data['categorie'] = this.categorie;
    return data;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }

  static List<MarketModel> protiens = [
    MarketModel(
        supplementName: 'Dymatize, ISO100 Hydrolyzed',
        logo: 'assets/images/store/protien/whey3.png',
        price: '123',
        // rating: 4.5,
        // discountPercent: 10,
        // headerColor: ColorPalette().firstSlice,
        supplementDesc:
            'Dymatize, ISO100 Hydrolyzed, 100% Whey Protein Isolate, Gourmet Chocolate, 5 lb (2.3 kg)'),
    MarketModel(
        supplementName: 'Xtend, Pro, Whey Isolate',
        logo: 'assets/images/store/protien/whey4.png',
        price: '89',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Protiens',
        // headerColor: ColorPalette().firstSlice,
        supplementDesc:
            'Xtend, Pro, Whey Isolate, Chocolate Lava Cake, 5 lb (2.3 kg)'),
    MarketModel(
        supplementName: 'Dymatize Super Mass Gainer',
        logo: 'assets/images/store/protien/mass1.png',
        price: '140',
        // rating: 4.4,
        // discountPercent: 10,
        // category: 'Protiens',
        // headerColor: ColorPalette().firstSlice,
        supplementDesc:
            '4, Dymatize Nutrition has been dedicated to helping athletes achieve superior performance with products based on science and formulated to highest quality standards.'),
    MarketModel(
        supplementName: 'BSN True Mass 1200',
        logo: 'assets/images/store/protien/mass2.png',
        price: '120',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Protiens',
        // headerColor: ColorPalette().firstSlice,
        supplementDesc:
            'TRUE-MASS® 1200 is an ultra-premium super mass gainer designed for individuals with high caloric requirements or those who have difficulty adding and maintaining mass.'),
    MarketModel(
        supplementName: 'BSN True Mass',
        logo: 'assets/images/store/protien/mass3.png',
        price: '160',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Protiens',
        // headerColor: ColorPalette().buttonColor,
        supplementDesc:
            'The global leader (BSN) was founded in 2001, and has won up to 35 awards in the sports nutrition industry, making it the leader in the market. BSN’S international products are now being shipped to over 40.000 retailers and distributed in over 90 countries worldwide.'),
    MarketModel(
        supplementName: 'PhD Nutrition',
        logo: 'assets/images/store/protien/mass55.png',
        price: '80',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Protiens',
        // headerColor: ColorPalette().buttonColor,
        supplementDesc:
            'Synergy is a lean, all-in-one, post-workout shake. All in one refers to Synergy being able to offer a multitude of benefits from an array of ingredients within one shake.'),
    MarketModel(
        supplementName: 'Olimp Sport Nutrition',
        logo: 'assets/images/store/protien/mass5.png',
        price: '60',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Protiens',
        // headerColor: ColorPalette().buttonColor,
        supplementDesc:
            'Olimp Sport Nutrition, thanks to its raw materials with a high degree of purity and innovative production technology, has been setting trends on the dietary supplement market for many years.'),
  ];
  static List<MarketModel> amino = [
    MarketModel(
        supplementName: 'Dymatize, ALL9AMINO',
        logo: 'assets/images/store/amino/amino1.png',
        price: '42',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc:
            'Dymatize, ALL9AMINO, Orange Cranberry, 15.87 oz (450 g)'),
    MarketModel(
        supplementName: 'Country Life,',
        logo: 'assets/images/store/amino/amino2.png',
        price: '30',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc:
            'Country Life, Max-Amino Caps with Vitamin B-6, 180 Vegetarian Capsules'),
    MarketModel(
        supplementName: 'Controlled Labs,',
        logo: 'assets/images/store/amino/amino6.png',
        price: '69',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc:
            'Controlled Labs, Purple Wraath, Juicy Grape, 2.54 lbs (1152 g)'),
    MarketModel(
        supplementName: 'Daily Amino Acid,',
        logo: 'assets/images/store/amino/amino4.png',
        price: '6',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc: '21st Century, Daily Amino Acid, 120 Tablets'),
    MarketModel(
        supplementName: 'Thorne',
        logo: 'assets/images/store/amino/amino5.png',
        price: '49',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc: 'Thorne, Amino Complex, Berry, 8 oz (228 g)'),
    MarketModel(
        supplementName: 'Life Extension',
        logo: 'assets/images/store/amino/amino6.png',
        price: '16',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc:
            'Life Extension, Glutathione, Cysteine & C, 100 Capsules'),
    MarketModel(
        supplementName: 'Source Naturals',
        logo: 'assets/images/store/amino/amino6.png',
        price: '13',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Amino',
        supplementDesc:
            'Source Naturals, L-Proline & L-Lysine, 550 mg, 120 Tablets'),
  ];
  static List<MarketModel> snack = [
    MarketModel(
        supplementName: 'Go Raw Pumpkin Seeds',
        logo: 'assets/images/store/snack/snack1.png',
        price: '15',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Snack',
        supplementDesc:
            'Go Raw Pumpkin Seeds with Sea Salt, Sprouted & Organic, 14 oz. Bag | Keto | Vegan | Gluten Free Snacks | Superfood'),
    MarketModel(
        supplementName: 'Hippeas Organic Chickpea',
        logo: 'assets/images/store/snack/snack2.png',
        price: '19',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Snack',
        supplementDesc:
            'Hippeas Organic Chickpea Puffs, Variety Pack: Vegan White Cheddar, Barbecue, Sriracha, 4 Ounce (Pack of 6), 4g Protein, 3g Fiber, Vegan, Gluten-Free, Crunchy, Plant Protein Snacks'),
    MarketModel(
        supplementName: 'Wonderful Pistachios',
        logo: 'assets/images/store/snack/snack3.png',
        price: '8',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Snack',
        supplementDesc: 'Wonderful Pistachios No Shells, BBQ, 5.5 Oz Bag'),
    MarketModel(
        supplementName: 'Brainiac Almond Butter',
        logo: 'assets/images/store/snack/snack3.png',
        price: '15',
        // rating: 4.4,
        // category: 'Snack',
        // discountPercent: 20,
        supplementDesc:
            'Brainiac Almond Butter Blend with Omega-3s, Honey Almond, 20 Count, 1.15 oz. – Almond Butter Pouches with Real Ingredients, Protein, Omega-3s and Choline – Healthy Snacks for Kids and Adults'),
    MarketModel(
        supplementName: 'Whisps Cheese Crisps',
        logo: 'assets/images/store/snack/snack4.png',
        price: '20',
        // rating: 4.4,
        // category: 'Snack',
        // discountPercent: 20,
        supplementDesc:
            'Whisps Cheese Crisps & Nuts Snack Mix - Parmesan Garlic & Herb, Cheddar Tangy Ranch, Cheddar Smokey Barbeque, Keto Snacks, 1g Sugar, Low Carb, High Protein Crisp Mix, Great Tasting Healthy Snack - Variety, 5.75 Oz (Pack of 3)'),
    MarketModel(
        supplementName: 'Snow Days',
        logo: 'assets/images/store/snack/snack5.png',
        price: '9',
        // rating: 4.4,
        // category: 'Snack',
        // discountPercent: 20,
        supplementDesc: 'Snow Days Organic Cheese Pizza Bites'),
    MarketModel(
        supplementName: 'White Cheddar',
        logo: 'assets/images/store/snack/snack6.png',
        price: '7',
        // rating: 4.4,
        // category: 'Snack',
        // discountPercent: 20,
        supplementDesc:
            'White Cheddar & Almonds, Sharp Cheddar & Cashews, Pepper Jack & Peanuts'),
    MarketModel(
        supplementName: 'BIENA Chickpea Snacks',
        logo: 'assets/images/store/snack/snack7.png',
        price: '16',
        // rating: 4.4,
        // category: 'Snack',
        // discountPercent: 20,
        supplementDesc:
            'BIENA Chickpea Snacks, Sea Salt Gluten Free Vegan Dairy Free Plant-Based Protein, (Packaging May Vary), (1.2 Ounce (Pack of 10))'),
  ];
  static List<MarketModel> dumbell = [
    //---------------------------------------------------

    //--------------------------------------------------------------

    //--------------------------------------------------------------
    MarketModel(
        supplementName: 'Balelinko Hand Weights',
        logo: 'assets/images/store/dumbell/d4.jpg',
        price: '130',
        // rating: 4.4,
        // discountPercent: 20,
        // category: 'Dumbeell',
        supplementDesc:
            'Balelinko Hand Weights Neoprene Coated Hex Dumbbell Set with Rack Stand, Exercise & Fitness Dumbbell for Home Gym Equipment Workouts Strength Training'),
    MarketModel(
        supplementName: 'Balancefrom Rubber Encased',
        logo: 'assets/images/store/dumbell/d2.jpg',
        price: '24',
        // rating: 4.4,
        // category: 'Dumbeell',
        // discountPercent: 20,
        supplementDesc: 'Balancefrom Rubber Encased Hex Dumbbell in Pairs'),
    MarketModel(
        supplementName: 'Custom Logo Fixed Curl',
        logo: 'assets/images/store/dumbell/d5.jpg',
        price: '45',
        // category: 'Dumbeell',
        // rating: 4.4,
        // discountPercent: 20,
        supplementDesc: 'Custom Logo Fixed Curl Barbell Set (10-55KG)'),
    MarketModel(
        supplementName: 'Hollow Kettlebell',
        logo: 'assets/images/store/dumbell/d6.jpg',
        price: '20',
        // rating: 4.4,
        // category: 'Dumbeell',
        // discountPercent: 20,
        supplementDesc: 'Hollow Kettlebell – Matte Finish (8kg to 36kg)'),
  ];
  static List<List<MarketModel>> marketCatsItem = [
    protiens,
    amino,
    snack,
    dumbell
  ];
}

class MarketCategory {
  String? name;
  String? img;
  int? id;
  String? itemsCount;
  MarketCategory({
    this.name,
    this.img,
    this.id,
    this.itemsCount,
  });
}
