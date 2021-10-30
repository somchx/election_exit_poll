import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:election_exit_poll_620710654/models/food_item.dart';
import 'package:election_exit_poll_620710654/pages/food/food_list_page.dart';
import 'package:election_exit_poll_620710654/services/api.dart';
import 'package:http/http.dart' as http;
class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
      body: _selectedBottomNavIndex == 0
          ? FoodListPage()
          : Container(
              child: Center(
                child: Text('YOUR ORDER',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
    );
  }

  _fetchFoods() async {
    try {
      var list = (await Api().fetch('foods')) as List<dynamic>;
      var foodList = list.map((item) => FoodItem.fromJson(item)).toList();
      print('Number of foods: ${foodList.length}');
    } catch (e) {
      var msg = 'ERROR: $e';
      print(msg);
    }
  }
}
Future<void> _test() async {
  var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
  var response = await http.get(
      url); //get will send back obj.type future so it's use time called asynchronous
  if (response.statusCode == 200) {
    //ดึงต่า response.body ออกมา
    Map<String, dynamic> jsonBody = json.decode(response.body);
    String status = jsonBody['status'];
    String? message = jsonBody['message'];
    List<dynamic> data = jsonBody['data'];
    print('STATUS: $status');
    print('MESSAGE: $message');
    //print('DATA: $data');
    data.forEach((element) {
      print('ITEM : $element');
      print(element['name']);
      print(element['price']);

    });
  }
}
