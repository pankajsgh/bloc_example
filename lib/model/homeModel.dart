
class HomeCardModel {
  List<CardModel> card;

  HomeCardModel({
    required this.card });
}


class CardModel {
  int id;
  String title;
  String? image;

  CardModel({
    required this.id, required this.title, this.image
  });
}
