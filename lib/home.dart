import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  TextEditingController birthDayController = TextEditingController();
  int calculateAge = 0;
  int std = 0;
  String standard = "0";
  String rteStd = "0";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 70.0),
        child: Column(
          children: [
            const Center(
              child: Text("શૈક્ષણિક ધોરણમાં દાખલ કરવાનું ટેબલ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
            ),
            const Center(
              child: Text("વર્ષ: ૨૦૨૩-૨૪",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16),),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
             onTap: (){
               showDate();
             },
             child: TextFormField(
               controller: birthDayController,
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
               decoration: InputDecoration(
                 hintText: "Select DOB",
             hintStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
             enabled: false,
             suffixIcon: const Icon(Icons.calendar_month,color: Colors.black,),
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(5.0),
                 borderSide: const BorderSide(color: Colors.black)
             ),
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5.0),
               borderSide: const BorderSide(color: Colors.black)
             )
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
          ],
        ),
      ),
    );
  }

  showDate()async{
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if(pickedDate != null){
      birthDayController.text = DateFormat('dd/MM/yyyy').format(pickedDate).toString();
      findAge(pickedDate);
      setState(() {
      });
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
    if (month2 > month1) {
      calculateAge--;
    } 
    else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        calculateAge--;
      }
    }

    if(calculateAge == 3){
      standard = "બાલમંદિર (નર્સરી/સી.કે.જી)";
      rteStd = "-";
    }else if(calculateAge == 4){
      standard = "બાલમંદિર (નર્સરી/જુ.કે.જી)";
      rteStd = "-";
    }else if(calculateAge == 5){
      standard = "બાલવાટિકા";
      rteStd = "-";
    }else if(calculateAge == 6){
      standard = "1";
      rteStd = "-";
    }else if(calculateAge == 7){
      standard = "2";
      rteStd = "1";
    }else if(calculateAge == 8){
      standard = "3";
      rteStd = "2";
    }else if(calculateAge == 9){
      standard = "4";
      rteStd = "3";
    }else if(calculateAge == 10){
      standard = "5";
      rteStd = "4";
    }else if(calculateAge == 11){
      standard = "6";
      rteStd = "5";
    }else if(calculateAge == 12){
      standard = "7";
      rteStd = "6";
    }else if(calculateAge == 13){
      standard = "8";
      rteStd = "7";
    }else if(calculateAge == 14){
      standard = "-";
      rteStd = "8";
    } else{
      standard = "-";
      rteStd = "-";
    }
/*
    if(birthdayMonthYear == "06/2008" || birthdayMonthYear == "05/2009"){
      standard = "-";
      rteStd = "8";
    }else if(birthdayMonthYear == "06/2009" || birthdayMonthYear == "05/2010"){
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

  }

  age(){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const Text("AGE :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          Text(calculateAge.toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  stander(){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children:  [
          const Text("STD :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          Text(standard,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }

  rteSTD(){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children:  [
          const Text("RTE STD :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
          const SizedBox(width: 10.0,),
          standard == "બાલવાટિકા" || standard == "બાલમંદિર (નર્સરી/સી.કે.જી)" || standard == "બાલમંદિર (નર્સરી/જુ.કે.જી)" ? const Text("-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),):
          Text(rteStd.toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }


}
