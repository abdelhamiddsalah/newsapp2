part of 'news_cubit_cubit.dart';

@immutable
sealed class NewsCubitState {}

final class NewsCubitInitial extends NewsCubitState {}
class GetAllNews extends NewsCubitState{
  final News newslist;

  GetAllNews({required this.newslist});
}

class GetTopNews extends NewsCubitState{
  final TopNews newslist;

  GetTopNews({required this.newslist});
}

class GetAllnewsSorted extends NewsCubitState{
  final News newslist;
  GetAllnewsSorted({required this.newslist});
}

class GetAllNewsLoading extends NewsCubitState{}




class CartUpdated extends NewsCubitState {
  final List<dynamic> cartItems;

  CartUpdated(this.cartItems);
}

