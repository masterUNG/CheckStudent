// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'package:checkstudent/models/gs_model.dart';
import 'package:checkstudent/models/hrnu_model.dart';
import 'package:checkstudent/models/reg_model.dart';
import 'package:checkstudent/utility/my_constant.dart';
import 'package:checkstudent/utility/my_dialog.dart';
import 'package:checkstudent/widgets/widget_button.dart';
import 'package:checkstudent/widgets/widget_form.dart';
import 'package:checkstudent/widgets/widget_progress.dart';
import 'package:checkstudent/widgets/widget_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class MainHome extends StatefulWidget {
  final String token;
  const MainHome({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String? token;
  String? search;

  RegModel? regModel;
  GsModel? gsModel;
  HrnuModel? hrnuModel;

  bool load = false;

  Map<String, double> graphMap = {};
  Map<String, String> mapString = {};

  String? totalPercene;

  @override
  void initState() {
    super.initState();
    token = widget.token;
    print('token ===> $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyConstant.primary,
      //   foregroundColor: MyConstant.button,
      // ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
          return GestureDetector(
            onTap: () {
              print('You Tap');
              FocusScope.of(context).requestFocus(FocusScopeNode());
            },
            child: SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Column(
                children: [
                  contentSearch(boxConstraints, context),
                  showStudent(boxConstraints: boxConstraints),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Expanded showStudent({required BoxConstraints boxConstraints}) {
    return Expanded(
      child: load
          ? const WidgetProgress()
          : regModel == null
              ? const SizedBox()
              : contentResult(boxConstraints: boxConstraints),
    );
  }

  Widget contentResult({required BoxConstraints boxConstraints}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView(
        children: [
          studentInfomation(),
          advisorInfomation(),
          advisor2Infomation(),
          showPieGraph(boxConstraints: boxConstraints),
        ],
      ),
    );
  }

  Container showPieGraph({required BoxConstraints boxConstraints}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      child: PieChart(
        legendOptions: const LegendOptions(
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.bottom,
        ),
        legendLabels: mapString,
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
        ),
        totalValue: 6,
        centerText: totalPercene,
        dataMap: graphMap,
        chartType: ChartType.ring,
        ringStrokeWidth: 85,
        chartRadius: boxConstraints.maxWidth * 0.5,
      ),
    );
  }

  Container studentInfomation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          textHeader(header: 'Infomation :'),
          contentDetail(head: 'ชื่อ :', value: regModel!.STUDENTNAME),
          contentDetail(head: 'นามสกุล :', value: regModel!.STUDENTSURNAME),
          contentDetail(head: 'Program :', value: regModel!.PROGRAMNAME),
          contentDetail(
              head: 'Namebranch :', value: regModel!.PROGRAMNAMEBRANCH),
          contentDetail(
              head: 'Certiffy :', value: regModel!.PROGRAMNAMECERTIFY),
          contentDetail(head: 'Faculty :', value: regModel!.FACULTYNAME),
          contentDetail(head: 'level :', value: regModel!.LEVELNAME)
        ],
      ),
    );
  }

  Container advisorInfomation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          textHeader(header: 'Advisor :'),
          contentDetail(head: 'Thesis :', value: gsModel!.thesis_title_th),
          contentDetail(head: 'Position :', value: gsModel!.advisor_position),
          contentDetail(head: 'Advisor:', value: gsModel!.advisor_firstname),
          contentDetail(head: 'Surname :', value: gsModel!.advisor_lastname),
        ],
      ),
    );
  }

  Container advisor2Infomation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          textHeader(header: 'Advisor2 :'),
          contentDetail(head: 'Position :', value: hrnuModel!.POSITION),
          contentDetail(head: 'Advisor:', value: hrnuModel!.FNAME),
          contentDetail(head: 'Surname :', value: hrnuModel!.LNAME),
        ],
      ),
    );
  }

  Container textHeader({required String header}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          WidgetText(
            text: header,
            textStyle: MyConstant().h2Style(),
          ),
        ],
      ),
    );
  }

  Row contentDetail({required String head, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: WidgetText(
            text: head,
            textStyle: MyConstant().h3ActiveStyle(),
          ),
        ),
        Expanded(
          flex: 2,
          child: WidgetText(
            text: value,
            textStyle: MyConstant().h3Style(),
          ),
        ),
      ],
    );
  }

  Container contentSearch(BoxConstraints boxConstraints, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: boxConstraints.maxWidth * 0.6,
            child: WidgetForm(
              textInputType: TextInputType.number,
              top: 0,
              hint: 'Student Code',
              iconData: Icons.people,
              changeFunc: (p0) {
                search = p0.trim();
              },
            ),
          ),
          WidgetButton(
            label: 'Search',
            pressFunc: () {
              if (search?.isEmpty ?? true) {
                MyDialog(context: context).normalDialog(
                    title: 'No Search', subTitle: 'Please Type Seacrch');
              } else {
                if (regModel != null) {
                  regModel = null;
                }
                FocusScope.of(context).requestFocus(FocusScopeNode());
                processSearch();
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> processSearch() async {
    total = 0.0;
    load = true;
    setState(() {});

    String path =
        'http://www.db.grad.nu.ac.th/apps/ws/get_student_all_stat_new/';

    Map<String, dynamic> map = {};
    map['studentcode'] = search;

    Dio dio = Dio();
    dio.options.headers['User-agent'] = 'app_dart';
    dio.options.headers['Authorization'] = 'JWT $token';
    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';

    await dio.post(path, data: map).then((value) {
      // print('responst===>  $value');

      var hrnuResult = value.data['hrnu_result'];
      for (var element in hrnuResult) {
        hrnuModel = HrnuModel.fromMap(element);
      }

      var gsResult = value.data['gs_result'];
      for (var element in gsResult) {
        gsModel = GsModel.fromMap(element);
      }

      print('##24sep gsModel ==> ${gsModel!.toMap()}');
      graphMap['อบรมจริยธรรม'] = calculateScore(string: gsModel!.ethics_date);
      graphMap['แต่งตั้งที่ปรึกษา'] =
          calculateScore(string: gsModel!.student_assign_date);
      graphMap['ประกาศทำวิจัย'] = calculateScore(string: gsModel!.permit_date);
      graphMap['ตีพิมพ์ผลงาน'] =
          calculateScore(string: gsModel!.publication_date);
      graphMap['สอนจบ'] = calculateScore(string: gsModel!.exam_date);
      graphMap['ส่งเล่ม'] =
          calculateScore(string: gsModel!.thesiscomplete_date);

      double perceneDou = (total / 6) * 100;
      print('##24sep perceneDou ==> $perceneDou');

      NumberFormat numberFormat = NumberFormat('#00.00', 'en_US');
      totalPercene = numberFormat.format(perceneDou);
      totalPercene = '$totalPercene %';

      mapString['อบรมจริยธรรม'] = 'อบรมจริยธรรม (${graphMap['อบรมจริยธรรม']})';
      mapString['แต่งตั้งที่ปรึกษา'] =
          'แต่งตั้งที่ปรึกษา (${graphMap['แต่งตั้งที่ปรึกษา']})';
      mapString['ประกาศทำวิจัย'] =
          'ประกาศทำวิจัย (${graphMap['ประกาศทำวิจัย']})';
      mapString['ตีพิมพ์ผลงาน'] = 'ตีพิมพ์ผลงาน (${graphMap['ตีพิมพ์ผลงาน']})';
      mapString['สอนจบ'] = 'สอนจบ (${graphMap['สอนจบ']})';
      mapString['ส่งเล่ม'] = 'ส่งเล่ม (${graphMap['ส่งเล่ม']})';

      var regResult = value.data['reg_result'];
      // print('mapReg ===> $regResult');

      if (regResult.toString() == '[]') {
        // Student Code False
        MyDialog(context: context).normalDialog(
            title: 'StudentCode False', subTitle: 'Please Try Again');
      } else {
        // Student Code True
        for (var element in regResult) {
          regModel = RegModel.fromMap(element);
        }

        // print('regModel ===> ${regModel!.toMap()}');
      }

      load = false;
      setState(() {});
    });
  }

  double total = 0.0;

  double calculateScore({required String string}) {
    double score = 1.0;
    if (string.isEmpty) {
      score = 0.0;
    }
    total = total + score;
    return score;
  }
}
