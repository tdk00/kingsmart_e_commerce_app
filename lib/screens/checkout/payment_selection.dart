import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 35.0),
          child: Text("Onlayn ödəmə",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 26,
                  ),
                  color: Colors.black)),
        ),
        Padding(
            padding:
            const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async {

              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Debet kart ilə ödəmə",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 26,
                              ),
                              color: Colors.black)),
                      Container(
                          width: 30,
                          child: Image.asset("assets/buttons/arrow.png"))
                    ],
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 35.0),
          child: Text("Nağd ödəmə",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 26,
                  ),
                  color: Colors.black)),
        ),
        Padding(
            padding:
            const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async{
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sifarişi aldıqdan sonra ödəmə",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 26,
                              ),
                              color: Colors.black)),
                      Container(
                          width: 30,
                          child: Image.asset("assets/buttons/arrow.png"))
                    ],
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 35.0),
          child: Text("Bonus ilə ödəmə",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 26,
                  ),
                  color: Colors.black)),
        ),
        Padding(
            padding:
            const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: OutlinedButton(
              onPressed: () async{

              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Topadığınız keşbeklə ödəmə",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 26,
                              ),
                              color: Colors.black)),
                      Container(
                          width: 30,
                          child: Image.asset("assets/buttons/arrow.png"))
                    ],
                  ),
                ),
              ),
            )),

      ],
    );
  }
}
