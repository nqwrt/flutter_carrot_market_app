import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AppBar _appbarWidget(){
    return AppBar(
      title: GestureDetector(
        onTap: (){
          print("click");
        },
        child: Row(
          children: [
            Text("신림동"),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
      elevation: 1, //그림자 깊이 = 떠 있는 정도
      actions: [
        IconButton(onPressed: (){},icon: Icon(Icons.search)), //pub.dev 사이트 접속
        IconButton(onPressed: (){},icon: Icon(Icons.tune)),
        IconButton(onPressed: (){},icon: SvgPicture.asset("assets/svg/bell.svg",width: 22,)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
    );
  }
}
