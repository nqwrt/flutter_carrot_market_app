import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  final Map<String,String> data;
  const DetailContentView({super.key,required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {

  PreferredSizeWidget _appbarWidget(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share)), //pub.dev 사이트 접속
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ]
    );
  }

  Widget _bodyWidget(){
    final size = MediaQuery.of(context).size;
    final tag = widget.data["cid"] ?? widget.data["image"] ?? "default_tag";
    print("태그"+ tag);
    return Container(
      child: Hero(
        tag: tag,
        child: Image.asset(
          widget.data["image"].toString(),
          width: size.width,
          fit: BoxFit.cover, //이 그러짐 방지
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, //치고 올라감
        appBar: _appbarWidget(),
        body: _bodyWidget()
    );
  }
}
