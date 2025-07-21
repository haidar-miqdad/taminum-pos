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
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: Column(
              children: [
                Image.asset(MainAssets.success2, width: 100),
                Spacing.sp24.height,
                const SubtitleText('Transaksi Berhasil',
                    textAlign: TextAlign.center),
                Spacing.sp4.height,
                RegularText(
                  widget.data.createdAt.dateFormatted,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold('Pesanan'),
                  Spacing.defaultSize.height,
                  const Divider(thickness: 1, height: 1),
                  Spacing.defaultSize.height,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = widget.data.items[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText.semibold(item.title),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RegularText(
                                item.regularPrice.toIDR(),
                                style: const TextStyle(fontSize: Spacing.sp12),
                              ),
                              RegularText.semibold(
                                '${item.qty}x',
                                style: const TextStyle(fontSize: Spacing.sp12),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Spacing.defaultSize.height,
                    itemCount: widget.data.items.length,
                  ),
                  Spacing.defaultSize.height,
                  const Divider(),
                  Spacing.defaultSize.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegularText.semibold(
                        'Subtotal',
                        style: const TextStyle(fontSize: Spacing.sp12),
                      ),
                      RegularText.semibold(
                        widget.data.amount.toIDR(),
                        style: const TextStyle(fontSize: Spacing.sp12),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold('Detail Transaksi'),
                  Spacing.defaultSize.height,
                  const Divider(thickness: 1, height: 1),
                  Spacing.sp12.height,
                  _buildTile('Jumlah pesanan', '${widget.data.items.length}'),
                  _buildTile('Subtotal', widget.data.amount.toIDR()),
                  _buildTile('Pajak', 'Rp 0'),
                  _buildTile(
                    'Diskon',
                    '- ${widget.data.discount.toIDR()}',
                    color: context.theme.primaryColor,
                  ),
                  Spacing.sp12.height,
                  Spacing.sp12.height,
                  _buildTile('Total Tagihan',
                      (widget.data.amount - widget.data.discount).toIDR(),
                      isBold: true),
                  _buildTile('Total Pembayaran', widget.data.payAmount.toIDR(),
                      isBold: true),
                  Spacing.sp12.height,
                  const Divider(),
                  Spacing.defaultSize.height,
                  Row(
                    children: [
                      RegularText.semibold(
                        'Total Kembali',
                        style: TextStyle(fontSize: Spacing.sp12, color: redColor),
                      ),
                      Spacing.sp8.width,
                      Expanded(
                        child: RegularText.semibold(
                          (widget.data.payAmount -
                              (widget.data.amount - widget.data.discount))
                              .toIDR(),
                          textAlign: TextAlign.end,
                          style:
                          TextStyle(fontSize: Spacing.sp12, color: redColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacing.defaultSize.height,
          ],
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
            RegularText(
              title,
              style: const TextStyle(fontSize: Spacing.sp12),
            ),
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