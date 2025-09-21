class AllMedicinModel {
  int? id;
  String title;
  String description;
  DateTime expiryDate;
  DateTime buyingDate;
  DateTime sellingDate;
  double actualRateMO;
  double buyingRateMO;
  double sellingRateMO;
  double actualRateS;
  double buyingRateS;
  double sellingRateS;
  int supplierid;
  AllMedicinModel({
    this.id,
    required this.title,
    required this.description,
    required this.expiryDate,
    required this.buyingDate,
    required this.sellingDate,
    required this.actualRateMO,
    required this.buyingRateMO,
    required this.sellingRateMO,
    required this.actualRateS,
    required this.buyingRateS,
    required this.sellingRateS,
    required this.supplierid
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'expire': expiryDate.toString(),
      'buying': buyingDate.toString(),
      'selling': sellingDate.toString(),
      'actualrate': actualRateMO,
      'sellingrate': buyingRateMO,
      'sellingrates':sellingRateMO,
      'actualrates':actualRateS,
    };
  }
    factory AllMedicinModel.fromMap(Map<String, dynamic> map) {
    return AllMedicinModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      expiryDate: DateTime.parse(map['expiryDate']),
      buyingDate: DateTime.parse(map['buyingDate']),
      sellingDate: DateTime.parse(map['sellingDate']),
      actualRateMO: map['actualRateMO'],
      buyingRateMO: map['buyingRateMO'],
      sellingRateMO: map['sellingRateMO'],
      actualRateS: map['actualRateS'],
      buyingRateS: map['buyingRateS'],
      sellingRateS: map['sellingRateS'],
      supplierid: map['supplierId'],
    );
  }
}

//Medicin     : 
//id | title | desc |
// exp-date | buy-date | 
//Act-rate | Selling-rate |
