const String appName = "Technical Test Okta";

const String baseUrlAPI = "https://api.themoviedb.org/3/";
const String baseUrlImage = "https://image.tmdb.org/t/p/w500/";

List<String> listBanner = [
  'https://image.tmdb.org/t/p/original/7NRGAtu8E4343NSKwhkgmVRDINw.jpg',
  'https://image.tmdb.org/t/p/original/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg',
  'https://image.tmdb.org/t/p/original/tj7mp7uWjVw5N73G5Hwm1bkMOcD.jpg'
];

List<ModelGrid> home_items = [
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'ssEFC5wfFjj7lJpUgwJDOK1Xu1J.jpg',
      image_path: 'assets/images/movies/jumanji.jpg'),
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg',
      image_path: 'assets/images/movies/jumanji.jpg'),
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg',
      image_path: 'assets/images/movies/jumanji.jpg'),
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg',
      image_path: 'assets/images/movies/jumanji.jpg'),
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg',
      image_path: 'assets/images/movies/jumanji.jpg'),
  ModelGrid(
      title: "Jumanji 2",
      subtitle:
          "When Spencer goes back          into the fantastical world of Jumanji, pals Martha, Fridge and ",
      ratings: "6.0",
      logo_path: 'b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg',
      image_path: 'assets/images/movies/jumanji.jpg')
];

class ModelGrid {
  final String title;
  final String subtitle;
  final String ratings;
  final String logo_path;
  final String image_path;

  ModelGrid(
      {required this.title,
      required this.subtitle,
      required this.ratings,
      required this.logo_path,
      required this.image_path});
}
