import 'package:flutter/material.dart';
import 'package:insta_design/models/movie.dart';

class CardGameWidget extends StatelessWidget {
  final Game game;

  const CardGameWidget({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        cardGame(context),
        getInfo(context),
      ],
    );
  }

  Widget getInfo(BuildContext context) {
    final hintColor = Colors.white.withOpacity(0.9);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .73,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            const Spacer(),
            Text(
              game.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            getStars(),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.download_outlined,
                  size: 20,
                  color: hintColor,
                ),
                const SizedBox(width: 10),
                Text(
                  game.downloadValue,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: hintColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'downloads',
                  style: TextStyle(color: hintColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getStars() {
    const colorFull = Colors.yellow;
    const colorEmpty = Colors.grey;
    const size = 18.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(Icons.star, size: size, color: colorFull),
        Icon(Icons.star, size: size, color: colorFull),
        Icon(Icons.star, size: size, color: colorFull),
        Icon(Icons.star, size: size, color: colorFull),
        Icon(Icons.star, size: size, color: colorEmpty),
      ],
    );
  }

  Widget cardGame(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 220,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: NetworkImage(game.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
