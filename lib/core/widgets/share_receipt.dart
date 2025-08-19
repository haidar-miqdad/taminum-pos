import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../features/features.dart';

class ShareReceipt extends StatefulWidget {
  const ShareReceipt({super.key, required this.data});

  final TransactionModel data;

  @override
  State<ShareReceipt> createState() => _ShareReceiptState();
}

class _ShareReceiptState extends State<ShareReceipt> {
  @override
  Widget build(BuildContext context) {
    final redColor = context.theme.colorScheme.error;
    return Container(
      width: 370,
      height: 800 + (widget.data.items.length * 50),
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
              child: Column(
                children: [
                  Image.asset(MainAssets.success2, width: 100),
                  Spacing.sp24.height,
                  const SubtitleText(
                    'Transaksi Berhasil',
                    textAlign: TextAlign.center,
                  ),
                  Spacing.sp4.height,
                  RegularText(
                    widget.data.createdAt.toString(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            AppDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.defaultSize,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RegularText(
                        'Tipe Pembayaran',
                        style: TextStyle(fontSize: Spacing.sp12),
                      ),
                      RegularText.semibold(
                        widget.data.paymentType.valueName,
                        style: const TextStyle(fontSize: Spacing.sp12),
                      ),
                    ],
                  ),
                  Spacing.sp8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RegularText(
                        'Order ID',
                        style: TextStyle(fontSize: Spacing.sp12),
                      ),
                      RegularText.semibold(
                        widget.data.referenceId,
                        style: const TextStyle(fontSize: Spacing.sp12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppDivider(),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final items = widget.data.items[index];
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semibold(items.title),
                        Spacing.sp2.height,
                        RegularText('Rp ${items.regularPrice.toIDR()}'),
                      ],
                    ),
                    const Spacer(),
                    RegularText.semibold('${items.qty} x'),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Spacing.defaultSize.height;
              },
              itemCount: widget.data.items.length,
            ),
            AppDivider(),
            _buildTile('Jumlah pesanan', '${widget.data.items.length}'),
            _buildTile('Subtotal', widget.data.amount.toIDR()),
            _buildTile('Pajak', 'Rp 0'),
            _buildTile(
              'Diskon',
              '- ${widget.data.discount.toIDR()}',
              color: Colors.green,
            ),
            _buildTile('Total', 'Rp ${widget.data.total.toIDR()}'),
            AppDivider(),
            _buildTile(
              'Dibayar',
              'Rp ${widget.data.total.toIDR()}',
              isBold: true,
            ),
            _buildTile(
              'Kembalian',
              'Rp ${widget.data.returnAmount.toIDR()}',
              isBold: true,
              color: redColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    String title,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sp4),
      child: Row(
        children: [
          if (isBold)
            RegularText.semibold(
              title,
              style: const TextStyle(fontSize: Spacing.sp12),
            )
          else
            RegularText(title, style: const TextStyle(fontSize: Spacing.sp12)),
          Spacing.sp8.width,
          Expanded(
            child: RegularText.semibold(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: Spacing.sp12, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
