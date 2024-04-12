import 'package:flutter/material.dart';

//import 'Menu page.dart';

class RecipeDataProvider with ChangeNotifier {
  RecipeData _recipeData = RecipeData(
      name: 'fdw',
      selectedMealType: "",
      description: '',
      quantity: '',
      price: '',
      selectedOption: '',
      selectedPreOrderDailyorder: '',
      isSelectedBannanaLeaf: false,
      isSelectedContainer: true,
      selectedSize: '',
      imagePath: '');

  RecipeData get recipeData => _recipeData;

  setRecipeData(RecipeData recipeData) {
    _recipeData = recipeData;
    notifyListeners();
  }
}

class RecipeData {
  final String name;
  final String description;
  final String quantity;
  final String price;
  final String selectedOption;
  final String selectedMealType;
  final String selectedPreOrderDailyorder;
  final bool isSelectedBannanaLeaf;
  final bool isSelectedContainer;
  final String selectedSize;
  final String imagePath;

  RecipeData({
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.selectedOption,
    required this.selectedMealType,
    required this.selectedPreOrderDailyorder,
    required this.isSelectedBannanaLeaf,
    required this.isSelectedContainer,
    required this.selectedSize,
    required this.imagePath,
  });
}
