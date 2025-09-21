class BillingModel {
  int? id;
  int userID;
  int medicinID;
  int noOfMedicin;
  DateTime dateofBuy;
  double totalAmountbill;
  double balance;

  BillingModel({
    this.id,
    required this.userID,
    required this.medicinID,
    required this.noOfMedicin,
    required this.dateofBuy,
    required this.totalAmountbill,
    required this.balance,
  });


   Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'medicinID': medicinID.toString(),
      'noOfMedicin': noOfMedicin,
      'dateofBuy': dateofBuy.toString(),
      'totoalAmountbill': totalAmountbill,
      'balance': balance,
      
    };
  }

  factory BillingModel.fromMap(Map<String, dynamic> map) {
    return BillingModel(
      id: map['id'],
      userID: map['userID'],
      medicinID: map['medicinID'],
      noOfMedicin: map['noOfMedicin'],
      dateofBuy: DateTime.parse(map['dateofBuy']),
      totalAmountbill: map['totalAmountbill'],
      balance: map['balance'],
    );
  }
}


//state managemts
//machine text dart
//dart basic
//oops basic
//