import 'package:flutter/material.dart';
import 'package:flutter_carrot_market_app/data/product_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '/data/product_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<Map<String,String>> datas = [];

  @override
  void initState() {
    super.initState();
    datas = productDatas; // 👈 여기만 바꾸면 끝
  }

  // intl 등록
  final oCcy = NumberFormat("#,###", "ko_KR");

  String calStringToWon(String price) {
    return "${oCcy.format(int.parse(price))}원";
  }

  AppBar _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
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
        IconButton(onPressed: () {}, icon: Icon(Icons.search)), //pub.dev 사이트 접속
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(onPressed: () {},
            icon: SvgPicture.asset("assets/svg/bell.svg", width: 22,)),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        //print("이것은 ====== " + index.toString());
        return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    datas[index]["image"].toString(),
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //end 도 연습
                      children: [
                        Text(
                            datas[index]["title"].toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15)
                        ),
                        SizedBox(height: 5),
                        Text(
                          datas[index]["location"].toString(),
                          style: TextStyle(fontSize: 12, color: Colors.black
                              .withOpacity(0.3)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          calStringToWon(datas[index]["price"].toString()),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                  "assets/svg/heart_off.svg",
                                  width: 13,
                                  height: 13
                              ),
                              SizedBox(width: 5,), //사이간격 띄우기
                              Text(datas[index]["likes"].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        );
      },
      itemCount: datas.length,
      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1, color: Colors.black);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
