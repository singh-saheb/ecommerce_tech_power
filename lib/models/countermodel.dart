import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int counter = 0;
  List cartItems = [];

  static int counterStatic = 0;
  incrementCounter() {
    counter++;

    notifyListeners();
  }

  addToCart() {
    //LOGIC GOES HERE
    cartItems.add(127);
    notifyListeners();
  }
}
