import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productbox/constants/showtoast.dart';
import 'package:productbox/constants/textfield.dart';
import 'package:productbox/constants/theme_data.dart';
import 'package:productbox/model/fetchusers.dart';
import 'package:productbox/services/fetchUsers.dart';
import 'package:productbox/screens/upload_docs/upload_docs.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AnimationController controller;
  bool showpassword = true;
  Users? result;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    controller = AnimationController(vsync: this);
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/vectors/vector.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  const Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  customTextFeild(emailController, 'Email'),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  customPasswordTextField(),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      if (emailController.text.trim() == '' ||
                          passwordController.text == '') {
                        showToasterror(
                            'Please Provide Your Email and Password');
                      } else {
                        onLogin();
                      }
                    },
                    child: Container(
                      height: Get.height * 0.08,
                      width: Get.width * 0.8,
                      decoration: BoxDecoration(
                          color: MyThemeData().kButtonBack,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child:
                            // loader == true
                            //     ? const CircularProgressIndicator(
                            //         color: Colors.white,
                            //       )
                            //     :
                            Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: MyThemeData().kWhite),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 228, 227, 227)),
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                  ),
                  const Text(
                    'Register Here',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container customPasswordTextField() {
    return Container(
      height: Get.height * 0.08,
      width: Get.width * 0.8,
      padding: const EdgeInsets.only(left: 30, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: kTextBorder, width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: TextFormField(
          controller: passwordController,
          obscureText: showpassword,
          cursorHeight: 20,
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.only(top: 12),
            enabledBorder:
                const UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder:
                const UnderlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: IconButton(
              splashColor: Colors.grey,
              icon: Center(
                child: Icon(
                  // Based on passwordVisible state choose the icon
                  showpassword ? Icons.visibility : Icons.visibility_off,
                  color: Color.fromRGBO(0, 129, 138, 2),
                ),
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  showpassword = !showpassword;
                });
              },
            ),
            // contentPadding: EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }

  getUsers() async {
    result = await FetchUsers().getusers();
    if (result != null) {
      print('This Username ${result!.username}');
      print('This Email As Password ${result!.email}');
    }
    setState(() {});
  }

  onLogin() async {
    if (result != null) {
      if (result!.username == emailController.text &&
          result!.email == passwordController.text) {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                onDismissCallback: (type) {
                  Get.offAll(UploadDocuments());
                },
                autoHide: const Duration(seconds: 3),
                title: 'Success',
                desc: 'Signed In Successfully!')
            .show()
            .whenComplete(() => Get.offAll(UploadDocuments()));
      } else {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                title: 'Invalid Details',
                autoHide: const Duration(seconds: 3),
                desc: 'Your email or password was Incorrect!')
            .show();
      }
    }
  }
}
