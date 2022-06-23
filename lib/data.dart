import 'package:insta_design/models/category.dart';
import 'package:insta_design/models/movie.dart';

List<Game> getMovies() {
  return [
    Game(
        name: "MovieOne",
        image: 'https://assets-prd.ignimgs.com/2022/03/10/top10-openworldgames-blogroll-1646922881724.jpg',
        starsValue: 5.6,
        downloadValue: '64k'),
    Game(
        name: "Movie2",
        image: 'https://i.ytimg.com/vi/sU015z1yr7s/hqdefault.jpg',
        starsValue: 3.4,
        downloadValue: '60k'),
    Game(
        name: "Moview3",
        image:
            'https://images.ctfassets.net/5lpapfxq15sk/3Fd2H2A1PFMb3iMVxsRv3c/49347a0325874618ee786480fed843a2/NW-KA-mob.jpg',
        starsValue: 5.0,
        downloadValue: '109k'),
    Game(
        name: "Movie4",
        image: 'https://c.files.bbci.co.uk/E909/production/_112375695_crucible976.jpg',
        starsValue: 5.0,
        downloadValue: '21k'),
    Game(
        name: "Movie4",
        image:
            'https://ichef.bbci.co.uk/news/976/cpsprodpb/11E3/production/_113897540_halo_infinite_keyart_primary_horiz.jpg',
        starsValue: 5.0,
        downloadValue: '10k'),
  ];
}

List<Category> getCategory() {
  return [
    Category(categoryName: 'Action', topRated: getMovies()),
    Category(categoryName: 'Family', topRated: getMovies()),
    Category(categoryName: 'Puzzle', topRated: getMovies()),
    Category(categoryName: 'Adventure', topRated: getMovies()),
    Category(categoryName: 'Horror', topRated: getMovies()),
  ];
}
