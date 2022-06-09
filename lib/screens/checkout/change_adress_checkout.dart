import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/address_model.dart';
import 'package:kingsmart_online_app/models/profile_model.dart';
import 'package:kingsmart_online_app/screens/checkout/add_address_checkout.dart';
import 'package:kingsmart_online_app/screens/checkout/address_selection.dart';
import 'package:kingsmart_online_app/services/account/address_service.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../Color.dart';
import '../components/header_addresses.dart';
import '../components/header_checkout_change_adress.dart';

class ChangeAddressCheckoutFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<AddressModel>>.value(
      value: AddressService.getAddresses(),
      initialData: [AddressModel(id: 0, content: '', postal: '', note: '', selected: false)],
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
    List<AddressModel> addresses = Provider.of<List<AddressModel>>(context);
    var showWidget;
    if( addresses.isEmpty ){
      showWidget = ChangeAddresses();
    }
    if( addresses.isNotEmpty && addresses[0].id == 0 ){
      showWidget = shimmer(screenWidth, height1);
    }
    if( addresses.isNotEmpty && addresses[0].id > 0 ){
      showWidget = ChangeAddresses();
    }
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            height: height1 / 12,
            color: CustomColors().kingsRed,
            child: HeaderCheckoutChangeAddress( title: "Ünvanlarım", backToAddressSelection: true, ),
          ),
          showWidget,
          BottomPart(),
        ],
      ),
    )
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
        ],
      ),
    );
  }
}

class ChangeAddresses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    List<AddressModel> addresses = Provider.of<List<AddressModel>>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: addresses.length,
              itemBuilder: (BuildContext context, int index) {
                return  GestureDetector(
                  onTap: () {
                    for( var i = 0 ; i < addresses.length; i++){
                      addresses[i].changeSelectedStatus(false);
                    }
                    addresses[index].changeSelectedStatus(true);

                  },
                  child: ChangeNotifierProvider<AddressModel>.value(
                    value: addresses[index],
                    child: AddressListItem( ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute( builder: (_) => AddAddressCheckout(addressModel: AddressModel(id: 0, content: '', postal: '', note: '', selected: false)) ));
              },
              child: Padding(
                padding: EdgeInsets.only(left: screenWidth / 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.red,
                      size: screenWidth / 24.43,
                    ),
                    Text(
                      'Yeni ünvan əlavə et',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: screenWidth / 26.43,
                              fontWeight: FontWeight.w400
                          ),
                          color: Colors.red),
                    ),
                    SizedBox(height: height1 / 10,)
                  ]
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class AddressListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AddressModel addressModel = Provider.of<AddressModel>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Container(
      width: screenWidth,
      height: height1 * .09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: addressModel.selected ? Colors.red : Colors.white,
              spreadRadius: 1),
        ],
      ),
      margin: EdgeInsets.all( screenWidth / 20 ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.all( screenWidth / 25 ),
            child:  Container(
              height: screenWidth / 20,
              width: screenWidth / 20,
              child:  Center(
                child: addressModel.selected
                    ? Icon(
                  Icons.done,
                  color: Colors.white,
                  size: screenWidth / 25,
                )
                    : Container(),
              ),
              decoration:  BoxDecoration(
                color: addressModel.selected
                    ? Color(0xFFEA0029)
                    : Colors.transparent,
                border: Border.all(
                    width: 1.0,
                    color: addressModel.selected
                        ? Color(0xFFEA0029)
                        : Colors.grey),
                borderRadius:
                BorderRadius.all(Radius.circular(60.0)),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:  EdgeInsets.only(left: screenWidth / 40, top: height1 / 80),
                child:  Text("Bakı",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 26,
                        ),
                        color: Colors.black)),
              ),
              Container(
                margin:  EdgeInsets.only(left: screenWidth / 40, bottom: height1 / 80),
                child:  Text(
                    addressModel.content.length > 30
                        ?
                    addressModel.content.substring(0, 30) + "..."
                        :
                    addressModel.content,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 27,
                        ),
                        color: Colors.black)),
              ),
            ],
          )
        ],
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
    List<AddressModel> addresses = Provider.of<List<AddressModel>>(context);
    print(addresses.length);
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
        child: Padding(
          padding: EdgeInsets.only(left: screenWidth / 10, right: screenWidth / 10 , top: height1 / 50, bottom: height1 / 50),
          child: Container(
            height: height1 / 13.5,
            width: screenWidth / 2.5,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.red,
              child: Text("Yadda saxla",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 27,
                      ),
                      color: Colors.white)),
              onPressed: () async {
                int selectedAddressId = 0;
                for( int i = 0; i < addresses.length; i ++ )
                  {
                    if( addresses[i].selected )
                      {
                        selectedAddressId = addresses[i].id;
                      }
                  }

                if( ! (selectedAddressId > 0) ){
                  FocusManager.instance.primaryFocus?.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Zəhmət olmasa ünvan seçin və ya yenisini əlavə edin', style: TextStyle(
                        color: Colors.red
                      ),), backgroundColor: Color(0xFFFFCDCDCD)),
                    );

                }
                else
                  {
                    var selectedAddressUpdated = await AddressService.setSelectedAddress( selectedAddressId );
                    if( selectedAddressUpdated )
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute( builder: (_) => AddressSelection()));
                      }

                  }

              },
            ),
          ),
        ),
        //color: Colors.red,
      ),
    );
  }
}
