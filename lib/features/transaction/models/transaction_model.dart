import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/core/data/enums/payment_type_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'model.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({
    this.id = 0,
    required this.referenceId,
    required this.type,
    required this.amount,
    this.items = const [],
    this.qrString = '',
    this.qrId = '',
    this.discount = 0,
    this.payAmount = 0,
    required this.paymentType,
    required this.createdAt,
  });

  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(defaultValue: '')
  final String referenceId;

  final TypeEnum type;

  @JsonKey(defaultValue: '')
  final String qrString;

  @JsonKey(defaultValue: '')
  final String qrId;

  @JsonKey(defaultValue: 0)
  final num amount;

  @JsonKey(defaultValue: 0)
  final num discount;

  @JsonKey(defaultValue: 0)
  final num payAmount;

  @JsonKey(defaultValue: PaymentTypeEnum.cash)
  final PaymentTypeEnum paymentType;

  final DateTime createdAt;

  @JsonKey(defaultValue: [], includeToJson: false)
  final List<TransactionItemModel> items;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith(Map<String, dynamic> json) {
    return TransactionModel(
      discount: discount,
        id: id,
        items: items + [TransactionItemModel.fromJson(json)],
        payAmount: payAmount,
        qrId: qrId,
        qrString: qrString,
        referenceId: referenceId,
        type: type,
        amount: amount,
        paymentType: paymentType,
        createdAt: createdAt,
    );
  }


  num get total {
    return amount - discount;
  }

  num get returnAmount {
    return payAmount - amount - discount;
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id, referenceId, type, qrString, qrId, discount, payAmount, paymentType, createdAt, items, amount];
}
