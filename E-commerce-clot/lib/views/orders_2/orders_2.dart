import 'dart:math';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_training/homePage1.dart';
import 'package:project_training/profileScreen.dart';
import 'package:project_training/views/track_order/track_order.dart';

class Orders2 extends StatefulWidget {
  const Orders2({super.key});

  @override
  State<Orders2> createState() => _Orders2State();
}

class _Orders2State extends State<Orders2> {
  int _selectedIndex = 1; // Default to Orders tab
  static const int pageSize = 5;

  final Random _random = Random();
  List<int> ordersNumber = List.generate(30, (index) => index);
  final PagingController<int, Map<String, dynamic>> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(
      (pageKey) => _loadMoreItems(pageKey),
    );
  }

  void _loadMoreItems(int pageKey) {
    if (pageKey >= ordersNumber.length) return;

    final endIndex = (pageKey + pageSize).clamp(0, ordersNumber.length);
    final newItems = ordersNumber
        .sublist(pageKey, endIndex)
        .map((e) => {'id': _random.nextInt(1000) + 1})
        .toList();

    if (endIndex == ordersNumber.length) {
      _pagingController.appendLastPage(newItems);
    } else {
      _pagingController.appendPage(newItems, endIndex);
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage1()),
    );
  }

  Widget _buildOrdersScreen() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: PagedListView<int, Map<String, dynamic>>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Map<String, dynamic>>(
          itemBuilder: (context, item, index) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackOrder(
                        order_number: item["id"].toString(),
                      ),
                    ),
                  );
                },
                leading: Container(
                  width: MediaQuery.of(context).size.height * 0.050,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/order-27.png"),
                    ),
                  ),
                ),
                trailing: const Icon(
                  Icons.navigate_next_rounded,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text('Order #${item["id"]}'),
                titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 20,
                ),
                subtitle: const Text('4 items'),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Placeholder(), // Placeholder for Home (not used in IndexedStack)
      _buildOrdersScreen(),
      const mainScreen(),
    ];

    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     if (index == 0) {
      //       _navigateToHome(); // Navigate to Home and remove BottomNavigationBar
      //     } else {
      //       setState(() {
      //         _selectedIndex = index; // Switch between Orders and Profile
      //       });
      //     }
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   selectedItemColor: const Color.fromRGBO(142, 108, 239, 1),
      //   unselectedItemColor: Colors.grey,
      // ),
      
      body: IndexedStack(
        index: _selectedIndex - 1,
        children: screens.sublist(1), // Only include Orders and Profile
      ),
    );
  }
}
