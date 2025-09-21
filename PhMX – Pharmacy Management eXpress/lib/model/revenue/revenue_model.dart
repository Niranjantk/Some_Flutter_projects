class RevenueModel {
  int? id;
  int billingID;
  double totalAmount;
  double balance;
  double profit;

  RevenueModel({
    this.id,
    required this.billingID,
    required this.totalAmount,
    required this.balance,
    required this.profit,
  });

  Map<String, dynamic> toMap() {
    return {
      'billingId': billingID,
      'totalamount': totalAmount,
      'balance': balance,
      'profit': profit,
    };
  }
   factory RevenueModel.fromMap(Map<String, dynamic> map) {
    return RevenueModel(
      id: map['id'],
      billingID: map['billingId'],
      totalAmount: map['totalAmount'],
      balance: map['balance'],
      profit: map['profit'],
    );
  }
}
