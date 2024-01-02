import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controll/controllerhome.dart';
import 'package:whatsapp/view/screen/calls.dart';
import 'package:whatsapp/view/screen/chats.dart';
import 'package:whatsapp/view/screen/setting.dart';
import 'package:whatsapp/view/screen/status.dart';
import 'package:whatsapp/view/widget/popbutwidget.dart';


class Home extends GetView<homecontroller> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(homecontroller());
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: [
            Tab(
                child: IconButton(
                    onPressed: () {
                      controller.opencamera();
                    },
                    icon: Icon(Icons.camera_alt_outlined))),
            Tab(
              child: Text("chats"),
            ),
            Tab(
              child: Text("Status"),
            ),
            Tab(
              child: Text("Calls"),
            ),
          ]),
          actions: [

            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.to(() => settingscreen());
                },
                icon: Icon(Icons.settings)),
            popbutwidget(
              firsttext: Text(
                "Setting",
              ),
              sectext: Text("Started MSG"),
              thtext: Text("WhatsApp Web"),
              fourtext: Text("Profile"),
            ),
          ],
        ),
        body: TabBarView(children: [
          Text(""),
          chats(),
          status(),
          callsscreen(),
        ]),
      ),
    );
  }
}
