part of '../page.dart';

class _FilterSection extends StatefulWidget {
  const _FilterSection({super.key});

  @override
  State<_FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<_FilterSection> {

  String selected = 'Done';

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildContainer(context, label: 'Done'),
      Spacing.sp12.width,
      _buildContainer(context, label: 'Draft'),
    ]);
  }

  Widget _buildContainer(BuildContext context, {required String label}) {
    final isActive = selected == label;
    return InkWell(
      onTap: () {
        setState(() {
          selected = label;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Spacing.defaultSize, vertical: Spacing.sp8),
        decoration: BoxDecoration(
            color: isActive ? context.theme.primaryColor : null,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: context.theme.primaryColor,
            )
        ),
        child: RegularText.semibold(label, style: TextStyle(color: isActive ? MainColors.white : MainColors.black[200]),),
      ),
    );
  }
}



