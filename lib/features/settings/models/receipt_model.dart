import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel extends Equatable {
  @JsonKey(name: 'desc')
  final String desc;
  @JsonKey(name: 'message')
  final String message;

  const ReceiptModel({required this.desc, required this.message});

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);

  @override
  List<Object> get props => [desc, message];
}
