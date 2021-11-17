import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/home.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        focusColor: Color(0xff005FFE),
        cardColor: Color(0xffa3a3a3),
        fontFamily: 'Rabar',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Directionality(
            textDirection: TextDirection.rtl,
            child: Home(),
          ),
          transition: Transition.fadeIn,
        ),
      ],
    ),
  );
}
