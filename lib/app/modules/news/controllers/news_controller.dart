import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kurslar/app/const/custom_widgets/custom_snackbars.dart';
import 'package:kurslar/app/data/models/news_model.dart';

class NewsController extends GetxController {
  //TODO: Implement NewsController
  late FirebaseFirestore firebaseFirestore;
  final newsList = <NewsModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    firebaseFirestore = FirebaseFirestore.instance;
    super.onInit();
  }

  @override
  void onReady() async {
    try {
      newsList.value = await getNews();
    } catch (e) {
      showErrorSnackbar(e.toString());
    }
    super.onReady();
  }

  @override
  void onClose() {}

  Future<List<NewsModel>> getNews() async {
    List<NewsModel> newsModel = [];
    firebaseFirestore.collection("news").get().then((snapshot) {
      for (var element in snapshot.docs) {
        final datas = NewsModel.fromJson(element.data());
        datas.postId = element.id;
        newsModel.add(datas);
      }
    });
    return newsModel;
  }
}
