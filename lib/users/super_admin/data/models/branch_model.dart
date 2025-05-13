class BranchModel {
  final int id;
  final int cityId;
  final String cityName;
  final String name;
  final String address;
  final int? officesCount;
  final int? tripsCount;
  final int? storesCount;
  final int? workersCount;
  final String status;
  final String creationDateHijri;
  final String creationDate;
  final int adminId;
  final String adminName;
  final dynamic changedData;

  BranchModel({
    required this.id,
    required this.cityId,
    required this.cityName,
    required this.name,
    required this.address,
    this.officesCount,
    this.tripsCount,
    this.storesCount,
    this.workersCount,
    required this.status,
    required this.creationDateHijri,
    required this.creationDate,
    required this.adminId,
    required this.adminName,
    this.changedData,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      name: json['name'],
      address: json['address'],
      officesCount: json['officesCount'],
      tripsCount: json['tripsCount'],
      storesCount: json['storesCount'],
      workersCount: json['workersCount'],
      status: json['status'],
      creationDateHijri: json['creationDateHijri'],
      creationDate: json['creationDate'],
      adminId: json['admin_id'],
      adminName: json['admin_name'],
      changedData: json['changed_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city_id': cityId,
      'city_name': cityName,
      'name': name,
      'address': address,
      'officesCount': officesCount,
      'tripsCount': tripsCount,
      'storesCount': storesCount,
      'workersCount': workersCount,
      'status': status,
      'creationDateHijri': creationDateHijri,
      'creationDate': creationDate,
      'admin_id': adminId,
      'admin_name': adminName,
      'changed_data': changedData,
    };
  }
}
