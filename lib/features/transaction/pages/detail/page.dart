import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

part 'sections/header_section.dart';

part 'sections/action_section.dart';

part 'sections/order_section.dart';

class DetailTransactionPage extends StatefulWidget {
  const DetailTransactionPage({super.key, required this.referenceId});

  final String referenceId;

  static const routeName = '/transaction/detail';

  @override
  State<DetailTransactionPage> createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {

  @override
  void initState() {
    context.read<TransactionBloc>().add(GetDetailTransactionEvent(widget.referenceId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Transaksi'),),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if(state.item != null){
            final item = state.item!;
            return ListView(
              padding: EdgeInsets.all(Spacing.defaultSize),
              children: [
                Spacing.sp24.height,
                _HeaderSection(item: item),
                Spacing.sp42.height,
                _OrderSection(item: item),
                Spacing.sp24.height,
                _ActionSection(item: item,),
                Spacing.sp24.height,
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


