class RoomModel {
  final String status;
  final int page;
  final int count;
  final List<Room> rooms;

  RoomModel({
    required this.status,
    required this.page,
    required this.count,
    required this.rooms,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    var roomsList = json['rooms'] as List;
    List<Room> rooms =
    roomsList.map((roomJson) => Room.fromJson(roomJson)).toList();

    return RoomModel(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      rooms: rooms,
    );
  }
}

class Room {
  final int roomID;
  final int propertyID;
  final int hostID;
  final String roomType;
  final int roomNo;
  final int guestNo;
  final int bathroomNo;
  final String roomBedType;
  final String price;
  final String discount;
  final String available;
  final String agreeCancel;
  final String bookedDates;
  final String createdAt;

  Room({
    required this.roomID,
    required this.propertyID,
    required this.hostID,
    required this.roomType,
    required this.roomNo,
    required this.guestNo,
    required this.bathroomNo,
    required this.roomBedType,
    required this.price,
    required this.discount,
    required this.available,
    required this.agreeCancel,
    required this.bookedDates,
    required this.createdAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomID: json['roomID'],
      propertyID: json['propertyID'],
      hostID: json['hostID'],
      roomType: json['roomType'],
      roomNo: json['roomNo'],
      guestNo: json['guestNo'],
      bathroomNo: json['bathroomNo'],
      roomBedType: json['roomBedType'],
      price: json['price'],
      discount: json['discount'],
      available: json['available'],
      agreeCancel: json['agreeCancel'],
      bookedDates: json['bookedDates'],
      createdAt: json['createdAt'],
    );
  }
}
