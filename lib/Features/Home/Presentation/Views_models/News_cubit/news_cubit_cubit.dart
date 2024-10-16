import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/Features/Home/data/Models/News.dart';
import 'package:newsapp/Features/Home/data/Models/TopNews.dart';
import 'package:newsapp/Features/Home/data/Repo/RepoNews.dart';

part 'news_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsCubitState> {
  final Reponews reponews;
  NewsCubitCubit(this.reponews) : super(NewsCubitInitial());
  
  void emitGetAllUsers(){
    reponews.getAllNews().then((newslist) {
    emit(GetAllNews(newslist: newslist));
    });
  }
  
   void emitGetAllTopnews(){
    reponews.getAlltopNews().then((newslist) {
   emit(GetTopNews(newslist: newslist));
    });
  }

    void emitGetAllTopnewssortd(String sortby){
    reponews.getAllNewssorted(sortby).then((newslist) {
   emit(GetAllnewsSorted(newslist: newslist));
    });
  }

     void emitGetAllTopnewssortdbypage(int page){
    reponews.getAllNewssortedbypage(page).then((newslist) {
   emit(GetAllnewsSorted(newslist: newslist));
    });
  }
   
}
