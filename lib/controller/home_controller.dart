import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/news.dart';
import '../repository/repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  RxString name = "".obs, email = "".obs;
  String urlnya = "";
  // late SharedPreferences sharedPreferences;

  NewsRepository newsRepository = Get.find<NewsRepository>();
  RxList list_news = <News>[].obs;
  RxBool isLoading = false.obs;

  void callAPI() {
    isLoading.value = true;
    newsRepository.getNews().then((List<News> value) {
      list_news.addAll(value);
      isLoading.value = false;
    }).catchError((err, track) {
      print("Error ${err} ${track}");
    });
  }

  void getbox() {
    if (GetStorage().hasData('users')) {
      Map<String, dynamic> users = GetStorage().read('users');
      name.value = users['nama'];
      email.value = users['email'];
      print(name.value);
      print(email.value);
    } else {
      print('no getbox!');
    }
  }

  link(String urlnya) async {
    final link = urlnya;
    await launch('$link');
  }

  @override
  void onReady() {
    callAPI();
    getbox();
    super.onReady();
  }
}
