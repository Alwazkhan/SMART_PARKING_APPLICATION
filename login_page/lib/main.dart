import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/Booking.dart';
import 'package:untitled1/Login.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/Services/api_service.dart';
import 'package:untitled1/Services/shared_preferences_service.dart';
import 'package:untitled1/Services/toast_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'otp_model.dart';


class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {

  TextEditingController _otpController = TextEditingController();

/*bool isLoading = true;

  String? b_id;
  String? b_name;
 //List? buildingList = [] ;

  Future getAllBuilding() async{
    // var url ="http://parkingrapid.com/parkingrapid/api/v1/building_list";
    var response = await http.post(Uri.parse("http://parkingrapid.com/parkingrapid/api/v1/otp_check"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });
    // var map = new Map<String, dynamic>();
    // map['b_id'] = b_id.toString();
    // map['b_name'] = b_name.toString();

    // print('Login Req: $map}');
    // //lobj = new Network().userlogin(url, map);
    // // Map body = {"mobile" : mobile, "password" : password};
    // // var jsonResponse;
    // // var res = await http.post(Uri.parse("http://parkingrapid.com/parkingrapid/api/v1/login"),body: body);
//
    // // print("Response status : ${res.body}");
    // // print(res);
    // await lobj!.then((value) async {
    //   print("demo ${value.message}");
    //   SharedPreferences sharedPreferences =
    //   await SharedPreferences.getInstance();
    //   sharedPreferences.setString("mobile", value.uMobile!);
    //   //ahiya aek navigator muki ne bija page par call karai dejo
    // });

    var data = response.body;
   //setState((){
   //  buildingList = data as List?;
   //});

   /* print("response:"+response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      print("jsonData:"+jsonData.toString());
      setState((){
        buildingList = jsonData ;
        isLoading=false;
      });
    }
    else {
      setState(() {
        isLoading = false;
      });
    }*/

  }


  var dataDB ;
  @override
  void initState(){
    super.initState();
    dataDB = getAllBuilding();

  }*/


  Future<otpmodel>? lobj;

  signIn(String mobile_otp,) async {
//String url = "http://parkingrapid.com/parkingrapid/api/v1/login";

    String url = "http://parkingrapid.com/parkingrapid/api/v1/login";

    var map = new Map<String, dynamic>();
    map['u_mobile'] = mobile_otp.toString();
//map['password'] = password.toString();

    print('Login Req: $map}');

    lobj = new Network().userlogin(url, map) as Future<otpmodel>?;
    await lobj!.then((value) async {
      print("demo ${value.message}");
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString("u_mobile", value.mobile_otp as String);
//ahiya aek navigator muki ne bija page par call karai dejo
    });
// if (res.statusCode == 200) {
//   // jsonResponse = json.decode(res.body);

//   print("Response status : ${res.statusCode}");
//   print("Response status : ${res.body}");

//   //   if(jsonResponse != null){
//   //     setState((){
//   //       _isLoading = false;
//   //     });
//   //
//   //     sharedPreferences.setString("ABC", jsonResponse['ABC']);
//   //
//   //     Navigator.of(this.context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=> Signup()),
//   //     (Route<dynamic> route) => false);
//   //   }
//   //   else{
//   //     setState((){
//   //    _isLoading = false;
//   // });
//   print("Response status : ${res.body}");
// }
  }

  var db;

  @override
  void initState() {
// .text = ""; //set the initial value of text field
    db = signIn("1234");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
          Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 80),
          child: Text('Verify Phone',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),

        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 60),
          child: Text('Code is Send to 1234567890',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),),
        ),
        SizedBox(height: 20,),

        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: TextField(
//controller: _otpController,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: TextField(
//controller: _otpController,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: TextField(
// controller: _otpController,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: TextField(
//controller: _otpController,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: 75, right: 25),
            child: Row(
              children: [
              const Text('Don\'t receive Code?',
              style: TextStyle(color: Colors.blueGrey),),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext Context) => otp())
                  );
                },
                child: const Text('Resend'…
                    [11:34 am, 17 / 06 / 2022]
                    Abhishek Trada Clg: import 'dart:convert';

                    otpmodel bookingmodelsFromJson(String str) =>
                otpmodel.fromJson(json.decode(str));

        String bookingmodelsToJson(otpmodel data)
    =>
        json.encode(data.toJson());

    class otpmodel {
    otpmodel({
    this.mobile,
    this.mobile_otp,
    this.error,
    this.message,
    });

    String? mobile;
    String? mobile_otp;
    String? barea;
    bool? error;
    String? message;

    factory otpmodel.fromJson(Map<String, dynamic> json) => otpmodel(
    mobile: json["u_mobile"],
    mobile_otp: json["u_otp"],
    error: json["error"],
    message: json["message"],
    );

    Map<String, dynamic> toJson() => {
    "u_mobile": mobile,
    "u_otp": mobile_otp,
    "error": error,
    "message": message,
    };
    }