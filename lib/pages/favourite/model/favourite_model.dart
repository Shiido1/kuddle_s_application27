import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  final String? name;
  final String? location;
  final String? imagePath;
  final String? rating;
  final String? price;

  const FavouriteModel(
      {required this.name,
      required this.location,
      required this.imagePath,
      required this.rating,
      required this.price});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        name: json["name"],
        location: json["location"],
        imagePath: json["image_path"],
        rating: json["rating"],
        price: json["price"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "image_path": imagePath,
        "rating": rating,
        "price": price,
      };
  @override
  List<Object?> get props => [name, location, imagePath, rating, price];
}
