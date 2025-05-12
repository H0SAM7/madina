class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? phoNum;
  final int? roleId;
  final String? status;
  final String? type;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoNum,
    this.roleId,
    this.status,
    this.type,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phoNum: json['phoNum'],
      roleId: json['role_id'],
      status: json['status'],
      type: json['type'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'phoNum': phoNum,
      'role_id': roleId,
      'status': status,
      'type': type,
      'deleted_at': deletedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
