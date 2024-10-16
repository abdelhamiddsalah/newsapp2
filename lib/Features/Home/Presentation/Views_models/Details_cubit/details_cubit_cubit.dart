import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Features/Home/data/Models/News.dart';
part 'details_cubit_state.dart';

class DetailsCubitCubit extends Cubit<DetailsCubitState> {
  DetailsCubitCubit() : super(DetailsCubitInitial());

  void loadArticleDetails(Articles article) {
    emit(ArticleDetailsLoaded(article));
  }


}
