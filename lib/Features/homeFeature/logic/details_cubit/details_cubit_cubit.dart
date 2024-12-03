import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Features/homeFeature/data/models/mainnews.dart';
part 'details_cubit_state.dart';

class DetailsCubitCubit extends Cubit<DetailsCubitState> {
  DetailsCubitCubit() : super(DetailsCubitInitial());

  void loadArticleDetails(Articles article) {
    emit(ArticleDetailsLoaded(article));
  }


}
