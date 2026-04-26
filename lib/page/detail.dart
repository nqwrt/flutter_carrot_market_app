import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  final Map<String,String> data;
  const DetailContentView({super.key,required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.data["title"] ?? "제목없음"),
      ),
    );
  }
}
