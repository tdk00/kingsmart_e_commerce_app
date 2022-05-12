import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/screens/login/login_type_mobile.dart';

import '../../Color.dart';


class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/launch_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.57),
              child: Image.asset("assets/images/logo.png"),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.19,
                height: MediaQuery.of(context).size.height / 15.56,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.7171),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width /
                                  15.59),
                          child: Text(
                            "KƏŞF ETMƏYƏ BAŞLA",
                            style: TextStyle(color: CustomColors().kingsRed),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width /
                                  15.59),
                          child: Icon(
                            Icons.arrow_forward,
                            color: CustomColors().kingsRed,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (_) => LoginTypeMobile()), (route) => false);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}