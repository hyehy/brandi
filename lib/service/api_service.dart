import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxService {
  // var dio = Dio();

  Future<ApiService> init() async {
    return this;
  }

  Future<String?> getJSONData() async {
    var url = 'https://dapi.kakao.com/v2/search/image?target=title&query=오징어게임';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 436837e33ca8922d8296ac3785d4e072"});
    print(response.body);
    return "Success!!";
  }
}
