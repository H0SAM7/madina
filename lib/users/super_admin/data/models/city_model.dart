class CityModel {
  final int id;
  final String name;
  final int branchesCount;
  final String status;
  final String creationDateHijri;
  final String creationDate;
  final int adminId;
  final String adminName;
  final ChangedData? changedData;

  CityModel({
    required this.id,
    required this.name,
    required this.branchesCount,
    required this.status,
    required this.creationDateHijri,
    required this.creationDate,
    required this.adminId,
    required this.adminName,
    this.changedData,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      branchesCount: json['branchesCount'] ?? 0,
      status: json['status'],
      creationDateHijri: json['creationDateHijri'],
      creationDate: json['creationDate'],
      adminId: json['admin_id'],
      adminName: json['admin_name'],
      changedData:
          json['changed_data'] != null
              ? ChangedData.fromJson(json['changed_data'])
              : null,
    );
  }
  // المدينة
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'branchesCount': branchesCount,
      'status': status,
      'creationDateHijri': creationDateHijri,
      'creationDate': creationDate,
      'admin_id': adminId,
      'admin_name': adminName,
      'changed_data': changedData?.toJson(),
    };
  }
}

class ChangedData {
  final Name? name;

  ChangedData({this.name});

  factory ChangedData.fromJson(Map<String, dynamic> json) {
    return ChangedData(
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name?.toJson()};
  }
}

//
class Name {
  final String old;
  final String newName;

  Name({required this.old, required this.newName});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(old: json['old'], newName: json['new']);
  }

  Map<String, dynamic> toJson() {
    return {'old': old, 'new': newName};
  }
}
