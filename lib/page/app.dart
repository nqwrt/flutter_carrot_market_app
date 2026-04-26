import 'package:flutter/material.dart';
import 'package:flutter_carrot_market_app/page/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  int _currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPageIndex = 0;
  }

  /*
   * body UI
   */
  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
        break;
      case 1:
        return Container();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      case 4:
        return Container();
        break;
    }
    return Container();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName, String label){
    return BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/svg/${iconName}_off.svg",width: 22),
      label: label,
      activeIcon:  SvgPicture.asset("assets/svg/${iconName}_on.svg",width: 22), //on 스위치로 처리
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type:BottomNavigationBarType.fixed,
      onTap: (int index){
        print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      //selectedFontSize: 12,
      // selectedItemColor: Colors.black,
      // selectedLabelStyle:TextStyle(color: Colors.black),
      items: [
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("notes", "동네생활"),
        _bottomNavigationBarItem("location", "내근처"),
        _bottomNavigationBarItem("chat", "채팅"),
        _bottomNavigationBarItem("user", "나의 당근"),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

//https://www.youtube.com/watch?v=sDXmGvzzf-E&list=PLgRxBCVPaZ_3R0h7mCkLJ1RKh7XRvoZdF&index=6

//깃허브 참고
//https://github.com/sudar-life/flutter_carrot_market/blob/feature/data-load/lib/pages/app.dart
