import 'package:flutter/material.dart';
import 'package:insta_design/models/movie.dart';
import 'package:insta_design/widgets/gradient_button.dart';

class ItemGame extends StatelessWidget {
  final Game movie;

  const ItemGame({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          previewWithInfo(context),
          actionButton(),
        ],
      ),
    );
  }

  Widget previewWithInfo(BuildContext context) {
    return Row(
      children: [
        moviePreviewImage(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            bottomInfo(),
          ],
        ),
      ],
    );
  }

  Widget bottomInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rating(),
        const SizedBox(width: 12),
        downloads(),
      ],
    );
  }

  Widget rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[800],
          size: 22,
        ),
        const SizedBox(width: 4),
        Text(
          '${movie.starsValue.toString()} stars',
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget downloads() {
    return Row(
      children: [
        Icon(
          Icons.download_outlined,
          color: Colors.grey[500],
          size: 22,
        ),
        const SizedBox(width: 4),
        Text(
          movie.downloadValue.toString(),
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget moviePreviewImage(BuildContext context) {
    const size = 64.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(image: NetworkImage(movie.image), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget actionButton() {
    return const GradientButton(
      isSelected: true,
      title: 'Play',
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    );
  }
}
