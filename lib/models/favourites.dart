import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

part 'favourites.g.dart';

@HiveType(typeId: 1)
class Favorite extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String image;

  @HiveField(3)
  late double price;

  Favorite({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}