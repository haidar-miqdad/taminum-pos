import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  ShareHelper._();

  static Future<void> shareImage(
    BuildContext context,
    Uint8List image,
    String referenceId,
  ) async {
    final box = context.findRenderObject() as RenderBox?;

    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/$referenceId.png';

    final file = await File(imagePath).writeAsBytes(image);

    final params = ShareParams(
      files: [
        XFile.fromData(
          await file.readAsBytes(),
          mimeType: 'image/png',
          name: '$referenceId.png',
        ),
      ],
      sharePositionOrigin: box != null
          ? box.localToGlobal(Offset.zero) & box.size
          : null,
    );

    await SharePlus.instance.share(params);
  }
}
