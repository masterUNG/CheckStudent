import 'package:checkstudent/models/false_login_model.dart';
import 'package:checkstudent/models/token_model.dart';
import 'package:checkstudent/states/main_home.dart';
import 'package:checkstudent/utility/my_constant.dart';
import 'package:checkstudent/utility/my_dialog.dart';
import 'package:checkstudent/widgets/widget_button.dart';
import 'package:checkstudent/widgets/widget_form.dart';
import 'package:checkstudent/widgets/widget_image.dart';
import 'package:checkstudent/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
          child: Container(
            decoration: MyConstant().basicBox(),
            child: Stack(
              children: [
                contentTop(boxConstraints: constraints),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    contentForm(constraints),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Container contentForm(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.only(top: 48, left: 32, right: 32),
      decoration: BoxDecoration(
        color: MyConstant.button,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100), topRight: Radius.circular(100)),
      ),
      width: constraints.maxWidth,
      height: constraints.maxHeight * 0.75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetText(
              text: 'Login:',
              textStyle: MyConstant().h2Style(),
            ),
            WidgetForm(
              hint: 'User:',
              iconData: Icons.person_outline,
              changeFunc: (p0) {
                user = p0.trim();
              },
            ),
            WidgetForm(
              hint: 'Password:',
              iconData: Icons.lock_outline,
              changeFunc: (p0) {
                password = p0.trim();
              },
              obsecu: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: constraints.maxWidth - 64,
              child: WidgetButton(
                label: 'Login',
                pressFunc: () {
                  print('user = $user, password = $password');

                  if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                    MyDialog(context: context).normalDialog(
                        title: 'Have Space ?',
                        subTitle: 'Please Fill Every Blank');
                  } else {
                    processCheckLogin();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget contentTop({required BoxConstraints boxConstraints}) {
    double height = boxConstraints.maxHeight * 0.25 / 2;

    return Container(
      margin: EdgeInsets.only(left: 36, top: height),
      child: Row(
        children: [
          imageLogo(),
          WidgetText(
            text: MyConstant.appName,
            textStyle: MyConstant().h1Style(),
          )
        ],
      ),
    );
  }

  Container imageLogo() {
    return Container(
      width: 50,
      child: WidgetImage(),
    );
  }

  Future<void> processCheckLogin() async {
    Map<String, dynamic> map = {};
    map['username'] = user;
    map['password'] = password;

    String pathAPI = 'http://www.db.grad.nu.ac.th/apps/ws/login';

    await Dio().post(pathAPI, data: map).then((value) {
      // print('value from api ==> $value');

      FalseLoginModel falseLoginModel = FalseLoginModel.fromMap(value.data);
      print('false Model ==> ${falseLoginModel.toMap()}');

      if (falseLoginModel.message.isEmpty) {
        //login true

        TokenModel tokenModel = TokenModel.fromMap(value.data);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainHome(token: tokenModel.token),
            ),
            (route) => false);
      } else {
        //login false
        MyDialog(context: context).normalDialog(
            title: falseLoginModel.message,
            subTitle: 'Please Try Again Urser or Password False');
      }
    });
  }
}
