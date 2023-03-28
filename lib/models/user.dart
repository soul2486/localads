class UserModel {
  String name;
  String email;
  String profilePic;
  String entreprise;
  String createdAd;
  String phoneNumber;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.entreprise,
    required this.profilePic,
    required this.createdAd,
    required this.phoneNumber,
    required this.uid,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createdAd: map['createdAd'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
      entreprise: map['entreprise'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "entreprise": entreprise,
      "profilePic": profilePic,
      "phoneNumber": phoneNumber,
      "createdAd": createdAd,
    };
  }
}
