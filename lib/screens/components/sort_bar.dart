import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/components/radio_item.dart';
import 'package:provider/provider.dart';

import '../../models/radio_model.dart';
import '../../state_datas/store/state_data_sorting.dart';

class SortBar extends StatelessWidget {
  final BuildContext context;
  final int productsCount;
  const SortBar({required this.context, required this.productsCount});
  @override
  Widget build(BuildContext context) {
    List<RadioModel> sampleData = [];
    var selectedButton = Provider.of<StateDataSorting>(context).sortByString;
    sampleData.add(RadioModel(selectedButton == "priceHighToLow" ? true : false, 'A', 'Bahadan ucuza'));
    sampleData.add(RadioModel(selectedButton == "priceLowToHigh" ? true : false, 'B', 'Ucuzdan bahaya'));
    Function sortFunction = Provider.of<StateDataSorting>(context).sortBy;
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 17.4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(productsCount.toString() + " məhsul",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                    ),
                    color: Colors.black)),
          ),
          Expanded(child: Container()),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xFFEA0029))),
            onPressed: () {
              displayBottomSheet(context, sampleData, sortFunction);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    "assets/buttons/sort.png",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Text("Sırala",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width / 29,
                        ),
                        color: Colors.red))
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 17.4,
          ),
        ],
      ),
    );
  }

  void displayBottomSheet(BuildContext context, sampleData, sortFunction) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (ctx) {
          return Container(
              color: Color(0xFFFFF9F3),
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 1.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text("Sırala",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width / 20,
                                ),
                                color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 2.55,
                      child: ListView.builder(
                        itemCount: sampleData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            //highlightColor: Colors.red,
                            splashColor: Colors.redAccent,
                            onTap: () {
                              sampleData.forEach(
                                      (element) => element.isSelected = false);
                              sampleData[index].isSelected = true;

                              if( index == 0 )
                                {
                                  sortFunction('priceHighToLow');
                                }
                              else
                                {
                                  sortFunction('priceLowToHigh');
                                }

                              Navigator.pop(context);
                            },
                            child: RadioItem(sampleData[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

}