import 'package:brandi/modules/search/search_controller.dart';
import 'package:brandi/routes.dart';
import 'package:brandi/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/search/widgets/search_page.dart';

void main() {
  Get.putAsync(() => ApiService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: Routes.search,
        builder: (context, _) {
          var child = _!;
          // final navigatorKey = child.key as GlobalKey<NavigatorState>;
          return child;
        },
        getPages: [
          GetPage(
            name: Routes.search,
            page: () => SearchPage(),
            binding: BindingsBuilder(() => {Get.put(SearchController())}),
          )
        ]);
  }
}
