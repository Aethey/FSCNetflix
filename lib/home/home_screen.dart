import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  ListView _buildBody() {
    return ListView(
      children: <Widget>[
        Container(
          height: 280.0,
          width: double.infinity,
          child: _buildPageView(),
        )
      ],
    );
  }

  /// animation pageView
  PageView _buildPageView() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return _buildAnimatedBuilder(index);
        });
  }

  AnimatedBuilder _buildAnimatedBuilder(int index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (context, widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.3))
              .clamp(0.0, 1.0);
          print('this is value: $value');
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            // その必要が無い！
            // width: Curves.easeInOut.transform(value) * size.width * 4,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    )
                  ]),
              child: Center(
                child: Hero(
                  tag: 'movies[index].imageUrl',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.blue,
                      height: 220.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Image(
        image: AssetImage('assets/images/netflix_logo.png'),
        width: size.width / 4,
      ),
      leading: IconButton(
        color: Colors.black,
        icon: Icon(Icons.menu),
        iconSize: 30.0,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.search),
          iconSize: 30.0,
          onPressed: () {},
        )
      ],
    );
  }
}
