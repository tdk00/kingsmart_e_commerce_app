import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/address_model.dart';
import 'package:kingsmart_online_app/screens/checkout/payment_selection.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/services/account/address_service.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Color.dart';
import 'change_adress_checkout.dart';

class AddressSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<AddressModel>.value(
      value: AddressService.getSelectedAddress(),
      initialData: AddressModel(
          id: 0, content: '', postal: '', note: '', selected: false),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    AddressModel selectedAddress = Provider.of<AddressModel>(context);
    var showWidget;
    if (selectedAddress.id == -1) {
      showWidget = NoAddress();
    }
    if (selectedAddress.id == 0) {
      showWidget = shimmer(screenWidth, height1);
    }
    if (selectedAddress.id > 0 && selectedAddress.selected) {
      showWidget = Addresses();
    }
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: height1 / 12,
              color: CustomColors().kingsRed,
              child: HeaderWithBack(title: "Çatdırılma məlumatları", showShoppingCartIcon: false, customTitleFontSize: screenWidth / 24,),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: height1 / 20,
                  ),
                  SizedBox(
                    width: screenWidth / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Çatdırılma ünvanı',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: screenWidth / 28.43,
                              ),
                              color: Colors.black),
                        ),
                        TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute( builder: (_) => ChangeAddressCheckoutFuture() ));
                          },
                          child: Text(
                            'Dəyişdir',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: screenWidth / 28.43,
                                    fontWeight: FontWeight.w600
                                ),
                                color: CustomColors().kingsRed),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height1 / 40,
                  ),
                  showWidget,
                  SizedBox(
                    height: height1 / 10,
                  ),

                ],

              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
            ),
          ),
          selectedAddress.selected
              ?
          Expanded(
              flex: 2,
              child: BottomPart())
              :
          Expanded(
              flex: 2,
              child: SizedBox())
        ],
      ),
    ));
  }

  Widget shimmer(screenWidth, height1) {
    return Shimmer.fromColors(
      baseColor: Color(0xFFf5f5f7),
      highlightColor: Color(0xFFEBEBF4),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1,
            height: height1 / 13,
            color: Color(0xFFEBEBF4),
          ),
        ],
      ),
    );
  }
}

class Addresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    AddressModel selectedAddress = Provider.of<AddressModel>(context);
    return Container(
      width: screenWidth / 1.1,
      height: height1 / 10,
      decoration: BoxDecoration(
          color: Color(0xFFFFF9F3),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth / 61.1))
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 50, top: height1 / 100),
              child: Text(
                'Bakı',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: screenWidth / 28.43,
                        fontWeight: FontWeight.w500
                    ),
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: height1 / 90,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth / 50),
              child: Text(
                  selectedAddress.content.length > 130
                      ?
                  selectedAddress.content.substring(0, 130) + "..."
                      :
                  selectedAddress.content,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: screenWidth / 32.43,
                        fontWeight: FontWeight.w400
                    ),
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
      onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute( builder: (_) => ChangeAddressCheckoutFuture() ));
      },
      child: Container(
        width: screenWidth / 1.1,
        height: height1 / 8,
        decoration: BoxDecoration(
            color: Color(0xFFFFF9F3),
            borderRadius: BorderRadius.all(Radius.circular(screenWidth / 61.1))
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth / 50, top: height1 / 100),
                child: Text(
                  'Ünvanı seçin',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: screenWidth / 28.43,
                          fontWeight: FontWeight.w500
                      ),
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: height1 / 90,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth / 50),
                child: Text(
                  'Ünvan məlumatlarınızı yoxlamaq üçün dəyişdir düyməsinə klikləyin',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: screenWidth / 32.43,
                          fontWeight: FontWeight.w400
                      ),
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: height1 / 8.5,
        width: screenWidth,
        child: Row(
          children: [
            SizedBox(
              width: screenWidth / 20.5,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomColors().kingsRed
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              height: height1 / 13.5,
              width: screenWidth / 2.5,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.white,
                child: Text("Ləğv et",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 27,
                        ),
                        color: CustomColors().kingsRed)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: screenWidth / 20.5,
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height1 / 13.5,
                width: screenWidth / 2.5,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.red,
                  child: Text("Davam et",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 27,
                          ),
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentSelection()));
                  },
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 20.5,
            ),
          ],
        ),
        //color: Colors.red,
      ),
    );
  }
}
