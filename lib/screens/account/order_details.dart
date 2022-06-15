import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/order_model.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/services/checkout/order_service.dart';
import 'package:kingsmart_online_app/helpers/config.dart';
import 'package:provider/provider.dart';

import '../../Color.dart';


class OrderDetailsFP extends StatelessWidget {
  final int orderId;
  const OrderDetailsFP({Key? key,  required this.orderId }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureProvider<OrderModel>.value(
      value: OrderService.getOrderById( orderId ),
      initialData: OrderModel(
          id: 0, userId: 0, orderNumber: '', city: '', address: '', postal: '', note: '', payment: '', total: 0, status: '', items: [], createdAt: ''),
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

    OrderModel order = Provider.of<OrderModel>(context);
      return SafeArea(child: Scaffold(
        body: Column(
          children: [
            Container(
              height: height1 / 12,
              color: CustomColors().kingsRed,
              child: HeaderWithBack(title: 'Sifariş ' + order.orderNumber),
            ),

            Expanded(child: OrdersListWidget())

          ],
        )
      ));
  }
}

class OrdersListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;

    OrderModel order = Provider.of<OrderModel>(context);

    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: height1 / 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only( left: screenWidth / 28, top: height1 / 50),
                      child: Text("Sifariş " + order.orderNumber,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 28,
                              ),
                              color: Colors.grey)),
                    ),
                    Padding(
                      padding: EdgeInsets.only( left: screenWidth / 28, top: height1 / 80 ),
                      child: Text(order.items.length.toString() + " məhsul / " + order.total.toString() + " ₼",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 24,
                              ),
                              color: Colors.black)),
                    ),
                  ],
                ),
            ),
            SizedBox(height: height1 / 40),
            Container(
              width: MediaQuery.of(context).size.width,
              height: height1 / 6,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 28, top: height1 / 80),
                    child: Text("Çatdırılma ünvanı",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 28,
                            ),
                            color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 28, top: height1 / 180),
                    child: Text(order.address,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 24,
                            ),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 28, top: height1 / 50),
                    child: Text("Ödəniş forması",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 28,
                            ),
                            color: Colors.grey)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 28, top: height1 / 180),
                    child: Text("Qapıda ödəmə",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 24,
                            ),
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height1 / 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 1.5, color: Color(0xFFCDCDCF)),
                )
              ),
              width: screenWidth,
              height: height1 / 15,
              padding: EdgeInsets.only(left: screenWidth / 28, top: height1 / 50),
              child: Text("Məhsulların siyahısı",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 24,
                      ),
                      color: Colors.black)),
            ),
            ListView.separated(
                primary: false,
                shrinkWrap: true,
                clipBehavior: Clip.antiAlias,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                      width: screenWidth,
                      height: 2.0,
                      color: Color(0xFFCDCDCF),
                    ),
                itemCount: order.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderProductItem(order.items[index].name, order.items[index].price, order.items[index].quantity, order.items[index].image, );
                }),
            Container(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height1 / 50,
                      ),
                      Container(
                        width: screenWidth - screenWidth * .1,
                        child: Row(
                          children: [
                            Text(
                              "Məbləğ",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: screenWidth / 25,
                                  ),
                                  color: Colors.black),
                            ),
                            Expanded(child: Container()),
                            Text(
                              order.total.toString() + " ₼",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: screenWidth / 25,
                                  ),
                                  color: Colors.black),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height1 / 150,
                      ),
                      Container(
                        width: screenWidth - screenWidth * .1,
                        child: Row(
                          children: [
                            Text(
                              "Çatdırılma məbləği",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize:  screenWidth / 25,
                                  ),
                                  color: Colors.black),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "0.00" + " ₼",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: screenWidth / 25,
                                  ),
                                  color: Colors.black),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height1 / 40,
                      ),
                      Container(
                        width: screenWidth - screenWidth * .1,
                        child: Row(
                          children: [
                            Text(
                              "Toplam",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth / 24,
                                  ),
                                  color: Colors.black),
                            ),
                            Expanded(child: Container()),
                            Text(
                              order.total.toString() + " ₼",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth / 25,
                                  ),
                                  color: Colors.black),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height1 / 8,
            )
          ]),
    );
  }


}

class OrderProductItem extends StatelessWidget {
  final String productName;
  final double price;
  final int quantity;
  final String image;
  OrderProductItem(
      this.productName, this.price, this.quantity, this.image );
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Container(
      //width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height:  height1 * .13,
        child: Column(
          children: [
            Container(
              height: height1 * .13,
              width: screenWidth,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: screenWidth / 20, right: screenWidth / 20, top: height1 / 100 ),
                    child: Container(
                      height:  height1 * .1,
                      width: screenWidth / 6,
                      child: Image.network(Config().apiBaseUrl + image),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth * .69,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: height1 / 40),
                                child: Text(
                                  productName,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: screenWidth / 24,
                                      ),
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height1 / 40),
                              child: Text(
                                (price * quantity).toString() + " ₼",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth / 24,
                                    ),
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * .69,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height1 / 80),
                              child: Text(
                                price.toString() + "₼ / Ədəd",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: screenWidth / 28,
                                    ),
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
