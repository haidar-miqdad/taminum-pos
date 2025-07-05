part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Spacing.sp8),
            child: product.imageUrl.isEmpty ? Image.network(
              'https://lh6.googleusercontent.com/proxy/PvEQ4El5nLBPs2TQ-IfrlJd3AtD1ZF9lzs4JUILg4Ekhi_Q5OEFMM0Gu8KoT4VU0gfAbBmFk2w6Wb9m2X9I2OQICg_Gj4rNUQh-oO3lOxQYVIK-D-7ZMdtRGSqA',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ) :
            Image.memory(
              ImageHelper.convertBase64ToUint8List(product.imageUrl),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),

          ),
          Spacing.defaultSize.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semibold(product.title),
                Spacing.sp8.height,
                RichText(
                  text: TextSpan(
                    text: 'Rp ${product.regularPrice.toIDR()}',
                    style: context.theme.textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' /${product.unit}',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return CartProductButton(
                products: product,
                count: state.findItem(product.id)?.qty ?? 0,
              );
            },
          ),
        ],
      ),
    );
  }
}

