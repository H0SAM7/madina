

class JobTitleResponse {
  List<JobTitleModel> data;
  String message;

  JobTitleResponse({
    required this.data,
    required this.message,
  });

  factory JobTitleResponse.fromJson(Map<String, dynamic> json) {
    return JobTitleResponse(
      data: (json['data'] as List)
          .map((item) => JobTitleModel.fromJson(item))
          .toList(),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
      'message': message,
    };
  }
}

class JobTitleModel {
  int id;
  int branchId;
  String branchName;
  String name;
  int workersCount;
  String status;
  String creationDateHijri;
  String creationDate;
  int adminId;
  String adminName;
  ChangedData? changedData;

  JobTitleModel({
    required this.id,
    required this.branchId,
    required this.branchName,
    required this.name,
    required this.workersCount,
    required this.status,
    required this.creationDateHijri,
    required this.creationDate,
    required this.adminId,
    required this.adminName,
    this.changedData,
  });

  factory JobTitleModel.fromJson(Map<String, dynamic> json) {
    return JobTitleModel(
      id: json['id'],
      branchId: json['branch_id'],
      branchName: json['branch_name'],
      name: json['name'],
      workersCount: json['workersCount'],
      status: json['status'],
      creationDateHijri: json['creationDateHijri'],
      creationDate: json['creationDate'],
      adminId: json['admin_id'],
      adminName: json['admin_name'],
      changedData: json['changed_data'] != null
          ? ChangedData.fromJson(json['changed_data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branch_id': branchId,
      'branch_name': branchName,
      'name': name,
      'workersCount': workersCount,
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
  ChangeField? creationDate;
  ChangeField? creationDateHijri;
  ChangeField? status;
  ChangeField? branchId;

  ChangedData({
    this.creationDate,
    this.creationDateHijri,
    this.status,
    this.branchId,
  });

  factory ChangedData.fromJson(Map<String, dynamic> json) {
    return ChangedData(
      creationDate: json['creationDate'] != null
          ? ChangeField.fromJson(json['creationDate'])
          : null,
      creationDateHijri: json['creationDateHijri'] != null
          ? ChangeField.fromJson(json['creationDateHijri'])
          : null,
      status:
          json['status'] != null ? ChangeField.fromJson(json['status']) : null,
      branchId: json['branch_id'] != null
          ? ChangeField.fromJson(json['branch_id'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (creationDate != null) 'creationDate': creationDate!.toJson(),
      if (creationDateHijri != null)
        'creationDateHijri': creationDateHijri!.toJson(),
      if (status != null) 'status': status!.toJson(),
      if (branchId != null) 'branch_id': branchId!.toJson(),
    };
  }
}

class ChangeField {
  String old;
  String new_;

  ChangeField({
    required this.old,
    required this.new_,
  });

  factory ChangeField.fromJson(Map<String, dynamic> json) {
    return ChangeField(
      old: json['old'].toString(),
      new_: json['new'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'old': old,
      'new': new_,
    };
  }
}
