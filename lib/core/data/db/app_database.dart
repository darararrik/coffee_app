import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
part 'app_database.g.dart';

class CartItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();
  TextColumn get imageUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Получить все товары
  Future<List<CartItem>> getAllCartItems() async {
    final items = await select(cartItems).get();
    return items;
  }

  // Добавить или обновить товар
  Future<void> upsertCartItem(CartItem item) async {
    await into(cartItems).insertOnConflictUpdate(item);
  }

  // Удалить товар
  Future<void> removeCartItem(int id) async {
    await (delete(cartItems)..where((t) => t.id.equals(id))).go();
  }

  // Очистить корзину
  Future<void> clearCart() async {
    await delete(cartItems).go();
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'cart_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
