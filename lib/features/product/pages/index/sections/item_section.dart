
part of '../page.dart';

class _ItemSection extends StatelessWidget {
  const _ItemSection({
    super.key, required this.onEdit, required this.onDelete, required this.product
  });

  final Function() onEdit;
  final Function() onDelete;
  final ProductModel product;


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
                child: product.imageUrl.isEmpty
                    ? Image.network('https://lazenskakava.s24.cdn-upgates.com/_cache/a/c/acde81f00cf5db7e02970946253795b4-caffe-latte-macchiato.jpg', width: 76, height: 76, fit: BoxFit.cover)
                    : Image.memory(
                  ImageHelper.convertBase64ToUint8List(product.imageUrl),
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover,
                ),
              ),
              Spacing.sp12.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold(product.title, style: TextStyle(fontSize: 16)),
                  Spacing.sp4.height,
                  RegularText.semibold(product.itemPrice.toIDR(), style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          Spacing.defaultSize.height,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {
                  onEdit();
                }, child: Text('Edit')),
              ),
              Spacing.defaultSize.width,
              Expanded(
                child: OutlinedButton(onPressed: () {
                  onDelete();
                }, child: Text('Hapus')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}