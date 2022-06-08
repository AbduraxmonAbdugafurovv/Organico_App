import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
  int count;
  @HiveField(1)
  String img;
  @HiveField(2)
  String name;
  @HiveField(3)
  String shop;
  @HiveField(4)
  String price;
  @HiveField(5)
  String details;
  @HiveField(6)
  String category;
  @HiveField(7)
  String timeDelivery;
  @HiveField(8)
  bool wishlist;
  Model(
      {required this.wishlist,
      required this.count,
      required this.img,
      required this.name,
      required this.shop,
      required this.price,
      required this.details,
      required this.timeDelivery,
      required this.category});
}
