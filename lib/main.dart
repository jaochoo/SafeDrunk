import 'ChangeUname.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'get_location.dart';
import 'SettingPage.dart';
import 'history.dart';
import 'AboutUs.dart';

String user_name = "Rathapol";

void main() {
  runApp(
    MaterialApp(routes: {
      "/AboutUs": (context) => AboutUs(),
    }, debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(user_name)),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                  color: Colors.white,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        MaterialPageRoute get_location = MaterialPageRoute(
                            builder: (BuildContext buildcontext) {
                          return SelectLocation();
                        });
                        Navigator.of(context)
                            .push(get_location)
                            .then((value) => {
                                  setState(() {
                                    print("set state work");
                                  })
                                });
                      },
                      child: const Text('I am drunk'),
                    ),
                  )),
              Container(
                child: History(),
              ),
              Container(
                child: StettingPage(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(title: Text("Home"), icon: Icon(Icons.home)),
              BottomNavyBarItem(
                  title: Text("History"), icon: Icon(Icons.article_rounded)),
              BottomNavyBarItem(
                  title: Text("More"), icon: Icon(Icons.more_horiz)),
            ]),
      ),
    );
  }
}
