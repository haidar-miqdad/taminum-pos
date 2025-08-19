import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceiptService {
  ReceiptService._();

  static Future<ReceiptModel?> insert(ReceiptModel receipt) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('receipt', jsonEncode(receipt.toJson()));

      return receipt;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<ReceiptModel?> get() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getString('receipt');

      if (data != null) {
        return ReceiptModel.fromJson(jsonDecode(data));
      }
      return null;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
