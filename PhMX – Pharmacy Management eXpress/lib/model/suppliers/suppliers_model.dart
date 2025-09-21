class SuppliersModel {
  int? id;
  String fullName;
  String details;

  SuppliersModel({
    this.id, 
    required this.fullName, 
    required this.details});

   Map<String, dynamic> toMap() {
    return {
      'fullname': fullName,
      'details': details,
     
    };
  }
    factory SuppliersModel.fromMap(Map<String, dynamic> map) {
    return SuppliersModel(
      id: map['id'],
      fullName: map['fullName'],
      details: map['details'],
    );
  }
}
