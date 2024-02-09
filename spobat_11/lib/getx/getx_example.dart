import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spobat_11/getx/controller.dart';

void main(){
  runApp(GetMaterialApp(home: Get_Main(),));
}
class Get_Main extends StatelessWidget {
  const Get_Main({super.key});

  @override
  Widget build(BuildContext context) {
    final CountController controller = Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Count ${controller.count}')),
            ElevatedButton(onPressed: (){
              controller.increment();
            }, child: Text('Increment')),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              controller.decrement();
            }, child: Text('Decrenemt'))
          ],
        ),
      ),
    );
  }
}
