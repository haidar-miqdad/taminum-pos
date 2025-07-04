import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/data/data.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

class TransactionService {
  TransactionService._();

  static Future<List<TransactionModel>> all(TypeEnum? type) async {
    try {
      final db = await SQLiteDatabase.database;
      final result = await db.rawQuery(
        '''
     SELECT * FROM transactions
     INNER JOIN items ON transactions.id = items.transactionId
     WHERE transactions.type LIKE ?
     ORDER BY transactions.createdAt DESC
      ''',
        ["%${type?.name ?? ''}%"],
      );

      return result.map(TransactionModel.fromJson).toList();
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> detail(String referenceId) async {
    try {
      final db = await SQLiteDatabase.database;
      final result = await db.rawQuery(
        '''
     SELECT * FROM transactions
     INNER JOIN items ON transactions.id = items.transactionId
     WHERE transactions.type = ?
      ''',
        [referenceId],
      );
      return TransactionModel.fromJson(result.first);
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> insert(TransactionModel transaction) async {
    try {
      final db = await SQLiteDatabase.database;
      final id = await db.insert('transactions', transaction.toJson());

      for (var element in transaction.items) {
        await db.insert('items', element.changeId(id).toJson());
      }
      return transaction;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<TransactionModel> update(TransactionModel transaction) async {
    try {
      final db = await SQLiteDatabase.database;
      await db.update(
          'transactions',
          transaction.toJson(),
          where: 'transactionId = ?',
          whereArgs: [transaction.id],
      );

      return transaction;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
