import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/main/snake_navigation.dart';
import 'package:kingsmart_online_app/services/checkout/order_service.dart';
import 'package:provider/provider.dart';

import '../../Color.dart';
import '../../models/order_model.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<OrderModel>.value(
      value: OrderService.getLastOrder(),
      initialData: OrderModel(
        id: 0,
        note: '',
        createdAt: '',
        city: '',
        address: '',
        userId: 0,
        items: [],
        payment: '',
        postal: '',
        total: 0,
        orderNumber: '',
      ),
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
    OrderModel orderModel = Provider.of<OrderModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: CustomColors().kingsRed,
                height: height1 / 12,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 15.43,
                    right: screenWidth / 15.43,
                  ),
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Təsdiqləndi",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 20.43,
                              ),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child: SizedBox()),
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 23, top: height1 / 25),
                    child: Text(" Bizi seçdiyiniz üçün təşəkkür edirik!",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth / 25,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 35),
                    child: Text("Sifarişiniz 1 saat ərzində təslim ediləcəkdir",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 26,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 35),
                    child: Row(
                      children: [
                        Text("Sifariş nömrəniz:  ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.black)),
                        Text(orderModel.orderNumber.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 35),
                    child: Text("Xülasə",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth / 25,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 35),
                    child: Text("Ödəmə forması",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 35,
                            ),
                            color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 55),
                    child: Text("Qapıda ödəmə",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 26,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 35),
                    child: Text("Çatdırılma ünvanı",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 35,
                            ),
                            color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 45),
                    child: Text(orderModel.address,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 26,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 20, top: height1 / 15, right: screenWidth / 20),
                      child: Container(
                        width: screenWidth,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Məbləğ",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth /  26,
                                      ),
                                      color: Colors.black)),
                              Text(orderModel.total.toString() + " ₼",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth /  26,
                                      ),
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 20, top: height1 / 35, right: screenWidth / 20),
                      child: Container(
                        width: screenWidth,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Çatdırılma məbləği",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 26,
                                      ),
                                      color: Colors.black)),
                              Text("0.00" + " ₼",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 26,
                                      ),
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 20, top: height1 / 35, right: screenWidth / 20),
                      child: Container(
                        width: screenWidth,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Toplam",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 25,
                                      ),
                                      color: Colors.black)),
                              Text(orderModel.total.toString() + " ₼",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 25,
                                      ),
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(flex: 1,child: SizedBox()),
            Expanded(flex: 2,child: overviewBottomPart(context))
          ],
        ),
      ),
    );
  }
}

Widget overviewBottomPart(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).viewPadding;
  double height1 = height - padding.top - kToolbarHeight;
  OrderModel orderModel = Provider.of<OrderModel>(context);
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
      height: height1 / 8.1,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height1 / 12,
              width: MediaQuery.of(context).size.width * .8,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                color: Colors.red,
                child: Text("Alış-verişə davam edin",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 25,
                        ),
                        color: Colors.white)),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SnakeNavigation()), (route) => false);
                },
              ),
            ),
          ),
        ],
      ),
      //color: Colors.red,
    ),
  );
}

