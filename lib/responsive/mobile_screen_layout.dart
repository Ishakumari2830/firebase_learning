import 'package:auth/models/user.dart' as model;
import 'package:auth/utils/colors.dart';
import 'package:auth/utils/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';




class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String username = "";
  // @override
  // void initState() {
  //
  //   super.initState();
  //   getUsername();
  // }
  //
  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //
  //   //print(snap.data());
  //   setState(() {
  //     username = (snap.data() as Map<String,dynamic>)['username'];
  //   });
  // }
 int _page = 0;
 late PageController pageController;
 @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }
  void onPagechanged(int page){
   setState(() {
     _page = page;
   });
  }
  @override
  Widget build(BuildContext context) {
    //model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body:PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPagechanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items : [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: _page == 2 ? primaryColor : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: _page == 3 ? primaryColor : secondaryColor,
          ),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _page == 4 ? primaryColor : secondaryColor,
          ),
          label: "",

          backgroundColor: primaryColor,
        ),
      ],
      onTap: navigationTapped,),

    );
  }
}
