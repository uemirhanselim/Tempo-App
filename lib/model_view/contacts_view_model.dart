import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/employee_model.dart';
import '../model/firstName_model.dart';
import '../view/contacts_view.dart';

abstract class ContactsModelView extends State<ContactsView> {
  List<Employee> users = [];
  List<String> newList = [];
  List<FirstName> firstNames = [];
  bool isLoading = false;

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    readJsonLocal();
    initList();
    super.initState();
  }

  Future<void> readJsonLocal() async {
    _changeLoading();
    try {
      final response =
          await rootBundle.loadString('assets/json/employees.json');
      final productData = await jsonDecode(response);
      var list = productData as List<dynamic>;

      setState(() {
        users = list.map((e) => Employee.fromJson(e)).toList();
      });
      for (var element in users) {
        newList.add(element.firstName ?? '');
      }
    } on Exception {
      return print('Error at readJsonLocal');
    }
    _changeLoading();
  }

  Future<void> initList() async {
    await Future.delayed(const Duration(seconds: 2));
    var aa = newList
        .map((name) => FirstName(firstName: name, tag: name[0].toUpperCase()))
        .toList();
    firstNames = aa;
    SuspensionUtil.sortListBySuspensionTag(firstNames);
    SuspensionUtil.setShowSuspensionStatus(firstNames);
    setState(() {});
  }
}
