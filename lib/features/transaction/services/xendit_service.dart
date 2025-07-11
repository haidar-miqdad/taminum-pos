import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class XenditService {
  XenditService._();

  static Dio get dio{
    return Dio()..options = BaseOptions(
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('xnd_development_tFbBuLmaYn0ycGqovQI8jWGBBHTJyuSBiewzbWfc1PmotMSFiJKeTjrvEcgXJVe'))}',
        'Content-Type': 'application/json',
        'api-version': '2022-07-31',
      },
    );
  }

  // bertugas untuk mengirim request ke Xendit untuk membuat QR Code pembayaran, lalu mengembalikan qrId dan qrString.
  static Future<(String qrId, String qrString)> createQr({String? referenceId, num? amount}) async {
    try {
      final response = await dio.post(
        'https://api.xendit.co/qr_codes' ,
        data: {
          "reference_id": referenceId,
          "type": "DYNAMIC",
          "currency": "IDR",
          "amount": amount,
        },
      );
      return (
      response.data['id'] as String,
      response.data['qr_string'] as String,
      );
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TypeEnum> checkQr(String qrId) async {
    try {
      // contoh best practice seperti yg createQr(), Dio() bisa  diganti dengan method dio di atas dan tidak perlu Options() lagi
      final response = await dio.get(
        'https://api.xendit.co/qr_codes/$qrId/payments',
      );

      final data = List.from(response.data['data']);
      final isAvailable = data.where((e) => e['status'] == 'COMPLETED' || e['status'] == 'SUCCEEDED').isNotEmpty;

      if(isAvailable){
        return TypeEnum.paid;
      }else{
        return TypeEnum.unpaid;
      }

    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
