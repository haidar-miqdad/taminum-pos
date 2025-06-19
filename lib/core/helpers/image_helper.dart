
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper{

  ImageHelper._();

  static Future<String?> getImage() async{
    try{
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
      if(image != null){
        return base64Encode(await image.readAsBytes());
      }
      return null;
    }catch(e){
      throw ErrorDescription(e.toString());
    }
  }

  // fungsi `convertBase64ToUint8List` untuk convert gambar kita menjadi `Uint8List`
  // karena kita menyimpan gambar kita dalam bentuk `string`.
  static Uint8List convertBase64ToUint8List(String bytes){
    return base64Decode(bytes);
  }
}