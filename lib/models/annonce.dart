class Annonce {
  String titre;
  String description;
  List categorie;
  List<String> imageURL;
  String date;
  String userId;

  Annonce({
    required this.titre,
    required this.description,
    required this.categorie,
    required this.imageURL,
    required this.date,
    required this.userId,
  });
  // Enum stock = ["Quantite En stock", "Unique"];
  factory Annonce.fromMap(Map<String, dynamic> map) {
    return Annonce(
      titre: map['titre'],
      description: map['description'],
      categorie: map['categorie'],
      imageURL: map['imageURL'],
      date: map['date'],
      userId: map['userId'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "titre": titre,
      "description": description,
      "categorie": categorie,
      "imageUrl": imageURL,
      "date": date,
      "userId": userId,
    };
  }
}
