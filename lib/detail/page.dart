import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: _buildBody(size),
        floatingActionButton: Hero(
          tag: 'button',
          child: ElevatedButton(onPressed: () {}, child: Text('click')),
        ));
  }

  Widget _buildBody(Size size) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
                color: Colors.blue[100], height: size.height * 1 / 4 + 60),
            Container(color: Colors.blue),
          ],
        ),
        Hero(
          tag: 'test',
          child: Container(
            margin: EdgeInsets.only(top: 60, left: size.width * 1 / 2),
            width: size.width / 2 - 50,
            height: 200,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
