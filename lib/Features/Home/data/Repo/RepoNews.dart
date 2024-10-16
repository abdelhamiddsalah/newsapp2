import 'package:newsapp/Features/Home/data/Models/News.dart';
import 'package:newsapp/Features/Home/data/Models/TopNews.dart';
import 'package:newsapp/Features/Home/data/Services/Api_Networking.dart';

class Reponews {
  final Api_Networking api_networking;

  Reponews( this.api_networking);

  Future<News> getAllNews() async{
    var response =await api_networking.getNews();
    return response;
  }

   Future<News> getAllNewssorted(String  sortby) async{
    var response =await api_networking.getNewsSortby(sortby);
    return response;
  }

  Future<News> getAllNewssortedbypage(int  page) async{
    var response =await api_networking.getNewsSortbypage(page);
    return response;
  }

  Future<TopNews> getAlltopNews() async{
    var response =await api_networking.getTopNews();
    return response;
  }
}