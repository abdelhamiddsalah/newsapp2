part of 'news_state_cubit.dart';

@immutable
sealed class NewsStateState {}

final class NewsStateInitial extends NewsStateState {}
class NewsChanged extends NewsStateState {
  final newsapp newsType;
  NewsChanged(this.newsType);
}