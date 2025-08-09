

import 'package:flutter_esc_pos_utils/flutter_esc_pos_utils.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../features/features.dart';

class ReceiptTemplate {
  ReceiptTemplate._();

  static Future<List<int>> ticket({TransactionModel? transaction}) async {
    final user = await ProfileService.get();
    final printer = await ReceiptService.get();

    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    bytes += generator.setStyles(const PosStyles(height: PosTextSize.size4));
    bytes += generator.reset();

    bytes += generator.text(
      user?.name ?? 'Cashier name group',
      styles: const PosStyles(
        bold: true,
        align: PosAlign.center,
        height: PosTextSize.size2,
      ),
    );
    bytes += generator.text(
      printer?.desc ?? 'Instagram : @haidarmqdd',
      styles: const PosStyles(align: PosAlign.center),
    );

    bytes += generator.hr();

    bytes += generator.row(posColumn(
      'Tipe Pembayaran',
      transaction?.paymentType.valueName ?? 'Tunai',
    ));
    bytes += generator.row(posColumn(
      'Order ID',
      transaction?.referenceId ?? 'reference Id',
    ));

    bytes += generator.hr();

    bytes += title(generator, 'Pesanan');
    bytes += generator.hr();

    if (transaction != null) {
      for (var element in transaction.items) {
        bytes += title(generator, element.title);
        bytes += generator.row(posColumn(
          element.itemPrice.toIDR(),
          '${element.qty}x',
        ));
      }
    } else {
      bytes += title(generator, 'it should be your order tho.. :)');
      bytes += generator.row(posColumn('also this is your order price dawggg', '-x'));
    }

    bytes += generator.hr();
    bytes += generator.row(posColumn(
      'Subtotal',
      transaction?.amount.toIDR() ?? 'it should be your total amount order dayummmm :)',
      isBold: true,
    ));

    bytes += generator.hr();

    bytes += title(generator, 'Detail Transaksi');
    bytes += generator.hr();
    bytes += generator.row(posColumn('Jumlah pesanan', '3'));
    bytes += generator.row(
      posColumn(
        'Subtotal',
        transaction?.amount.toIDR() ?? 'Rp 44.800',
      ),
    );
    bytes += generator.row(posColumn('Pajak', 0.toIDR()));
    bytes += generator.row(posColumn(
      'Diskon',
      '- ${transaction?.discount.toIDR() ?? 0.toIDR()}',
    ));
    bytes += generator.hr();
    if (transaction != null) {
      bytes += generator.row(
        posColumn(
          'Total Tagihan',
          (transaction.amount - transaction.discount).toIDR(),
          isBold: true,
        ),
      );
    } else {
      bytes += generator.row(
        posColumn('Total Tagihan', 'it should be your total amount order dayummmm :)', isBold: true),
      );
    }
    bytes += generator.row(
      posColumn(
        'Total Pembayaran',
        transaction?.payAmount.toIDR() ?? 'it should be your money',
        isBold: true,
      ),
    );
    bytes += generator.hr();
    if (transaction != null) {
      bytes += generator.row(
        posColumn(
            'Total Kembali',
            (transaction.payAmount -
                (transaction.amount - transaction.discount))
                .toIDR(),
            isBold: true),
      );
    } else {
      bytes += generator.row(
        posColumn('Total Kembali', 'no return rekk', isBold: true),
      );
    }

    bytes += generator.emptyLines(1);

    bytes += generator.text(
      printer?.message ?? 'Terimakasih sudah berkunjung.',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.text(
      'Powered by hedare',
      styles: const PosStyles(align: PosAlign.center),
    );

    bytes += generator.feed(2);
    return bytes;
  }

  static List<int> title(Generator generator, String title) {
    return generator.text(
      title,
      styles: const PosStyles(bold: true),
    );
  }

  static List<PosColumn> posColumn(
      String title,
      String value, {
        bool isBold = false,
      }) {
    return [
      PosColumn(text: title, width: 6, styles: PosStyles(bold: isBold)),
      PosColumn(
        text: value,
        styles: const PosStyles(bold: true, align: PosAlign.right),
        width: 6,
      ),
    ];
  }
}
