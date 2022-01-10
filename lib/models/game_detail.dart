class GameDetailModel {
  final int id;
  final String name;
  final String description;
  final List<String> screenshots;
  final String trailer;
  final int metacriticRating;
  final List<String> availablePlatforms;
  final String image;

  GameDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.screenshots,
    required this.trailer,
    required this.metacriticRating,
    required this.availablePlatforms,
    required this.image,
  });
}
