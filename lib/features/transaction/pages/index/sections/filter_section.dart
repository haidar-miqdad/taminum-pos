part of '../page.dart';

class _FilterSection extends StatefulWidget {
  const _FilterSection({super.key});

  @override
  State<_FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<_FilterSection> {

  TypeEnum? selected;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData(){
    context.read<TransactionBloc>().add(GetTransactionEvent(selected));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:[_buildContainer(context)] + TypeEnum.values
            .map((e) => _buildContainer(context, label: e),)
            .toList(),
    );
  }


  Widget _buildContainer(BuildContext context, { TypeEnum? label}) {
    final isActive = selected == label;
    return Padding(
      padding: const EdgeInsets.only(right: Spacing.defaultSize),
      child: InkWell(
        onTap: () {
          setState(() {
            selected = label;
          });
          getData();
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
          child: RegularText.semibold(label?.valueName ?? 'All', style: TextStyle(color: isActive ? MainColors.white : MainColors.black[200]),),
        ),
      ),
    );
  }
}



