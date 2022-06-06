import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:kingsmart_online_app/screens/account/account_main.dart';
import 'package:kingsmart_online_app/screens/main/main_screen/main_screeen.dart';
import 'package:kingsmart_online_app/services/shopping_cart_service.dart';
import 'package:provider/provider.dart';
import '../store/store_screen.dart';

int _selectedItemPosition = 0;

class SnakeNavigation extends StatefulWidget {
  @override
  _SnakeNavigationState createState() => _SnakeNavigationState();
}

class _SnakeNavigationState extends State<SnakeNavigation> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color kingsRed = CustomColors().kingsRed;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F3),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Container(
        color: Color(0xFFFFF9F3),
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page ) async {
            ShoppingCartService.updateShoppingCart( shoppingCart );
            List itemPositions = [0, 1, 2, 3];
            if (itemPositions.contains(page)) {
              setState(() {
                _selectedItemPosition = page;
              });
            }
          },
          children: <Widget>[
            MainScreen(),
            StoreScreen(),
            Container(
              color: Colors.green,
              width: 100,
            ),
            AccountMain()
          ],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 5),
        snakeViewColor: Colors.transparent,
        selectedItemColor: Colors.red,
        unselectedItemColor: null,

        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() {
            _selectedItemPosition = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/buttons/mainButton.png",
                color: Color(0xFFCDCDCF),
              ),
              activeIcon: Image.asset("assets/buttons/mainButton.png"),
              label: 'Əsas Səhifə'),
          BottomNavigationBarItem(
              icon: Image.asset("assets/buttons/storeButton.png"),
              activeIcon: Image.asset(
                "assets/buttons/storeButton.png",
                color: kingsRed,
              ),
              label: 'Market'),
          BottomNavigationBarItem(
              icon: Image.asset("assets/buttons/promoButton.png"),
              activeIcon: Image.asset(
                "assets/buttons/promoButton.png",
                color: kingsRed,
              ),
              label: 'Promolar'),
          BottomNavigationBarItem(
              icon: Image.asset("assets/buttons/profileButton.png"),
              activeIcon: Image.asset(
                "assets/buttons/profileButton.png",
                color: kingsRed,
              ),
              label: 'Profil'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
