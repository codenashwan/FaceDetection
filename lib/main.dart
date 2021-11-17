import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'models/Mhome.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  await dotenv.load(fileName: ".env");
  String api = dotenv.env['API'].toString();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Mhome(api)),
      ],
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: GetMaterialApp(
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
      ),
    ),
  );
}
