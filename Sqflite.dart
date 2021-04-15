import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaMenu(),
    );
  }
}

class AnaMenu extends StatefulWidget {
  @override
  _AnaMenuState createState() => _AnaMenuState();
}

class _AnaMenuState extends State<AnaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite"),
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => null,
                ),
                title: Text(_categoryList[index].name),
                subtitle: Text(_categoryList[index].description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => null,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ekleDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  var _category = Category();

  var _categoryService = CategoryService();

  TextEditingController categoryText = TextEditingController();

  TextEditingController descriptionText = TextEditingController();

  List<Category> _categoryList = [];

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    _categoryList = [];
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.id = category["id"];
        categoryModel.name = category["name"];
        categoryModel.description = category["description"];
        _categoryList.add(categoryModel);
      });
    });
  }

  ekleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: categoryText,
                    decoration: InputDecoration(
                      labelText: "Category",
                    ),
                  ),
                  TextField(
                    controller: descriptionText,
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.red),
              ),
              TextButton(
                onPressed: () async {
                  _category.name = categoryText.text;
                  _category.description = descriptionText.text;
                  var result = await _categoryService.saveCategory(_category);
                  print(result);
                  categoryText.text = "";
                  descriptionText.text = "";
                  getAllCategories();
                  Navigator.pop(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          );
        });
  }
}

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "liste");
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");
  }
}

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}

class Category {
  int id;
  String name;
  String description;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id;
    mapping["name"] = name;
    mapping["description"] = description;

    return mapping;
  }
}

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData("categories", category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData("categories");
  }
}
