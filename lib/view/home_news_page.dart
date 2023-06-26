import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_11_12/controller/news_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeNewsPage extends StatelessWidget {
   HomeNewsPage({super.key});
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'News Data io'
        ),
      ),
      body: GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          // ignore: unnecessary_null_comparison
          if(controller.newSResModel==null && controller.isLoading==true){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount:  controller.newSResModel!.results!.length,
            itemBuilder: (context, index) {
              var data = controller.newSResModel!.results![index];
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: data.imageUrl!=null? Image.network(
                      data.imageUrl.toString(),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      )
                    : Image.asset(
                      'assets/images/default.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      ),
                  ),
                Row(
                  children: [
                    Text(
                    data.pubDate.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                  data.language.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blue
                  ),
                   ), 
                  ],
                ),
                  
                  Text(
                    data.title.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    data.description.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ), 
                ],
              );
            },
          );
        },
      ),
    );
  }
}
