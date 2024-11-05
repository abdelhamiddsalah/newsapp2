import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';

part 'cartcubit_state.dart';

@HiveType(typeId: 2)
class CartItem {
  @HiveField(0)
  final Articles article;

  CartItem({required this.article});
}

class CartCubit extends Cubit<CartcubitState> {
  CartCubit() : super(CartcubitInitial()) {
    _cartBox = Hive.box<CartItem>('cartBox');
    _loadCart();
  }

  final List<CartItem> _cartItems = [];
  late Box<CartItem> _cartBox;

  // تحميل عناصر السلة من Hive عند بدء التطبيق
  void _loadCart() {
    _cartItems.addAll(_cartBox.values);
    emit(CartUpdated(List.unmodifiable(_cartItems)));
  }

  // إضافة عنصر للسلة وتحديث Hive
  void addToCart(Articles article) {
    CartItem newItem = CartItem(article: article);
    _cartItems.add(newItem);
    _cartBox.add(newItem); // حفظ في Hive
    emit(CartUpdated(List.unmodifiable(_cartItems)));
  }

  // إزالة عنصر من السلة وتحديث Hive
  void removeFromCart(CartItem item) {
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems.removeAt(index);
      _cartBox.deleteAt(index); // حذف من Hive
      emit(CartUpdated(List.unmodifiable(_cartItems)));
    }
  }

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  @override
  Future<void> close() {
    _cartBox.close();
    return super.close();
  }
}
