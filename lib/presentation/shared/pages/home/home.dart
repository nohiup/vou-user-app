import 'package:flutter/material.dart';
import 'package:vou_user/presentation/event/pages/event.dart';
import 'package:vou_user/presentation/profile/pages/profile.dart';
import 'package:vou_user/presentation/profile/stores/profile_store.dart';
import 'package:vou_user/presentation/shared/widgets/nav_bar/nav_bar.dart';
import 'package:vou_user/presentation/voucher/pages/voucher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _index  = 0;
  final List<String> _title = [
    'Event',
    'Search',
    'Voucher',
    'Profile'
  ];
  final List<Widget?> _pages = [
    const EventPage(),
    const EventPage(),
    const VoucherPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Text(_title[_index]),
      ),
      body: _pages[_index],
      bottomNavigationBar: NavBar(
          currentIndex: _index,
          onTap: _onTabSelected)
    );
  }

  //General med:----------------------------------------------------------------
  void _onTabSelected(int index){
    setState(() {
      _index = index;
    });
  }
}
