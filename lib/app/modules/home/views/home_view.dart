import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../../data/Players.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiSelectDialog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MultiSelectDialogField(
              listType: MultiSelectListType.LIST,
              chipDisplay: MultiSelectChipDisplay.none(),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              buttonIcon: Icon(
                Icons.account_box,
                color: Colors.blue,
              ),
              buttonText: Text(
                "Favorite Players",
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 16,
                ),
              ),
              items: controller.players
                  .map((player) =>
                      MultiSelectItem<Players>(player, player.name!))
                  .toList(),
              title: Text("Players"),
              selectedColor: Colors.blue,
              searchable: true,
              onConfirm: (results) {
                controller.selectedPlayer = results;
                controller.selectedPlayerValue.value = "";
                controller.selectedPlayer.forEach((element) {
                  controller.selectedPlayerValue.value =
                      controller.selectedPlayerValue.value + " " + element.name;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() => Text(controller.selectedPlayerValue.value)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.showMultiSelect();
                },
                child: Text('Show'))
          ],
        ),
      ),
    );
  }
}
