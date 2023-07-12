class BookItem {
  static int index = 0;

  final int id = index++;
  final String image;
  final String name;
  final String edition;
  final String description;
  final int pageCount;
  final double price;
  final String author;
  final double rating;
  final double reviewCount;
  final String publication;
  final String releasedDate;

  BookItem(
      {required this.name,
      required this.image,
      required this.edition,
      required this.description,
      required this.price,
      required this.author,
      required this.rating,
      required this.reviewCount,
      required this.publication,
      required this.releasedDate,
      required this.pageCount});
}
