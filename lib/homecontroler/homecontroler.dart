// ignore_for_file: deprecated_member_use, unused_local_variable, unnecessary_import, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart' as d;
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  late File imagebefore;
  late Uint8List imageafter;
  final picker = ImagePicker();
  Future grtImage() async {
    PickedFile? pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    imagebefore = File(pickedFile!.path);
    update();
  }

  void uploadImage(File file) async {
    String? fileName = file.path.split("/").last;
    d.FormData data = d.FormData.fromMap({
      "source_image_file":
          await d.MultipartFile.fromFile(file.path, filename: fileName)
    });
    Dio dio = d.Dio();
    var respose =
        await dio.post("https:api.slazzer.com/v2.B/remove_image_background",
            data: data,
            options: Options(
              headers: {"API-KEY": "994d77a89c9c4c1e89ad129084af3766"},
              responseType: d.ResponseType.bytes,
            ));
    imageafter = respose.data;
    update();
  }
}
