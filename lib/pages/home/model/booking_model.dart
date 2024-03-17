class BookingModel {
  String? amountPaid;
  String? bookingFor;
  String? checkInDate;
  String? checkInTime;
  String? checkOutDate;
  String? checkOutTime;
  String? duration;
  String? hostId;
  String? itemId;
  String? itemType;
  String? itemUnitPrice;
  int? tickets;
  String? userId;
  String? paymentStatus;

  BookingModel(
      {this.amountPaid,
      this.bookingFor,
      this.checkInDate,
      this.checkInTime,
      this.checkOutDate,
      this.checkOutTime,
      this.duration,
      this.hostId,
      this.itemId,
      this.itemType,
      this.itemUnitPrice,
      this.tickets,
      this.userId,
      this.paymentStatus});

  BookingModel.fromJson(Map<String, dynamic> json) {
    if (json["amountPaid"] is String) {
      amountPaid = json["amountPaid"];
    }
    if (json["bookingFor"] is String) {
      bookingFor = json["bookingFor"];
    }
    if (json["checkInDate"] is String) {
      checkInDate = json["checkInDate"];
    }
    if (json["checkInTime"] is String) {
      checkInTime = json["checkInTime"];
    }
    if (json["checkOutDate"] is String) {
      checkOutDate = json["checkOutDate"];
    }
    if (json["checkOutTime"] is String) {
      checkOutTime = json["checkOutTime"];
    }
    if (json["duration"] is String) {
      duration = json["duration"];
    }
    if (json["hostID"] is String) {
      hostId = json["hostID"];
    }
    if (json["itemID"] is String) {
      itemId = json["itemID"];
    }
    if (json["itemType"] is String) {
      itemType = json["itemType"];
    }
    if (json["itemUnitPrice"] is String) {
      itemUnitPrice = json["itemUnitPrice"];
    }
    if (json["tickets"] is int) {
      tickets = json["tickets"];
    }
    if (json["userID"] is String) {
      userId = json["userID"];
    }
    if (json["paymentStatus"] is String) {
      paymentStatus = json["paymentStatus"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["amountPaid"] = amountPaid;
    data["bookingFor"] = bookingFor;
    data["checkInDate"] = checkInDate;
    data["checkInTime"] = checkInTime;
    data["checkOutDate"] = checkOutDate;
    data["checkOutTime"] = checkOutTime;
    data["duration"] = duration;
    data["hostID"] = hostId;
    data["itemID"] = itemId;
    data["itemType"] = itemType;
    data["itemUnitPrice"] = itemUnitPrice;
    data["tickets"] = tickets;
    data["userID"] = userId;
    data["paymentStatus"] = paymentStatus;
    return data;
  }
}
