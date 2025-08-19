enum PaymentTypeEnum { cash, qris }

extension PaymentTypeEnumExt on PaymentTypeEnum {
  String get valueName {
    switch (this) {
      case PaymentTypeEnum.cash:
        return 'Tunai';
      default:
        return 'QRIS';
    }
  }
}
