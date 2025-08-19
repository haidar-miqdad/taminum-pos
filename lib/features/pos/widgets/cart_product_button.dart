import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

import '../../../core/core.dart';

class CartProductButton extends StatelessWidget {
  const CartProductButton({
    super.key,
    this.onNoted,
    this.products,
    this.count = 0,
  });

  final ProductModel? products;
  final int count;
  final Function()? onNoted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (onNoted != null) ...[
              _buildButton(
                context,
                onTap: () {},
                text: RegularText.medium(
                  '+ Catatan',
                  style: TextStyle(color: context.theme.primaryColor),
                ),
              ),
              const Spacer(),
            ],
            if (count > 0) ...[
              _buildButton(
                context,
                onTap: () {
                  context.read<CartBloc>().add(
                    DecrementCartEvent(product: products!),
                  );
                },
              ),
              Spacing.sp12.width,
              RegularText.semibold('$count'),
              Spacing.sp12.width,
              _buildButton(
                context,
                isIncrement: true,
                onTap: () {
                  context.read<CartBloc>().add(
                    IncrementCartEvent(product: products!),
                  );
                },
              ),
            ] else ...[
              _buildButton(
                context,
                text: RegularText.semibold(
                  'Tambah',
                  style: TextStyle(color: context.theme.primaryColor),
                ),
                onTap: () {
                  context.read<CartBloc>().add(
                    IncrementCartEvent(product: products!),
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }

  InkWell _buildButton(
    BuildContext context, {
    required VoidCallback onTap,
    bool isIncrement = false,
    Widget? text,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Spacing.sp8),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: count > 0 ? Spacing.sp4 : Spacing.sp6,
          horizontal: count > 0 ? Spacing.sp4 : Spacing.sp14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.sp8),
          color: isIncrement ? context.theme.primaryColor : Colors.white,
          border: Border.all(color: context.theme.primaryColor),
        ),
        child:
            text ??
            Icon(
              isIncrement ? Icons.add : Icons.remove,
              color: isIncrement ? Colors.white : context.theme.primaryColor,
            ),
      ),
    );
  }
}
