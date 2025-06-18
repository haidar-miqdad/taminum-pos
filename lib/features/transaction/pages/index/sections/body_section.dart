part of '../page.dart';

class _BodySection extends StatelessWidget {
  const _BodySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
      children: [
        _buildGestureDetector(context, categoryTransaction: 'Tunai • TRX-100-10102030405', value: 'Rp 125.000', date: '24 Jan 2021 • 11:02'),
        _buildGestureDetector(context, categoryTransaction: 'Tunai • TRX-100-10102030405', value: 'Rp 125.000', date: '24 Jan 2021 • 11:02'),
        _buildGestureDetector(context, categoryTransaction: 'Tunai • TRX-100-10102030405', value: 'Rp 125.000', date: '24 Jan 2021 • 11:02'),
        _buildGestureDetector(context, categoryTransaction: 'Tunai • TRX-100-10102030405', value: 'Rp 125.000', date: '24 Jan 2021 • 11:02'),
      ],
    );
  }

  GestureDetector _buildGestureDetector(BuildContext context, {required String categoryTransaction, required String value, required String date}) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: Spacing.sp12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.sp12, vertical: Spacing.sp4),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: context.theme.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(Spacing.sp8)
                    ),
                    child: RegularText.semibold('Done', style: TextStyle(color: context.theme.primaryColor),),
                  ),
                  RegularText.semibold(date, style: TextStyle(color: MainColors.black[200], fontSize: Spacing.sp12),)
                ],
              ),
              Spacing.defaultSize.height,
              RegularText.semibold(categoryTransaction, style: TextStyle(fontSize: Spacing.defaultSize),),
              Spacing.sp8.height,
              RegularText.semibold(value, style: TextStyle(color: context.theme.primaryColor),),
              Divider(thickness: 0.1, color: MainColors.black[200],),
            ],

          ),
        ),
      );
  }
}