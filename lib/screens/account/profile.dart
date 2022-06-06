import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/profile_model.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/components/header_with_only_title.dart';
import 'package:kingsmart_online_app/services/account/profile_service.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Color.dart';
import '../components/gender_radio_item.dart';

class ProfileFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: ProfileService.getProfileDetails(),
      initialData: ProfileModel(),
      child: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = Provider.of<ProfileModel>(context);
    return ChangeNotifierProvider<ProfileModel>.value(
        value: profileModel, child: Body());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GenderRadioModel> sampleData = [];
    sampleData.add(GenderRadioModel(false, 'Qadın'));
    sampleData.add(GenderRadioModel(false, 'Kişi'));
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    ProfileModel profileModel = Provider.of<ProfileModel>(context);
    for (var i = 0; i < 2; i++) {
      sampleData[i].isSelected = false;
      if (i == profileModel.gender) {
        sampleData[i].isSelected = true;
      }
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            height: height1 / 12,
            color: CustomColors().kingsRed,
            child: HeaderWithBack(title: "Profilim"),
          ),
          profileModel.id < 1
              ?
              shimmer(screenWidth, height1)
              :
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
                  child: Text("Şəxsi məlumatlar",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 26,
                          ),
                          color: Colors.black)),
                ),
                Padding(
                  padding:
                       EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = profileModel.firstName
                      ..selection = TextSelection.collapsed(
                          offset: profileModel.firstName.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Ad*'),
                    onChanged: (String value) {
                      profileModel.changeFirstName(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = profileModel.lastName
                      ..selection = TextSelection.collapsed(
                          offset: profileModel.lastName.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Soyad*'),
                    onChanged: (String value) {
                      profileModel.changeLastName(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = profileModel.email
                      ..selection = TextSelection.collapsed(
                          offset: profileModel.email.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Email ünvan*'),
                    onChanged: (String value) {
                      profileModel.changeEmail(value);
                    },
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: InkWell(
                    splashColor: Colors.redAccent,
                    onTap: () {
                      var initialDate = [2000, 6, 15];
                      if( profileModel.birthYear != -1 && profileModel.birthYear != -0 )
                        {
                              initialDate = [
                              profileModel.birthYear,
                              profileModel.birthMonth,
                              profileModel.birthDay
                            ];
                        }
                      showDatePicker(
                              context: context,
                              initialDate: DateTime(initialDate[0],
                                  initialDate[1], initialDate[2]),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2011))
                          .then((date) {
                            profileModel.changeBirthday( date?.year, date?.month, date?.day );
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height:  height1 / 13,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(profileModel.birthDay != -1 &&
                                    profileModel.birthDay != 0
                                ? profileModel.birthDay.toString().padLeft(2, '0') +
                                    "-" +
                                    profileModel.birthMonth.toString().padLeft(2, '0') +
                                    "-" +
                                    profileModel.birthYear.toString()
                                : ""),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: SizedBox(
                    width: screenWidth,
                    height:  height1 / 10,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          splashColor: Colors.redAccent,
                          onTap: () {
                            profileModel.changeGender(index);
                            //Navigator.pop(context);
                          },
                          child: GenderRadioItem(sampleData[index]),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                  child: Text("Telefon məlumatları",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 26,
                          ),
                          color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = profileModel.mobile.replaceAll("00994", "+994"),
                    enabled: false,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFDDDDDD),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Mobil nömrə*'),
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  height: height1 / 9,
                  child: Padding( padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      color: Colors.red,
                      child: Text("YADDA SAXLA",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle( fontSize: screenWidth / 25 ),
                              color: Colors.white)),
                      onPressed: () {
                        ProfileService.updateProfile( profileModel );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget shimmer(screenWidth, height1 ){
    return Shimmer.fromColors(
      baseColor: Color(0xFFf5f5f7),
      highlightColor: Color(0xFFEBEBF4),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 30 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: screenWidth / 15, right: screenWidth / 20, top: height1 / 30),
                width: screenWidth / 2.5 ,
                height: height1 / 13 ,
                color: Color(0xFFEBEBF4),
              ),
              Container(
                margin: EdgeInsets.only(left: screenWidth / 15, top: height1 / 30),
                width: screenWidth / 2.5 ,
                height: height1 / 13 ,
                color: Color(0xFFEBEBF4),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 30 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 13 ,
            color: Color(0xFFEBEBF4),
          ),
        ],
      ),
    );
  }
}
