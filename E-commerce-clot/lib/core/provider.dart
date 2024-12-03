// import 'package:flutter/material.dart';

// class ProductProvider extends ChangeNotifier {
//   String _selectedSize = "S";
//   String _selectedColor = "Green";
//   static int _quantity = 0;

//   // Getters
//   String get selectedSize => _selectedSize;
//   String get selectedColor => _selectedColor;
//   int get quantity => _quantity;

//   // Setters with notification
//   void setSize(String size) {
//     _selectedSize = size;
//     notifyListeners();
//   }

//   void setColor(String color) {
//     _selectedColor = color;
//     notifyListeners();
//   }

//   void incrementQuantity() {
//     _quantity++;
//     notifyListeners();
//   }

//   void decrementQuantity() {
//     if (_quantity > 0) {
//       _quantity--;
//       notifyListeners();
//     }
//   }
// }
