import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:julyfultterproject/statemanagement_using_get/themes/theme_controller.dart';
import 'package:julyfultterproject/statemanagement_using_get/themes/themedata.dart';
void main(){
  runApp(GetMaterialApp(title: "flutter demo",
  theme: CustomTheme.darkTheme,
  darkTheme: CustomTheme.lightTheme,
  themeMode: ThemeMode.system,
  home: Home(),));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller =Get.put(HomeController());
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(()
        =>Text(_controller.currentTheme.value==ThemeMode.dark?"Dark Theme":"Light Theme")),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Tap on the switch to change the theme",style: TextStyle(fontSize: size.height*0.02),
          ),
          Obx(()=>
          Switch(value: _controller.currentTheme.value==ThemeMode.dark, onChanged: (value){
            _controller.SwitchTheme();
            Get.changeThemeMode(_controller.currentTheme.value);
          },
            activeColor: CustomTheme.white,
          )
          )
        ],
      ),),
    );
  }
}
