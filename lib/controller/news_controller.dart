import 'package:flutter_fetch_api_11_12/model/new_res_model.dart';
import 'package:flutter_fetch_api_11_12/service/news_service.dart';
import 'package:get/get.dart';
class NewsController extends GetxController{
  NewSResModel? newSResModel = NewSResModel();
  NewsService newsService = NewsService();
  bool isLoading=false;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData()async{
    isLoading=true;
    var data = await newsService.fetchNewsAPI();
    if(data!=null){
      newSResModel=data;
    }
    isLoading=false;
    update(); // setState
  }

}