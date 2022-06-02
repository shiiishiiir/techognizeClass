// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techognize/APIs/WeatherApi.dart';
import 'package:techognize/Homepage.dart';
import 'package:techognize/SplashScreen.dart';
import 'package:techognize/widgetss/ContactListJson/ContactListEtc.dart';
import 'package:techognize/widgetss/Firebase/AuthPhone.dart';
import 'package:techognize/widgetss/Firebase/FirePhoneVerifiedHome.dart';
import 'package:techognize/widgetss/Firebase/MyEmailAuth.dart';
import 'package:techognize/widgetss/Firebase/TestPhoneAuth.dart';
import 'package:techognize/widgetss/GeoLocator.dart';
import 'package:techognize/widgetss/GetWidgetCarousel.dart';
import 'package:techognize/widgetss/GradiantColors.dart';
import 'package:techognize/widgetss/ListViewTiless.dart';
import 'package:techognize/widgetss/MyBottomBarr.dart';
import 'package:techognize/widgetss/MyCard.dart';
import 'package:techognize/widgetss/MyDrawer.dart';
import 'package:techognize/widgetss/MyExpanded.dart';
import 'package:techognize/widgetss/MyGridVieww.dart';
import 'package:techognize/widgetss/MyLiquidSwipe.dart';
import 'package:techognize/widgetss/MyPageView.dart';
import 'package:techognize/widgetss/MyStackPositionedd.dart';
import 'package:techognize/widgetss/MyTabBar.dart';
import 'package:techognize/widgetss/NewListVieww.dart';
import 'package:techognize/widgetss/Pages/PageOne.dart';
import 'package:techognize/widgetss/RegForms/EmailAuth.dart';
import 'package:techognize/widgetss/RegForms/FireDataTest.dart';
import 'package:techognize/widgetss/RegForms/MaheTest.dart';
import 'package:techognize/widgetss/RegForms/RegForm.dart';
import 'package:techognize/widgetss/RegForms/RegFormDataEntry.dart';
import 'package:techognize/widgetss/SliverAppBarr.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Shishir());
}



class Shishir extends StatelessWidget {
  const Shishir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.red),
      home: FireHomeStore(),
    );
  }
}


