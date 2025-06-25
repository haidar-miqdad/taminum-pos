
part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Spacing.sp8),
            child: Image.network(
              'https://lh6.googleusercontent.com/proxy/PvEQ4El5nLBPs2TQ-IfrlJd3AtD1ZF9lzs4JUILg4Ekhi_Q5OEFMM0Gu8KoT4VU0gfAbBmFk2w6Wb9m2X9I2OQICg_Gj4rNUQh-oO3lOxQYVIK-D-7ZMdtRGSqA',
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
                RegularText.semibold('Avocado'),
                Spacing.sp8.height,
                RichText(
                  text: TextSpan(
                    text: '10.000',
                    style: context.theme.textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' / kg',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CartProductButton(
            title: 'tambah',
            count: 0,
          )
        ],
      ),
    );
  }
}

