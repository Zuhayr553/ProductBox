import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productbox/constants/textfield.dart';
import 'package:productbox/constants/theme_data.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  WebSocket({Key? key}) : super(key: key);

  @override
  State<WebSocket> createState() => _WebSocketState();
}

class _WebSocketState extends State<WebSocket> {
  final channel = WebSocketChannel.connect(
    Uri.parse(
        'wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self'),
  );
  late TextEditingController messegeController;

  List webSocketReturnedMessege = [];
  @override
  void dispose() {
    messegeController.dispose();
    channel.sink.close();
    super.dispose();
  }

  @override
  void initState() {
    messegeController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Center(
                  child: Text(
                    'Let Me Tell You Something',
                    style: TextStyle(
                        color: MyThemeData().kBackground,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                customTextFeildWebSocket(
                    messegeController, 'Please Talk To Me'),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    channel.sink.add(messegeController.text);
                  },
                  child: Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: MyThemeData().kButtonBack,
                    ),
                    child: Center(
                      child:
                          // loader == true
                          //     ? const CircularProgressIndicator(
                          //         color: Colors.white,
                          //       )
                          //     :
                          Text(
                        'ENTER',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: MyThemeData().kWhite),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: MyThemeData().kBackground,
                            ),
                          ),
                        ],
                      );
                    }
                    webSocketReturnedMessege.add(snapshot.data);
                    return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: webSocketReturnedMessege.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return webSocketReturnedMessege.length == 0
                            ? SizedBox.shrink()
                            : Column(
                                children: [
                                  Container(
                                    width: Get.width * 0.9,
                                    // height: 120,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: MyThemeData().kWhite,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              33, 158, 188, 0.24),
                                          blurRadius: 10, // soften the shadow
                                          spreadRadius: 0, //extend the shadow
                                          offset: Offset(
                                            2.0, // Move to right 5  horizontally
                                            6.0, // Move to bottom 5 Vertically
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                            webSocketReturnedMessege[index] ??
                                                '')),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                ],
                              );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
