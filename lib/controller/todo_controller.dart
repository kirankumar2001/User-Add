import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:web_api_app/model/todo_model.dart';

class TodoController extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  TextEditingController _address = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController get address => _address;
  TextEditingController get name => _name;
  bool _addLoad = false;
  bool get addLoad => _addLoad;
  bool _isLoading = false;
  bool _isError = false;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  set address(TextEditingController contrl) {
    _address = contrl;
    notifyListeners();
  }

  set addLoad(bool load) {
    _addLoad = load;
    notifyListeners();
  }

  set name(TextEditingController contrl) {
    _name = contrl;
    notifyListeners();
  }

  set isLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  set isError(bool err) {
    _isError = err;
    notifyListeners();
  }

  set todos(List<Todo> t) {
    _todos = t;
    notifyListeners();
  }

  String api = 'https://192.168.0.167:443/api/Users';

  Future fetchData() async {
    isError = false;
    isLoading = true;
    todos = [];
    notifyListeners();
    try {
      var response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        isError = false;
        isLoading = false;
        notifyListeners();

        List jsonData = jsonDecode(response.body);
        print(jsonData);
        todos = jsonData.map((value) => Todo.fromJson(value)).toList();
        // todos = jsonData.map((e) => Todo.fromJson(e)).toList();
        print(todos);
      } else {
        isError = true;
        isLoading = false;
        notifyListeners();
        print('Failed to load data');
      }
    } catch (e) {
      isError = true;
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  Future addList(BuildContext context) async {
    String n = name.text.trim();
    String d = address.text.trim();
    addLoad = true;
    print('Add');
    notifyListeners();
    try {
      var response = await http.post(Uri.parse(api),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(Todo(userId: 0, name: n, address: d)));
      // if (response.statusCode == 200) {
      addLoad = false;
      notifyListeners();

      // todos = jsonData.map((e) => Todo.fromJson(e)).toList();
      print(response.body);
      fetchData();
      Navigator.pop(context);
      // } else {
      //   addLoad = false;
      //   print(response.body);
      //   notifyListeners();
      //   print('Failed to load data');
      // }
    } catch (e) {
      addLoad = false;
      notifyListeners();
      print(e);
    }
  }

  Future editList(BuildContext context, String id) async {
    String n = name.text.trim();
    String d = address.text.trim();
    addLoad = true;
    print('Edit  ' + id);
    notifyListeners();
    try {
      var response = await http.put(Uri.parse('$api/$id'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(Todo(userId: int.parse(id), name: n, address: d)));

      addLoad = false;
      notifyListeners();

      // todos = jsonData.map((e) => Todo.fromJson(e)).toList();
      print(response.body);
      fetchData();
      Navigator.pop(context);
    } catch (e) {
      addLoad = false;
      notifyListeners();
      print(e);
    }
  }

  Future deleteList(BuildContext context, String id) async {
    addLoad = true;

    notifyListeners();
    try {
      var response = await http.delete(
        Uri.parse('$api/$id'),
      );
      // if (response.statusCode == 200) {
      addLoad = false;
      notifyListeners();

      // todos = jsonData.map((e) => Todo.fromJson(e)).toList();
      print(response.body);
      fetchData();
      Navigator.pop(context);
      // } else {
      //   addLoad = false;
      //   notifyListeners();
      //   print('Failed to load data');
      // }
    } catch (e) {
      addLoad = false;
      notifyListeners();
      print(e);
    }
  }
}
