import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kingsmart_online_app/models/order_model.dart';
import 'package:kingsmart_online_app/screens/account/order_details.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/login/start.dart';
import 'package:kingsmart_online_app/services/checkout/order_service.dart';
import 'package:kingsmart_online_app/state_datas/account/state_data_orders_by_date.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Color.dart';


class OrderHistoryListCNP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateDataOrdersByDate>.value(
        value: StateDataOrdersByDate(), child: OrderHistoryListFP()
    );
  }
}

class OrderHistoryListFP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dateFrom  = Provider.of<StateDataOrdersByDate>(context).dateFrom;
    String dateTo  = Provider.of<StateDataOrdersByDate>(context).dateTo;

    if( dateFrom == '' || dateTo == '')
      {
        var to = DateTime.now();
        var from = DateTime(to.year, to.month - 1, to.day);
        var formatter = DateFormat('yyyy-MM-dd');
        dateFrom = formatter.format(from);
        dateTo = formatter.format(to);
      }

    return FutureProvider<List<OrderModel>>.value(
      value: OrderService.getOrdersByDateRange(dateFrom, dateTo),
      initialData: [],
      child: Body( dateFromPlaceHolder: dateFrom, dateToPlaceHolder: dateTo ),
    );
  }
}

class Body extends StatelessWidget {
   String dateFromPlaceHolder;
   String dateToPlaceHolder;
  Body({ required this.dateFromPlaceHolder, required this.dateToPlaceHolder });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    String dateFrom  = Provider.of<StateDataOrdersByDate>(context).dateFrom;
    String dateTo  = Provider.of<StateDataOrdersByDate>(context).dateTo;

    StateDataOrdersByDate datesStateData = Provider.of<StateDataOrdersByDate>(context);
    List<OrderModel> orders = Provider.of<List<OrderModel>>(context);
    dateFromPlaceHolder = dateTo == '' || dateFrom == '' ? dateFromPlaceHolder : dateFrom;
    dateToPlaceHolder = dateTo == '' || dateFrom == '' ? dateToPlaceHolder : dateTo;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:
          [
            Container(
              height: height1 / 12,
              color: CustomColors().kingsRed,
              child: HeaderWithBack(title: "Sifarişlər"),
            ),
            Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: height1 / 9,
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {
                showDateRangePicker(
                    context: context,
                    firstDate: DateTime( DateTime.now().year, DateTime.now().month - 1, DateTime.now().day ),
                    lastDate: DateTime.now())
                    .then((dateRange) {
                        if( dateRange != null )
                          {
                            var formatter = DateFormat('yyyy-MM-dd');
                            var dateFrom = formatter.format(dateRange.start);
                            datesStateData.setFromDate( dateFrom );
                            var dateTo = formatter.format(dateRange.end);
                            datesStateData.setToDate( dateTo );
                          }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all( screenWidth / 42),
                          child: Text("Tarixdən",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: screenWidth / 28,
                                  ),
                                  color: Colors.black)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.red,
                            ),
                            // child: Image.asset(
                            //     "assets/layers/calendar.png")),
                            Padding(
                              padding: EdgeInsets.only( left: screenWidth / 52 ),
                              child: Text(dateFromPlaceHolder,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 28,
                                      ),
                                      color: Colors.grey)),
                            ),
                            Padding(
                              padding: EdgeInsets.only( left: screenWidth / 52 ),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      splashColor: Colors.redAccent,
                      onTap: () {
                        showDateRangePicker(
                            context: context,
                            firstDate: DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
                            lastDate: DateTime.now())
                            .then((dateRange) {
                                if( dateRange != null )
                                {
                                  var formatter = DateFormat('yyyy-MM-dd');
                                  var dateFrom = formatter.format(dateRange.start);
                                  datesStateData.setFromDate( dateFrom );
                                  var dateTo = formatter.format(dateRange.end);
                                  datesStateData.setToDate( dateTo );
                                }

                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth / 42),
                            child: Text("Tarixə",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 28,
                                    ),
                                    color: Colors.black)),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.red,
                              ),
                              Padding(

                                padding: EdgeInsets.only( left: screenWidth / 52 ),
                                child: Text(dateToPlaceHolder,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: screenWidth / 28,
                                        ),
                                        color: Colors.grey)),
                              ),
                              Padding(
                                padding: EdgeInsets.only( left: screenWidth / 52 ),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            orders.isNotEmpty
                ?
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: orders.length,
                  clipBehavior: Clip.antiAlias,
                  itemBuilder: (context, index) {
                    return orderHistoryItem(context, orders[index].id, orders[index].orderNumber, orders[index].status, orders[index].createdAt);
                  },
                ),
                  ],
                ),
              ),
            )
                :
                emptyOrders(context)

          ]
        ),
      ),
    );

  }
}

Widget orderHistoryItem( context, orderId,  orderNum, orderStatus, orderDate ){
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
      Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetailsFP(orderId: orderId)));
    },
    child: Padding(
        padding: EdgeInsets.only( left: screenWidth / 20, right: screenWidth / 20, top: height1 / 30 ),
        child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderNum,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 28,
                        ),
                        color: Colors.black)),
                SizedBox( height: height1 / 120, ),
                Text(orderStatus,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 32,
                        ),
                        color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
              children: [
                Text(orderDate,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 32,
                        ),
                        color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.only( left: screenWidth / 102 ),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ],
          ),
          )
      ],
    ),
    ),
  );
}

Widget emptyOrders( context ){
  double screenWidth = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).viewPadding;
  double height1 = height - padding.top - kToolbarHeight;
  return Center(
    child: Column(
      children: [
      SizedBox(
      height: height1 / 5,
    ),
      SizedBox(
        width: screenWidth / 3,
        height: screenWidth / 3,
        child: Image.asset("assets/layers/clock.png"),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Bu aralıqda sifariş qeydə alınmayıb",
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 27,
                ),
                color: Colors.grey)),
      ),
    ]
    ),
  );
}