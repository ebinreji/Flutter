import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:julyfultterproject/using%20dio/color.dart';
import 'package:julyfultterproject/using%20dio/const_snackbar.dart';
import 'package:lottie/lottie.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'dioController.dart';

void main() {
  runApp(GetMaterialApp(home: DioHome()));
}

class DioHome extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio Home"),
        backgroundColor: MyColors.scColor,
      ),
      backgroundColor: MyColors.bgColor,
      floatingActionButton:
      Obx(() => controller.isNetConnected.value ? FloatingActionButton(
        onPressed: () {
          controller.isListDown.value
              ? controller.scrollToUp()
              : controller.scrollToDown();
        },
        child: FaIcon(controller.isListDown.value
            ? FontAwesomeIcons.arrowUp
            : FontAwesomeIcons.arrowDown),
      ): Container()),




      body: Obx(() =>
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isNetConnected.value == true
                ? (controller.isLoading.value
                ? Center(
                child: Lottie.asset(
                    "assets/animation/Animation - 1709191722675.json",
                    height: 100,
                    width: 200))
                : getData())
                : Center(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animation/networkerror.json"),
                  MaterialButton(onPressed: ()async{
                    if(await InternetConnectionChecker().hasConnection == true){
                      controller.fetchData();
                    }else{
                      showCustomSnackBar(context);
                    }
                  })
                ],
              ),
            ),
          )),
    );
  }



  RefreshIndicator getData(){
    return RefreshIndicator(
        child: ScrollablePositionedList.builder(
            itemScrollController: controller.scrollController,
            itemCount: controller.datas.length,
            itemBuilder: (context, index) {
              var data=controller.datas[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: MyColors.bgColor,
                    child: Text(data.id.toString()),
                  ),
                  title: Text(data.title!),
                  subtitle: Text(data.body!),
                ),
              );
            }),
        onRefresh: () {
          return controller.fetchData();
        });
  }


}