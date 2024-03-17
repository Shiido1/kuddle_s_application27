class WalletData {
  String status;
  WalletInfo wallet;

  WalletData({
    required this.status,
    required this.wallet,
  });

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
      status: json['status'],
      wallet: WalletInfo.fromJson(json['wallet']),
    );
  }
}

class WalletInfo {
  int? id;
  int? userId;
  int? balance;
  String? createdAt;

  WalletInfo({
    required this.id,
    required this.userId,
    required this.balance,
    required this.createdAt,
  });

  WalletInfo.empty()
      : id = 0,
        userId = 0,
        balance = 0,
        createdAt = '';

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      id: json['id'],
      userId: json['userId'],
      balance: json['balance'],
      createdAt: json['createdAt'],
    );
  }
}
