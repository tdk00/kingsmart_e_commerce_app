import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/address_model.dart';
import 'package:kingsmart_online_app/screens/account/account_main.dart';
import 'package:kingsmart_online_app/screens/components/shopping_cart_item_count_dot.dart';
import 'package:kingsmart_online_app/screens/main/snake_navigation.dart';
import 'package:kingsmart_online_app/services/account/address_service.dart';
import 'package:provider/provider.dart';

import '../account/add_adress.dart';
import '../account/address.dart';

class HeaderAddresses extends StatelessWidget {
  final String title;
  final bool? showShoppingCartIcon;
  final bool? showDeleteIcon;
  final bool? showAddIcon;
  final int? deleteId;
  final bool? backToAccountMain;
  const HeaderAddresses({Key? key, required this.title, this.showShoppingCartIcon, this.showDeleteIcon, this.showAddIcon, this.deleteId, this.backToAccountMain }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SizedBox(
      height: height1 / 8,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: screenWidth / 15.43, right: screenWidth / 15.43,),
              child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Icon( Icons.arrow_back_ios, color: Colors.white, size: screenWidth / 20.43 ),
                          ),
                          onPressed: () {
                            if( backToAccountMain == true )
                              {
                                Navigator.pop(context);
                              }
                            else
                              {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AddressFuture()));
                              }

                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(title,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 20.43,
                              ),
                              color: Colors.white),),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: showAddIcon != false
                              ?
                          TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 23,
                            ),
                            onPressed: () {
                              AddressModel addressModel = AddressModel(id: 0, content: "", postal: "", note: "", selected: false);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) =>
                                      ChangeNotifierProvider<AddressModel>.value(
                                        value: addressModel,
                                        child: AddAddressFuture( addressModel: addressModel , adressId: 0, isEdit: false ),
                                      )
                                  )
                              );
                            },
                          )
                              :
                              SizedBox(),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: showShoppingCartIcon != false ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.white,
                                size: 23,
                              ),
                                BuildDot()
                              ]
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/shoppingCartScreen");
                            },
                          ),
                        )
                            :
                        showDeleteIcon == true
                            ?
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 23,
                            ),
                            onPressed: () async {
                              await AddressService.deleteAddress( deleteId );
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AddressFuture()));
                            },
                          ),
                        )
                            :
                        SizedBox()
                    ),
                  ]),
            ),
          ]),
    );
  }
}