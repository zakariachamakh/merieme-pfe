import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:office_furniture_store/core/app_data.dart';
import 'package:office_furniture_store/core/app_style.dart';
import 'package:office_furniture_store/src/model/furniture.dart';
import 'package:office_furniture_store/src/view/widget/furniture_list_view.dart';
import 'package:office_furniture_store/src/view/screen/office_furniture_detail_screen.dart';

class OfficeFurnitureListScreen extends StatefulWidget {
  const OfficeFurnitureListScreen({super.key});

  @override
  State<OfficeFurnitureListScreen> createState() =>
      _OfficeFurnitureListScreenState();
}

class _OfficeFurnitureListScreenState extends State<OfficeFurnitureListScreen> {
  final furnitureController = Get.put(FurnitureController());
  final box = GetStorage();

  PreferredSize _appBar() {
    final String username = box.read('username');
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello ${username}", style: h2Style),
                  Text("Buy Your favorite product", style: h3Style),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.menu, color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          border: textFieldStyle,
          focusedBorder: textFieldStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Widget?> navigate(Furniture furniture) {
      return Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) =>
              OfficeFurnitureDetailScreen(furniture: furniture),
        ),
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            _searchBar(),
            Obx(() {
              if (furnitureController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (furnitureController.hasError.value) {
                return Center(
                  child: Text(
                    'Error: ${furnitureController.errorMessage.value}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Featured", style: h2Style),
                    FurnitureListView(
                      furnitureList: furnitureController.furnitureList.value,
                      onTap: navigate,
                    ),
                    const SizedBox(height: 20),
                    const Text("Popular", style: h2Style),
                    FurnitureListView(
                      furnitureList: furnitureController.furnitureList.value,
                      isHorizontal: false,
                      onTap: navigate,
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

class FurnitureController extends GetxController {
  final isLoading = true.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final furnitureList = RxList<Furniture>();

  @override
  void onInit() {
    super.onInit();
    fetchFurnitureList();
  }

  Future<void> fetchFurnitureList() async {
    try {
      isLoading(true);
      final list = await AppData.getFurnitureList();
      if (list != null) {
        furnitureList.assignAll(list);
      }
      hasError(false);
    } catch (e) {
      hasError(true);
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
