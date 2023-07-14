import 'package:age_calculate/utils.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  TextEditingController birthDayController = TextEditingController();
  int calculateAge = 0;
  int std = 0;
  String standard = "-";
  String rteStd = "-";
  DateTime today = DateTime.now();
  int monthDiff = 00;
  int dayDiff = 00;
  int yearDiff = 00;
  DateDuration? duration;
  List<String> yourAgeList = [];
  String yourDay = "0";
  String yourMonth = "0";
  bool isShowDateMonth = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff6470de),
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Age Of School",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
      ),
      // backgroundColor: Color(0xffeaeaea),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Center(
            //   child: Text("2023-24 / २०२३-२४",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
            // ),
             SizedBox(
              height: 16.0,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                // color: Color(0xff6470de),
              color: Colors.teal,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDate();
                    },
                    child: TextFormField(
                      controller: birthDayController,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "DOB / जन्म की तारीख",
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        enabled: false,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          Icons.calendar_month, color: Colors.blue,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.black)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: Colors.black)

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  age(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  stander(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  rteSTD(),
                  const SizedBox(
                    height: 16.0,
                  ),

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Text("You are (Your age right now)",
                          style: TextStyle(color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                decoration: boxDecorationDefault(
                                  color: Color(0xff94a4e8),),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                  Text(
                                yourDay,
                                        style: boldTextStyle(
                                            color: Colors.black,
                                            size: 18),textAlign: TextAlign.center,) ,
                                    8.height,
                                    Text("Days",
                                        style: secondaryTextStyle(
                                            size: 14,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                decoration: boxDecorationDefault(
                                  color: Color(0xffcfd499),),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        yourMonth,
                                        style: boldTextStyle(
                                            color: Colors.black,
                                            size: 18),),
                                    8.height,
                                    Text("Months",
                                        style: secondaryTextStyle(
                                            size: 14,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                decoration: boxDecorationDefault(
                                  color: Color(0xff72e2b3),),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Text(calculateAge.toString(), style: boldTextStyle(
                                  color: Colors.black,
                                  size: 18)),
                                    8.height,
                                    Text("Years",
                                        style: secondaryTextStyle(
                                            size: 14,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10.0),
        child: TextButton(
            onPressed: () {
              birthDayController.clear();
              yourAgeList.clear();
              calculateAge = 0;
              standard = "-";
              rteStd = "-";
              yourDay = "0";
              yourMonth = "0";
              setState(() {});
            },
            style: TextButton.styleFrom(
                // backgroundColor: Color(0xffbb7ef9),
              backgroundColor: Colors.blue,
                fixedSize: Size(MediaQuery
                    .of(context)
                    .size
                    .width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
            ),
            child: Text("Clear".toUpperCase(), style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700),)),
      ),
    );
  }



  showDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      birthDayController.text =
          DateFormat('dd/MM/yyyy').format(pickedDate).toString();
      findAge(pickedDate);
      setState(() {});
    }
  }


  findAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    String currentMonth = DateFormat('MM/yyyy').format(currentDate);
    debugPrint("currentMonth::=>${currentMonth.toString()}");
    calculateAge = currentDate.year - birthDate.year;
    String birthdayMonthYear = DateFormat('MM/yyyy').format(birthDate);
    debugPrint("birthdayYear::=>${birthdayMonthYear.toString()}");
    int month1 = currentDate.month;
    debugPrint("month1::=>${month1.toString()}");
    int month2 = birthDate.month;
    debugPrint("month2::=>${month2.toString()}");

    /*if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(birthDate.isAfter(DateTime.parse('2017-06-01')) && birthDate.isBefore(DateTime.parse('2018-05-31'))){
      calculateAge=5;
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }*/
    if (birthDate.isBetween(
        from: DateTime.parse('2019-06-01'), to: DateTime.parse('2020-05-31'))) {
      calculateAge = 3;
      standard = "(nursery/J.K.G)";
      rteStd = "";
    }else if (birthDate.isBetween(
        from: DateTime.parse('2018-06-01'), to: DateTime.parse('2019-05-30'))) {
      calculateAge = 4;
      standard = "बालमंदिर (nursery/S.K.G)";
      rteStd = "";
    }else if (birthDate.isBetween(
        from: DateTime.parse('2017-06-01'), to: DateTime.parse('2018-05-31'))) {
      calculateAge = 5;
      standard = "बालवाटिका";
      rteStd = "-";
    } else if (birthDate.isBetween(from: DateTime.parse('2016-06-01'), to: DateTime.parse('2017-05-31'))) {
      calculateAge = 6;
      standard = "1";
      rteStd = "-";
    } else if (birthDate.isBetween(from: DateTime.parse('2015-06-01'), to: DateTime.parse('2016-05-31'))) {
      calculateAge = 7;
      standard = "2";
      rteStd = "1";
    }else if (birthDate.isBetween(from: DateTime.parse('2014-06-01'), to: DateTime.parse('2015-05-31'))) {
      calculateAge = 8;
      standard = "3";
      rteStd = "2";
    }else if (birthDate.isBetween(from: DateTime.parse('2013-06-01'), to: DateTime.parse('2014-05-31'))) {
      calculateAge = 9;
      standard = "4";
      rteStd = "3";
    }else if (birthDate.isBetween(from: DateTime.parse('2012-06-01'), to: DateTime.parse('2013-05-31'))) {
      calculateAge = 10;
      standard = "5";
      rteStd = "4";
    }else if (birthDate.isBetween(from: DateTime.parse('2011-06-01'), to: DateTime.parse('2012-05-31'))) {
      calculateAge = 11;
      standard = "6";
      rteStd = "5";
    }else if (birthDate.isBetween(from: DateTime.parse('2010-06-01'), to: DateTime.parse('2011-05-31'))) {
      calculateAge = 12;
      standard = "7";
      rteStd = "6";
    }else if (birthDate.isBetween(from: DateTime.parse('2009-06-01'), to: DateTime.parse('2010-05-31'))) {
      calculateAge = 13;
      standard = "8";
      rteStd = "7";
    }else if (birthDate.isBetween(from: DateTime.parse('2008-06-01'), to: DateTime.parse('2009-05-31'))) {
      calculateAge = 14;
      standard = "-";
      rteStd = "8";
    }else{
      standard = "-";
      rteStd = "-";
    }


    /* ===========> Month <========== */


      duration = AgeCalculator.age(birthDate);
      String dur = duration.toString();
      yourAgeList = dur.split(",");
      yourDay = yourAgeList[2].replaceAll("Days:", "");
      yourMonth = yourAgeList[1].replaceAll("Months:", "");




    if (today.month > birthDate.month) {
      monthDiff = today.month - birthDate.month;
    }


    dayDiff = today.month - birthDate.day;
    debugPrint("dayDiff:=>$dayDiff");


/*    monthDiff = today.month - birthDate.month;
    debugPrint("monthDiff:=>$monthDiff");*/

    yearDiff = today.year - birthDate.year;
    debugPrint("yearDiff:=>$yearDiff");


    // if (month2 > month1) {
    //   calculateAge--;
    // } 
    // else if (month1 == month2) {
    //   int day1 = currentDate.day;
    //   int day2 = birthDate.day;
    //   if (day2 > day1) {
    //     calculateAge--;
    //   }
  }

  // if(calculateAge == 3){
  //   standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
  //   rteStd = "-";
  // }else if(calculateAge == 4){
  //   standard = "બાલમંદિર (નર્સરી/જુ.કે.જી)";
  //   rteStd = "-";
  // }else if(calculateAge == 5){
  //   standard = "બાલવાટિકા";
  //   rteStd = "-";
  // }else if(calculateAge == 6){
  //   standard = "1";
  //   rteStd = "-";
  // }else if(calculateAge == 7){
  //   standard = "2";
  //   rteStd = "1";
  // }else if(calculateAge == 8){
  //   standard = "3";
  //   rteStd = "2";
  // }else if(calculateAge == 9){
  //   standard = "4";
  //   rteStd = "3";
  // }else if(calculateAge == 10){
  //   standard = "5";
  //   rteStd = "4";
  // }else if(calculateAge == 11){
  //   standard = "6";
  //   rteStd = "5";
  // }else if(calculateAge == 12){
  //   standard = "7";
  //   rteStd = "6";
  // }else if(calculateAge == 13){
  //   standard = "8";
  //   rteStd = "7";
  // }else if(calculateAge == 14){
  //   standard = "-";
  //   rteStd = "8";
  // } else{
  //   standard = "-";
  //   rteStd = "-";
  // }


/*
    if(birthdayMonthYear == "06/2008" || birthdayMonthYear == "05/2009"){
      standard = "-";
      rteStd = "8";
    }
    else if(birthdayMonthYear == "06/2009" || birthdayMonthYear == "05/2010"){
      standard = "8";
      rteStd = "7";
    }else if(birthdayMonthYear == "06/2010" || birthdayMonthYear == "05/2011"){
      standard = "7";
      rteStd = "6";
    }else if(birthdayMonthYear == "06/2011" || birthdayMonthYear == "05/2012"){
      standard = "6";
      rteStd = "5";
    }else if(birthdayMonthYear == "06/2012" || birthdayMonthYear == "05/2013"){
      standard = "5";
      rteStd = "4";
    }else if(birthdayMonthYear == "06/2013" || birthdayMonthYear == "05/2014"){
      standard = "4";
      rteStd = "3";
    }else if(birthdayMonthYear == "06/2014" || birthdayMonthYear == "05/2015"){
      standard = "3";
      rteStd = "2";
    }else if(birthdayMonthYear == "06/2015" || birthdayMonthYear == "05/2016"){
      standard = "2";
      rteStd = "1";
    }else if(birthdayMonthYear == "06/2016" || birthdayMonthYear == "05/2017"){
      standard = "1";
      rteStd = "-";
    }else if(birthdayMonthYear == "06/2017" || birthdayMonthYear == "05/2018"){
      standard == "બાલવાટિકા";
      rteStd = "-";
    }
    else{
      standard = "-";
      rteStd = "-";
    }*/

/*   if(birthdayMonthYear == "06/2017" || birthdayMonthYear == "05/2018"){
     standard = "બાલવાટિકા";
   }else if(birthdayMonthYear == "06/2018" || birthdayMonthYear == "05/2019"){
     standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
   }else if(birthdayMonthYear == "06/2019"||birthdayMonthYear == "05/2020"){
     standard = "બાલમંદિર (નર્સરી/જુ.કે.જી)";
   }else if(birthdayMonthYear == currentMonth){
     standard = "-";
     rteStd = "-";
   }else{
     std = (calculateAge - 5);
     debugPrint("STD=>${std.toString()}");
     rteStd = (std + 1).toString();
     standard = std.toString();
   }*/


  age() {
    return Container(
      height: 60,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        // border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const Text("AGE / आयु :", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          Text(calculateAge.toString(), style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  stander() {
    return Container(
      height: 60,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        // border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const Text("STD / कक्षा:", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          Text(standard, style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  rteSTD() {
    return Container(
      height: 60,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          const Text("RTE STD / आर. टी. इ कक्षा:", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          Text(rteStd.toString(), style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  Widget title({String? title}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Text(title!, style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),));
  }

  dateFormat(String date) {
    DateTime brazilianDate = new DateFormat("dd/MM/yyyy").parse(date);
/*    DateTime dateT = DateFormat("dd/MM/yyyy").parse(date);
    var d=  DateFormat('dd/MM/yyyy').format(dateT);*/
    debugPrint("dateTime:${brazilianDate.toString()}");
    return brazilianDate;
  }
}




