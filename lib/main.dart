import 'package:flutter/material.dart';
import 'package:flutter_carrot_market_app/page/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white, //앱의 기본(대표) 색상을 흰색으로 지정 //버튼, 앱바(AppBar), 강조 요소 등에 기본적으로 사용됨
        primarySwatch: Colors.blue, //“앱 전체를 파란색 계열로 자동 스타일링해줘”
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const App(),
    );
  }
}
