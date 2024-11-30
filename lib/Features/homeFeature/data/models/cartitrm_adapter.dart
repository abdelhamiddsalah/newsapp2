import 'package:hive/hive.dart';
import 'package:newsapp/features/cartFeature/logic/cart_cubit/cartcubit_cubit.dart';
import 'package:newsapp/features/homeFeature/data/models/mainnews.dart';

class CartItemAdapter extends TypeAdapter<CartItem> {
  @override
  final int typeId = 2; // يجب أن يكون هذا رقم فريد لنوع CartItem

  @override
  CartItem read(BinaryReader reader) {
    // قراءه بيانات `Articles` داخل `CartItem`
    final article = reader.read() as Articles;
    return CartItem(article: article);
  }

  @override
  void write(BinaryWriter writer, CartItem obj) {
    // كتابة بيانات `Articles` داخل `CartItem`
    writer.write(obj.article);
  }
}
