import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../data/Players.dart';

class HomeController extends GetxController {
  List<Players> players = [
    Players(country: "India", name: "Rohit Sharma"),
    Players(country: "India", name: "Virat Kohli"),
    Players(country: "Australia", name: "Glenn Maxwell"),
    Players(country: "Australia", name: "Aaron Finch"),
    Players(country: "New Zealand", name: "Martin Guptill"),
    Players(country: "New Zealand", name: "Trent Boult"),
    Players(country: "South Africa", name: "Davcountry Miller"),
    Players(country: "South Africa", name: "Kagiso Rabada"),
    Players(country: "West Indies", name: "Chris Gayle"),
    Players(country: "West Indies", name: "Jason Holder"),
  ];

  List<dynamic> selectedPlayer = [];
  var selectedPlayerValue = ''.obs;

  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showMultiSelect() async {
    await showDialog(
        context: Get.context!,
        builder: (ctx) {
          return MultiSelectDialog(
            listType: MultiSelectListType.LIST,
            initialValue: selectedPlayer,
            items: players
                .map((player) => MultiSelectItem<Players>(player, player.name!))
                .toList(),
            title: Text("Players"),
            selectedColor: Colors.blue,
            searchable: true,
            onConfirm: (results) {
              selectedPlayer = results;
              selectedPlayerValue.value = "";
              selectedPlayer.forEach((element) {
                selectedPlayerValue.value =
                    selectedPlayerValue.value + " " + element.name;
              });
            },
          );
        });
  }
}
