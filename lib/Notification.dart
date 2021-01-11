class Notifications {
  Notifications({
    this.status,
    this.message,
    this.data,
    this.recordsPerPage,
    this.page,
    this.total,
  });

  bool status;
  String message;
  List<Datum> data;
  int recordsPerPage;
  int page;
  int total;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    recordsPerPage: json["records_per_page"],
    page: json["page"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "records_per_page": recordsPerPage,
    "page": page,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.receiverId,
    this.senderId,
    this.storeId,
    this.checkinId,
    this.notificationFor,
    this.notificationType,
    this.notificationTitle,
    this.notificationDescription,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.storeName,
    this.checkinQrCode,
    this.checkoutQrCode,
    this.checkIn,
    this.checkOut,
    this.userId,
  });

  String id;
  String receiverId;
  String senderId;
  String storeId;
  String checkinId;
  String notificationFor;
  String notificationType;
  String notificationTitle;
  String notificationDescription;
  String isRead;
  DateTime createdAt;
  dynamic updatedAt;
  String storeName;
  String checkinQrCode;
  String checkoutQrCode;
  String checkIn;
  dynamic checkOut;
  dynamic userId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    receiverId: json["receiver_id"],
    senderId: json["sender_id"],
    storeId: json["store_id"],
    checkinId: json["checkin_id"],
    notificationFor: json["notification_for"],
    notificationType: json["notification_type"],
    notificationTitle: json["notification_title"],
    notificationDescription: json["notification_description"],
    isRead: json["is_read"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    storeName: json["store_name"],
    checkinQrCode: json["checkin_qr_code"],
    checkoutQrCode: json["checkout_qr_code"],
    checkIn: json["check_in"],
    checkOut: json["check_out"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "receiver_id": receiverId,
    "sender_id": senderId,
    "store_id": storeId,
    "checkin_id": checkinId,
    "notification_for": notificationFor,
    "notification_type": notificationType,
    "notification_title": notificationTitle,
    "notification_description": notificationDescription,
    "is_read": isRead,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "store_name": storeName,
    "checkin_qr_code": checkinQrCode,
    "checkout_qr_code": checkoutQrCode,
    "check_in": checkIn,
    "check_out": checkOut,
    "user_id": userId,
  };
}