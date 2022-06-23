import 'package:flutter/material.dart';
import 'package:insta_design/data.dart';
import 'package:insta_design/models/category.dart';
import 'package:insta_design/widgets/card_game.dart';
import 'package:insta_design/widgets/gradient_button.dart';
import 'package:insta_design/widgets/item_movie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Category> categories = getCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: topBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverToBoxAdapter(child: title()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: listCategory()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: subTitle('Featured games')),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: listGames(categories.first)),
            const SliverToBoxAdapter(child: SizedBox(height: 26)),
            SliverToBoxAdapter(child: topRatedSubTitle()),
            const SliverToBoxAdapter(child: SizedBox(height: 26)),
            SliverToBoxAdapter(child: listTopRated(categories.first)),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      )),
    );
  }

  Widget topRatedSubTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        subTitle('Top action games'),
        const Spacer(),
        Text(
          'See all',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.blue[700],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget listTopRated(Category category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: category.topRated.map((e) => ItemGame(movie: e)).toList(),
      ),
    );
  }

  Widget listCategory() {
    return SizedBox(
      height: 50,
      child: Center(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            children: const [
              GradientButton(isSelected: true, title: 'Action'),
              GradientButton(isSelected: false, title: 'Family'),
              GradientButton(isSelected: false, title: 'Puzzle'),
              GradientButton(isSelected: false, title: 'Adventure'),
            ]),
      ),
    );
  }

  Widget listGames(Category category) {
    return SizedBox(
      height: 200,
      child: Center(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: category.topRated
                .map((e) => CardGameWidget(
                      game: e,
                    ))
                .toList()),
      ),
    );
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

  Widget subTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        text,
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

  Widget background(Widget child) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: -50, left: -50, child: circleWidget(Colors.blue, 300)),
        Positioned(bottom: -50, left: -50, child: circleWidget(Colors.blue, 280)),
        Align(alignment: const Alignment(2.1, 0), child: circleWidget(Colors.purpleAccent, 200)),
        Positioned.fill(child: child)
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
