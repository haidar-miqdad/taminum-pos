// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      referenceId: json['referenceId'] as String? ?? '',
      type: $enumDecode(_$TypeEnumEnumMap, json['type']),
      amount: json['amount'] as num? ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => TransactionItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      qrString: json['qrString'] as String? ?? '',
      qrId: json['qrId'] as String? ?? '',
      discount: json['discount'] as num? ?? 0,
      payAmount: json['payAmount'] as num? ?? 0,
      paymentType:
          $enumDecodeNullable(_$PaymentTypeEnumEnumMap, json['paymentType']) ??
          PaymentTypeEnum.cash,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'type': _$TypeEnumEnumMap[instance.type]!,
      'qrString': instance.qrString,
      'qrId': instance.qrId,
      'amount': instance.amount,
      'discount': instance.discount,
      'payAmount': instance.payAmount,
      'paymentType': _$PaymentTypeEnumEnumMap[instance.paymentType]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$TypeEnumEnumMap = {
  TypeEnum.draft: 'draft',
  TypeEnum.paid: 'paid',
  TypeEnum.unpaid: 'unpaid',
};

const _$PaymentTypeEnumEnumMap = {
  PaymentTypeEnum.cash: 'cash',
  PaymentTypeEnum.qris: 'qris',
};
