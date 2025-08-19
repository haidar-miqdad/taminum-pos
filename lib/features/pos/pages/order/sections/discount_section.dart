part of '../page.dart';

class _DiscountSection extends StatefulWidget {
  const _DiscountSection({super.key, required this.type, required this.disc});

  final DiscountType? type;
  final num? disc;

  @override
  State<_DiscountSection> createState() => _DiscountSectionState();
}

class _DiscountSectionState extends State<_DiscountSection> {
  DiscountType? type;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    setState(() {
      controller.text = '${widget.disc ?? 0}';
      type = widget.type;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RegularText.semibold('Pilih Satuan Diskon'),
          Spacing.sp24.height,
          _buildOption('Nominal', DiscountType.nominal),
          if (type == DiscountType.nominal) ...[
            Spacing.sp8.height,
            RegularTextInput(
              controller: controller,
              hinText: 'Rp 0',
              label: 'Jumlah',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
          AppDivider(thickness: 3),
          _buildOption('Persentase', DiscountType.percentage),
          if (type == DiscountType.percentage) ...[
            Spacing.sp8.height,
            RegularTextInput(
              controller: controller,
              hinText: '0%',
              label: 'Jumlah',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
          AppDivider(thickness: 3),
          SafeArea(
            child: ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(
                  ApplyDiscountCartEvent(
                    disc: num.tryParse(controller.text) ?? 0,
                    type: type,
                  ),
                );
                Navigator.pop(context);
              },

              child: Text('Terapkan'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String title, DiscountType discType) {
    final isActive = discType == type;
    return GestureDetector(
      onTap: () {
        controller.clear();
        setState(() {
          type = discType;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegularText.semibold(title, style: TextStyle(fontSize: Spacing.sp12)),
          isActive
              ? Container(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.all(Spacing.sp4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MainColors.white[500],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.primaryColor,
                    ),
                  ),
                )
              : Container(
                  width: 24,
                  height: 24,
                  padding: EdgeInsets.all(Spacing.sp4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MainColors.white[500],
                  ),
                ),
        ],
      ),
    );
  }
}
