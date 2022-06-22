import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topBar(),
            const SizedBox(height: 8),
            title(),
            const SizedBox(height: 20),
            listCategory(),
            Container(),
            const SizedBox(height: 20),
            subTitle(),
            const SizedBox(height: 16),
            listGames()
          ],
        ),
      )),
    );
  }

  Widget listCategory() {
    return Flexible(
      child: SizedBox(
        height: 50,
        child: Center(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: [
                categoryItem(true, 'Action'),
                categoryItem(false, 'Family'),
                categoryItem(false, 'Puzzle'),
                categoryItem(false, 'Adventure'),
              ]),
        ),
      ),
    );
  }

  Widget listGames() {
    return Flexible(
      child: SizedBox(
        height: 200,
        child: Center(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: [
                cardGame('https://i.ytimg.com/vi/sU015z1yr7s/hqdefault.jpg'),
                cardGame('https://assets-prd.ignimgs.com/2022/03/10/top10-openworldgames-blogroll-1646922881724.jpg'),
              ]),
        ),
      ),
    );
  }

  Widget cardGame(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 220,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget categoryItem(bool isSelected, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: isSelected ? selectedGradient() : unselectedGradient(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient selectedGradient() {
    return LinearGradient(colors: [
      Color.lerp(Colors.blue.withOpacity(.2), Colors.blue, 0.2)!,
      Colors.blue,
      Colors.blue[800]!,
    ]);
  }

  LinearGradient unselectedGradient() {
    return LinearGradient(colors: [
      Color.lerp(Colors.blue.withOpacity(.1), Colors.lightBlue, 0.2)!,
      Colors.lightBlue.withOpacity(0.2),
      Colors.lightBlue.withOpacity(0.2),
    ]);
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.0),
      child: Text(
        'Browse games',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget subTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        'Featured games',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
              child: Icon(
            Icons.sort,
            color: Colors.black,
            size: 32,
          )),
          iconWithNotification()
        ],
      ),
    );
  }

  Widget iconWithNotification() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Stack(
        children: [
          Icon(
            Icons.notifications,
            size: 28,
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.purpleAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody(Widget child) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: -50, left: -50, child: circleWidget(Colors.blue, 300)),
        Positioned(bottom: -50, left: -50, child: circleWidget(Colors.blue, 280)),
        Align(alignment: const Alignment(2.1, 0), child: circleWidget(Colors.purpleAccent, 200)),
        Positioned(child: child)
      ],
    );
  }

  Widget circleWidget(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.01),
        boxShadow: [BoxShadow(blurRadius: 150, spreadRadius: 60, color: color.withOpacity(0.19))],
        backgroundBlendMode: BlendMode.darken,
      ),
    );
  }
}
