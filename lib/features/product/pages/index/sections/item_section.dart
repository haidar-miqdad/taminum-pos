
part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.sp8),
                child: Image.network('https://lazenskakava.s24.cdn-upgates.com/_cache/a/c/acde81f00cf5db7e02970946253795b4-caffe-latte-macchiato.jpg', width: 76, height: 76, fit: BoxFit.cover),
              ),
              Spacing.sp12.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold('Caffe Latte', style: TextStyle(fontSize: 16)),
                  Spacing.sp4.height,
                  RegularText.semibold('Rp 125.000', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          Spacing.defaultSize.height,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text('Edit')),
              ),
              Spacing.defaultSize.width,
              Expanded(
                child: OutlinedButton(onPressed: () {}, child: Text('Hapus')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}