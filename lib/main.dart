import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp( MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: HomePage(),
     );
   }
 }

class HomePage extends StatelessWidget {
  final callIDTextCtrl = TextEditingController(text: "testCallID");

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIDTextCtrl,
                  decoration:
                  const InputDecoration(labelText: "start a call by id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return callpage(callID: callIDTextCtrl.text);
                    }),
                  );
                },
                child: const Text("call"),
              )
            ],
          ),
        ),
      ),
    );
  }
}




String userID = Random().nextInt(10000).toString();
class callpage extends StatelessWidget {
  const callpage({Key? key,required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(appID: 1451955357,
        appSign: 'b6f74ac30997a7bd5333567f22e06fd974c0c3ab2b97ec20a25073bd3b92696f',
        callID: callID,
        userID: userID,
        userName: 'user_$userID',
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}

