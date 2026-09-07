class Destination {
  final String id;
  final String title;
  final String country;
  final String description;
  final String imageUrl;
  final double rating;
  final String region;
  final List<String> highlights;
  final double price;
  final int duration;
  final bool featured;

  const Destination({
    required this.id,
    required this.title,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.region,
    required this.highlights,
    required this.price,
    required this.duration,
    required this.featured,
  });
}
