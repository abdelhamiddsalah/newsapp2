part of 'cartcubit_cubit.dart';

@immutable
abstract class CartcubitState {}

class CartcubitInitial extends CartcubitState {}

class CartUpdated extends CartcubitState {
  final List<CartItem> cartItems;

  CartUpdated(this.cartItems);
}
