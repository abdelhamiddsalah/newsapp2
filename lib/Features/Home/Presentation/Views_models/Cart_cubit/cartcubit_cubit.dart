import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Features/Home/data/Models/News.dart';

part 'cartcubit_state.dart';
class CartItem {
  final Articles article; 
  CartItem({required this.article});
}

class CartcubitCubit extends Cubit<CartcubitState> {
  CartcubitCubit() : super(CartcubitInitial());
  final List<dynamic> _cartItems = [];

 void addToCart(Articles article) {
    CartItem newItem = CartItem(article: article);
    _cartItems.add(newItem);
    emit(CartUpdated(List.unmodifiable(_cartItems)));
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    emit(CartUpdated(List.unmodifiable(_cartItems)));
  }

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
}
