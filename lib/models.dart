// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String name;
  final String username;

  const User({
    required this.id,
    required this.name,
    required this.username,
  });

  @override
  List<Object> get props => [id, name, username];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
