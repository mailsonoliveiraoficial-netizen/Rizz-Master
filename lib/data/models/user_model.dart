import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final int credits;
  final String plan;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.credits,
    required this.plan,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String docId) {
    return UserModel(
      id: docId,
      name: map['name'] ?? 'Usuário',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      credits: map['credits'] ?? 0,
      plan: map['plan'] ?? 'free',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'credits': credits,
      'plan': plan,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}