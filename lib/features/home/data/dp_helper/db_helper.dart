import 'package:meals_app/features/home/data/model/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imageUrl TEXT, 
      name TEXT,
      description TEXT, 
      rate REAL,
      time TEXT
    )
    ''');
  }

  Future<void> insert(MealModel mealModel) async {
    final db = await database;
    Map<String, dynamic> meal = mealModel.toJson();
    await db.insert('meals', meal);
  }

  Future<List<MealModel>> getMeals() async {
    final db = await database;
    final result = await db.query('meals');
    List<MealModel> meals = result.map((meal) => MealModel.fromJson(meal)).toList();
    return meals;
  }
}
