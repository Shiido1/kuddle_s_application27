class TransactionData {
  String status;
  int page;
  int count;
  List<TransactionInfo> transactions;

  TransactionData({
    required this.status,
    required this.page,
    required this.count,
    required this.transactions,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      status: json['status'],
      page: json['page'],
      count: json['count'],
      transactions: (json['transactions'] as List)
          .map((transactionJson) => TransactionInfo.fromJson(transactionJson))
          .toList(),
    );
  }
}

class TransactionInfo {
  int? id;
  int? userId;
  String? transactionType;
  int? amount;
  String? description;
  String? createdAt;

  TransactionInfo({
    required this.id,
    required this.userId,
    required this.transactionType,
    required this.amount,
    required this.description,
    required this.createdAt,
  });

  factory TransactionInfo.fromJson(Map<String, dynamic> json) {
    return TransactionInfo(
      id: json['id'],
      userId: json['userId'],
      transactionType: json['transactionType'],
      amount: json['amount'],
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }
}
