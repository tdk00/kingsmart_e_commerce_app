import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/screens/components/add_to_cart_widget.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/components/related_products.dart';
import 'package:kingsmart_online_app/services/favorite_products_service.dart';
import 'package:kingsmart_online_app/services/product_service.dart';
import 'package:provider/provider.dart';

import '../../Color.dart';
import '../../models/product_model.dart';
import '../../models/promo_products_model.dart';
import '../../models/shopping_cart_model.dart';
import '../../helpers/config.dart';
import '../../services/promos_service.dart';

class ProductDetails extends StatelessWidget {
  ProductModel productModel;

  ProductDetails({Key? key, required this.productModel}) : super(key: key);

  Widget build(BuildContext context) {
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    ProductModel productModel = Provider.of<ProductModel>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return MultiProvider(
      providers: [
        FutureProvider<FavoriteProductsModel>(
            create: (context) => FavoriteProductsService.getFavoriteProducts(6),
            initialData: FavoriteProductsModel()),
        FutureProvider<PromoProductsModel>(
            create: (context) => PromosService.getPromoProducts(6),
            initialData: PromoProductsModel()),
      ],
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: [
                SizedBox(
                  height: height1 / 10,
                  child: Container(
                    color: CustomColors().kingsRed,
                    child: HeaderWithBack(title: ''),
                  ),
                ),
                SizedBox(
                  height: height1 / 50,
                ),
                SizedBox(
                  height: height1 / 2.3,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: screenWidth / 12.34, right: screenWidth / 12.34),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: SizedBox(),

                        ),
                        Expanded(
                            flex: 9,
                            child: ChangeNotifierProvider<ProductModel>.value(
                              value: productModel,
                              child: ToggleFavoriteWidget(),
                            )
                        ),
                        Expanded(
                          flex: 45,
                          child: Image(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                              Config().apiBaseUrl.toString() +
                                  productModel.image.toString(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Row(children: [
                            Container(
                              width: screenWidth / 2.43,
                              padding: EdgeInsets.only(left: screenWidth / 20),
                              alignment: Alignment.topLeft,
                              child: Text(
                                productModel.title,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 26.43,
                                    ),
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth / 3.23,
                            ),
                            EditNoteWidget( productModel: productModel, )
                          ]),
                        ),
                        Expanded(
                          flex: 10,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  productModel.price.toString() + "₼",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontSize: screenWidth / 26.43,
                                      ),
                                      color: Colors.red),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: screenWidth / 10.43,
                                ),
                              ),
                              productModel.oldPrice > productModel.price
                                  ? Expanded(
                                      flex: 1,
                                      child: Text(
                                        productModel.oldPrice.toString() + "₼",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: screenWidth / 26.43,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                            color: Colors.grey),
                                      ),
                                    )
                                  : Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: screenWidth / 10.43,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        productModel.isOnlineMarket ?
                        Expanded(
                            flex: 12,
                            child: ChangeNotifierProvider.value(
                                value: shoppingCart,
                                child: Container(
                                    width: screenWidth / 1.4,
                                    child: AddToCartWidget(
                                      productModel: productModel,
                                      shoppingCartView: false,
                                    )))) : Container(),
                        Expanded(flex: 5, child: SizedBox())
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height1 / 44,
                ),
                productModel.summary.isNotEmpty ?
                SizedBox(
                  height: height1 / 7,
                  child: Container(
                    width: screenWidth,
                    margin: EdgeInsets.only(
                        left: screenWidth / 12.34, right: screenWidth / 12.34),
                    padding: EdgeInsets.all(screenWidth / 32.34),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10) ),
                    ),
                    child: Text(
                      productModel.summary,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 29.43,
                          ),
                          color: Colors.black),
                    ),
                  ),
                )
               :
               SizedBox(),
               Container(
                 margin: EdgeInsets.only(
                     left: screenWidth / 22.34, right: screenWidth / 22.34),
                  height: height1 / 2,
                  child: RelatedProducts( productModel: productModel, ),
                ),
              ]),
            )
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleFavoriteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductModel productModelProvider = Provider.of<ProductModel>(context);
    FavoriteProductsModel favoriteProductsModel =
        Provider.of<FavoriteProductsModel>(context);
    PromoProductsModel promoProductsModel =
        Provider.of<PromoProductsModel>(context);
    return InkWell(
      onTap: () async {
        var isFavorite = productModelProvider.isFavorite;
        isFavorite = await FavoriteProductsService.toggleFavoriteStatus(
            productModelProvider.id, !isFavorite);

        productModelProvider.toggleIsFavorite(isFavorite);

        favoriteProductsModel.toggleIsFavorite(
            isFavorite, productModelProvider);
        promoProductsModel.toggleIsFavorite(isFavorite, productModelProvider);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Icon(
          productModelProvider.isFavorite == true
              ? Icons.favorite
              : Icons.favorite_border,
          color: productModelProvider.isFavorite == true
              ? Colors.red
              : Colors.grey,
          size: 25,
        ),
      ),
    );
  }
}

class EditNoteWidget extends StatelessWidget {
  final ProductModel productModel;
  EditNoteWidget( { required this.productModel } );
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
        Navigator.push(context,  MaterialPageRoute(builder: (_) => EditNoteModal( productModel: productModel, )));
      },
      child: Container(
        width: screenWidth / 10,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/buttons/addDetail.png"),
              fit: BoxFit.none,
              scale: 1.5,
              colorFilter: productModel.note.isNotEmpty
                  ? const ColorFilter.mode(Colors.red, BlendMode.srcATop)
                  : const ColorFilter.mode(Colors.grey, BlendMode.srcATop)),
        ),
      ),
    );
  }
}

class EditNoteModal extends StatefulWidget {
  final ProductModel productModel;
  const EditNoteModal( {Key? key,  required this.productModel } ) : super(key: key);

  @override
  State<EditNoteModal> createState() => _EditNoteModalState();
}

class _EditNoteModalState extends State<EditNoteModal> {
  late TextEditingController noteController = TextEditingController(text: widget.productModel.note);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container( height: height1 / 15 ,color: CustomColors().kingsRed , child: HeaderWithBack(title: widget.productModel.note.isNotEmpty ? "Redaktə et " : "Qeyd əlavə et", showShoppingCartIcon: false,), ),

            SizedBox(
              height: height1 / 50,
            ),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: height1 / 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular( screenWidth / 51.5),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: noteController,
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: height1 / 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth / 51.5),
                  ),
                  width: screenWidth,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    color: Colors.red,
                    child: Text("YADDA SAXLA",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 25,
                            ),
                            color: Colors.white)),
                    onPressed: () async {
                      var productNote = await ProductService.addNote(widget.productModel.id, noteController.text);

                      widget.productModel.updateNote( productNote );

                        FocusScope.of(context).unfocus();

                       Navigator.pop(context);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
