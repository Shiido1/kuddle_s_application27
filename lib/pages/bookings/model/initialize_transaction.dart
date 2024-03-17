class InitializeTransation {
  String? emailAddress;
  String? amount;
  String? callbackUrl;

  InitializeTransation({this.emailAddress, this.amount, this.callbackUrl});

  InitializeTransation.fromJson(Map<String, dynamic> json) {
    if (json["emailAddress"] is String) {
      emailAddress = json["emailAddress"];
    }
    if (json["amount"] is String) {
      amount = json["amount"];
    }
    if (json["callbackUrl"] is String) {
      callbackUrl = json["callbackUrl"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["emailAddress"] = emailAddress;
    data["amount"] = amount;
    data["callbackUrl"] = callbackUrl;
    return data;
  }
}
