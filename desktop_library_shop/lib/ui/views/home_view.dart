import 'package:desktop_library_shop/core/services/book_dao.dart';
import 'package:desktop_library_shop/core/viewmodels/home_bo.dart';
import 'package:desktop_library_shop/locator.dart';
import 'package:desktop_library_shop/ui/util/ui_util.dart';
import 'package:desktop_library_shop/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 40.0, left: 15.0, bottom: 15, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DashboardCard(
                        headerColor: const Color(0xFF4C602A),
                        bodyColor: const Color(0xFFFFF7D7),
                        title: 'BOOKS',
                        imageUrl: 'assets/images/library_logo.png',
                        dataCount1: TotalBooks(),
                        dataTitle1: 'BOOKS',
                        dataCount2: BooksCopies(),
                        dataTitle2: 'COPIES'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF007F7F),
                        bodyColor: const Color(0xFFEFFFFF),
                        title: 'CIRCULATION',
                        imageUrl: 'assets/images/icons/circulation.png',
                        dataCount1: ActiveBooksIssued(),
                        dataTitle1: 'ACTIVE ISSUES',
                        dataCount2: BooksIssuedSoFar(),
                        dataTitle2: 'ISSUES SO FAR'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF00751E),
                        bodyColor: const Color(0xFFE3FFE3),
                        title: 'TODAY',
                        imageUrl: 'assets/images/icons/today.png',
                        dataCount1: BooksIssuedToday(),
                        dataTitle1: 'ISSUED TODAY',
                        dataCount2: BooksReturned(),
                        dataTitle2: 'GOT RETURNED'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF001D74),
                        bodyColor: const Color(0xFFD8E4C3),
                        title: 'DUE RETURN',
                        imageUrl: 'assets/images/icons/due_return.png',
                        dataCount1: BooksDelayInReturn(),
                        dataTitle1: 'DELAY RETURN',
                        dataCount2: BooksDueReturn(),
                        dataTitle2: 'IN TOTAL'),
                  ],
                )),
            UIUtil.vMediumSpace(),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DashboardCard(
                        headerColor: const Color(0xFF4C602A),
                        bodyColor: const Color(0xFFFFF7D7),
                        title: 'CONDITION',
                        imageUrl: 'assets/images/icons/condition.png',
                        dataCount1: BooksAsNew(),
                        dataTitle1: 'AS NEW',
                        dataCount2: UseableBooks(),
                        dataTitle2: 'ARE USEABLE'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF007F7F),
                        bodyColor: const Color(0xFFEFFFFF),
                        title: 'RETIRE',
                        imageUrl: 'assets/images/icons/retire.png',
                        dataCount1: BooksToDiscard(),
                        dataTitle1: 'TO DISCARD',
                        dataCount2: PoorBooks(),
                        dataTitle2: 'POOR'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF00751E),
                        bodyColor: const Color(0xFFE3FFE3),
                        title: 'RACKS',
                        imageUrl: 'assets/images/icons/racks.png',
                        dataCount1: BooksInSingleRack(),
                        dataTitle1: 'RACK WITH',
                        dataCount2: BooksCapacity(),
                        dataTitle2: 'CAPACITY'),
                    UIUtil.hSmallSpace(),
                    DashboardCard(
                        headerColor: const Color(0xFF001D74),
                        bodyColor: const Color(0xFFD8E4C3),
                        title: 'BENEFICIARIES',
                        imageUrl: 'assets/images/icons/beneficiaries.png',
                        dataCount1: TotalStudents(),
                        dataTitle1: 'STUDENTS',
                        dataCount2: TotalStaffs(),
                        dataTitle2: 'STAFFS'),
                  ],
                ))
          ],
        ));
  }
}

class DashboardCard extends StatelessWidget {
  final Color headerColor;
  final Color bodyColor;
  final String title;
  final String imageUrl;
  final Widget dataCount1;
  final String dataTitle1;
  final Widget dataCount2;
  final String dataTitle2;

  DashboardCard({
    Key? key,
    required this.headerColor,
    required this.bodyColor,
    required this.title,
    required this.imageUrl,
    required this.dataCount1,
    required this.dataTitle1,
    required this.dataCount2,
    required this.dataTitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            color: headerColor, //Color(0xAA4C602A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 8,
              child: Container(
                color: bodyColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        imageUrl,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        dataCount1,
                        // Text(
                        //   dataCount1,
                        //   style: Theme.of(context).textTheme.headline4,
                        // ),
                        Text(
                          dataTitle1,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        UIUtil.vXSmallSpace(),
                        dataCount2,
                        // Text(
                        //   dataCount2,
                        //   style: Theme.of(context).textTheme.headline4,
                        // ),
                        Text(
                          dataTitle2,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class TotalBooks extends StatefulWidget {
  TotalBooks({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _TotalBooksState createState() => _TotalBooksState();
}

class _TotalBooksState extends State<TotalBooks> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getAll();
      setState(() {
        widget.initData = data.length;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().totalBooks.close();
    print(
        'stream is disposed ${loc<BookDao>().totalBooks.isClosed} -- ${loc<BookDao>().totalBooks.isPaused}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('init data ${widget.initData}');
    //return SizedBox();
    if (loc<BookDao>().totalBooks.isClosed) {
      print('condition is true');
      loc<BookDao>().totalBooks.close();
    }
    return StreamProvider<int>(
      create: (BuildContext context) => loc<BookDao>().totalBooks.stream,
      initialData: widget.initData,
      builder: (context, _) => (widget.initData == -1)
          ? CircularProgressIndicator()
          : Column(
              children: [
                Text('${Provider.of<int>(context)}'),
              ],
            ),
    );
  }
}

class BooksCopies extends StatefulWidget {
  BooksCopies({Key? key}) : super(key: key);
  int initData = -1;

  @override
  _BooksCopiesState createState() => _BooksCopiesState();
}

class _BooksCopiesState extends State<BooksCopies> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
  //     var data = await loc<BookDao>().getSampleDataCount();
  //     setState(() {
  //       widget.initData = data;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // StreamProvider<int>(
    //   create: (BuildContext context) => loc<BookDao>().totalCopies.stream,
    //   initialData: widget.initData,
    //   builder: (context, _) => (widget.initData == -1)
    //       ? CircularProgressIndicator()
    //       : Column(
    //           children: [
    //             Text('${Provider.of<int>(context)}'),
    //           ],
    //         ),
    // );
  }
}

class ActiveBooksIssued extends StatefulWidget {
  const ActiveBooksIssued({Key? key}) : super(key: key);

  @override
  _ActiveBooksIssuedState createState() => _ActiveBooksIssuedState();
}

class _ActiveBooksIssuedState extends State<ActiveBooksIssued> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksIssuedSoFar extends StatefulWidget {
  const BooksIssuedSoFar({Key? key}) : super(key: key);

  @override
  _BooksIssuedSoFarState createState() => _BooksIssuedSoFarState();
}

class _BooksIssuedSoFarState extends State<BooksIssuedSoFar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksIssuedToday extends StatefulWidget {
  const BooksIssuedToday({Key? key}) : super(key: key);

  @override
  _BooksIssuedTodayState createState() => _BooksIssuedTodayState();
}

class _BooksIssuedTodayState extends State<BooksIssuedToday> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksReturned extends StatefulWidget {
  const BooksReturned({Key? key}) : super(key: key);

  @override
  _BooksReturnedState createState() => _BooksReturnedState();
}

class _BooksReturnedState extends State<BooksReturned> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksDelayInReturn extends StatefulWidget {
  const BooksDelayInReturn({Key? key}) : super(key: key);

  @override
  _BooksDelayInReturnState createState() => _BooksDelayInReturnState();
}

class _BooksDelayInReturnState extends State<BooksDelayInReturn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksDueReturn extends StatefulWidget {
  const BooksDueReturn({Key? key}) : super(key: key);

  @override
  _BooksDueReturnState createState() => _BooksDueReturnState();
}

class _BooksDueReturnState extends State<BooksDueReturn> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksAsNew extends StatefulWidget {
  const BooksAsNew({Key? key}) : super(key: key);

  @override
  _BooksAsNewState createState() => _BooksAsNewState();
}

class _BooksAsNewState extends State<BooksAsNew> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UseableBooks extends StatefulWidget {
  const UseableBooks({Key? key}) : super(key: key);

  @override
  _UseableBooksState createState() => _UseableBooksState();
}

class _UseableBooksState extends State<UseableBooks> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksToDiscard extends StatefulWidget {
  const BooksToDiscard({Key? key}) : super(key: key);

  @override
  _BooksToDiscardState createState() => _BooksToDiscardState();
}

class _BooksToDiscardState extends State<BooksToDiscard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PoorBooks extends StatefulWidget {
  const PoorBooks({Key? key}) : super(key: key);

  @override
  _PoorBooksState createState() => _PoorBooksState();
}

class _PoorBooksState extends State<PoorBooks> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksInSingleRack extends StatefulWidget {
  const BooksInSingleRack({Key? key}) : super(key: key);

  @override
  _BooksInSingleRackState createState() => _BooksInSingleRackState();
}

class _BooksInSingleRackState extends State<BooksInSingleRack> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BooksCapacity extends StatefulWidget {
  const BooksCapacity({Key? key}) : super(key: key);

  @override
  _BooksCapacityState createState() => _BooksCapacityState();
}

class _BooksCapacityState extends State<BooksCapacity> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TotalStudents extends StatefulWidget {
  const TotalStudents({Key? key}) : super(key: key);

  @override
  _TotalStudentsState createState() => _TotalStudentsState();
}

class _TotalStudentsState extends State<TotalStudents> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TotalStaffs extends StatefulWidget {
  const TotalStaffs({Key? key}) : super(key: key);

  @override
  _TotalStaffsState createState() => _TotalStaffsState();
}

class _TotalStaffsState extends State<TotalStaffs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class MyAppDataChild extends StatelessWidget {
//   const MyAppDataChild({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('${Provider.of<int>(context)}'),
//         ElevatedButton(
//             onPressed: () {
//               loc<HomeBo>().saveTest();
//             },
//             child: Text('click me'))
//       ],
//     );
//   }
// }

// import 'package:desktop_library_shop/ui/widgets/app_button.dart';
// import 'package:desktop_library_shop/ui/widgets/app_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   _HomeViewState createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   late FocusNode _homeFocusNode;
//   late FocusNode _bookFocusNode;
//   late FocusNode _studentFocusNode;
//   late FocusNode _userFocusNode;
//   late FocusNode _reportsFocusNode;

//   @override
//   void initState() {
//     // TODO: implement initState
//     _homeFocusNode = FocusNode();
//     _bookFocusNode = FocusNode();
//     _studentFocusNode = FocusNode();
//     _userFocusNode = FocusNode();
//     _reportsFocusNode = FocusNode();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//           body: Container(
//         alignment: Alignment.topCenter,
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TabBar(
//                 padding: EdgeInsets.all(10.0),
//                 indicator: UnderlineTabIndicator(
//                     borderSide: BorderSide(color: Colors.transparent),
//                     insets: EdgeInsets.zero),
//                 tabs: [
//                   Tab(
//                     iconMargin: EdgeInsets.all(0.0),
//                     //    text: 'Books Management',
//                     child: Row(
//                       children: [
//                         Container(
//                           child: AppTextLabel('Books Management'),
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.black),
//                               gradient: LinearGradient(
//                                   begin: const Alignment(0, 0.2),
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     const Color(0xffDDDCD4),
//                                     _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//                                   ])),
//                           height: double.maxFinite,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       height: 20,
//                       color: Colors.amber,
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       height: 20,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ]),
//             // BottomAppBar(
//             //   child: Row(
//             //     children: [
//             //       Container(
//             //         padding: EdgeInsets.all(15.0),
//             //         child: AppTextLabel('Books Management'),
//             //         decoration: BoxDecoration(
//             //             border: Border.all(color: Colors.black),
//             //             gradient: LinearGradient(
//             //                 begin: const Alignment(0, 0.2),
//             //                 end: Alignment.bottomCenter,
//             //                 colors: [
//             //                   const Color(0xffDDDCD4),
//             //                   _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                 ])),
//             //       ),
//             //       Container(
//             //         padding: EdgeInsets.all(15.0),
//             //         child: AppTextLabel('Books Management'),
//             //         decoration: BoxDecoration(
//             //             border: Border.all(color: Colors.black),
//             //             gradient: LinearGradient(
//             //                 begin: const Alignment(0, 0.2),
//             //                 end: Alignment.bottomCenter,
//             //                 colors: [
//             //                   const Color(0xffDDDCD4),
//             //                   _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                 ])),
//             //       ),
//             //       Container(
//             //         padding: EdgeInsets.all(15.0),
//             //         child: AppTextLabel('Books Management'),
//             //         decoration: BoxDecoration(
//             //             border: Border.all(color: Colors.black),
//             //             gradient: LinearGradient(
//             //                 begin: const Alignment(0, 0.2),
//             //                 end: Alignment.bottomCenter,
//             //                 colors: [
//             //                   const Color(0xffDDDCD4),
//             //                   _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                 ])),
//             //       ),
//             //     ],
//             //   ),
//             // ),

//             // BottomNavigationBar(items: [
//             //   BottomNavigationBarItem(
//             //     icon:
//             //     Container(
//             //       child: AppTextLabel('Books Management'),
//             //       decoration: BoxDecoration(
//             //           border: Border.all(color: Colors.black),
//             //           gradient: LinearGradient(
//             //               begin: const Alignment(0, 0.2),
//             //               end: Alignment.bottomCenter,
//             //               colors: [
//             //                 const Color(0xffDDDCD4),
//             //                 _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //               ])),
//             //     ),
//             //     label: '',
//             //   ),
//             //   BottomNavigationBarItem(
//             //       icon: Container(
//             //         child: AppTextLabel('Books Management'),
//             //         decoration: BoxDecoration(
//             //             border: Border.all(color: Colors.black),
//             //             gradient: LinearGradient(
//             //                 begin: const Alignment(0, 0.2),
//             //                 end: Alignment.bottomCenter,
//             //                 colors: [
//             //                   const Color(0xffDDDCD4),
//             //                   _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                 ])),
//             //       ),
//             //       label: ''),
//             //   BottomNavigationBarItem(
//             //       icon: Container(
//             //         child: AppTextLabel('Books Management'),
//             //         decoration: BoxDecoration(
//             //             border: Border.all(color: Colors.black),
//             //             gradient: LinearGradient(
//             //                 begin: const Alignment(0, 0.2),
//             //                 end: Alignment.bottomCenter,
//             //                 colors: [
//             //                   const Color(0xffDDDCD4),
//             //                   _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                 ])),
//             //       ),
//             //       label: '')
//             // ]),
//             // TabBar(
//             //     indicatorSize: TabBarIndicatorSize.label,
//             //     indicator: UnderlineTabIndicator(
//             //         borderSide: BorderSide(color: Colors.black),
//             //         insets: EdgeInsets.only(bottom: 0.0)),
//             //     tabs: [
//             //       Tab(
//             //         child:
//             // Container(
//             //           height: double.maxFinite,
//             //           child: AppTextLabel('Books Management'),
//             //           decoration: BoxDecoration(
//             //               border: Border.all(color: Colors.black),
//             //               gradient: LinearGradient(
//             //                   begin: const Alignment(0, 0.2),
//             //                   end: Alignment.bottomCenter,
//             //                   colors: [
//             //                     const Color(0xffDDDCD4),
//             //                     _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//             //                   ])),
//             //         ),
//             //       ),
//             //       Tab(
//             //         child: Container(
//             //           width: double.maxFinite,
//             //           child: Text('student management'),
//             //           decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//             //         ),
//             //       ),
//             //       Tab(
//             //         child: Container(
//             //           color: Colors.green,
//             //         ),
//             //       ),
//             //     ]),
//             Expanded(
//               flex: 9,
//               child: TabBarView(
//                 children: [
//                   Container(
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                     child: Center(
//                       child: Text("It's cloudy here"),
//                     ),
//                   ),
//                   Container(
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                     child: Center(
//                       child: Text("It's Rainy here"),
//                     ),
//                   ),
//                   Container(
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                     child: Center(
//                       child: Text("It's Sunny here"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )

//           // appBar: AppBar(
//           //   // backgroundColor: Colors.transparent,
//           //   // shadowColor: Colors.transparent,
//           //   bottom:
//           // TabBar(
//           //       indicator: UnderlineTabIndicator(
//           //           borderSide: BorderSide(color: Colors.transparent), insets: EdgeInsets.zero),
//           //       tabs: [
//           //         Tab(
//           //           child: Container(
//           //             child: AppTextLabel('Books Management'),
//           //             decoration: BoxDecoration(
//           //                 border: Border.all(color: Colors.black),
//           //                 gradient: LinearGradient(
//           //                     begin: const Alignment(0, 0.2),
//           //                     end: Alignment.bottomCenter,
//           //                     colors: [
//           //                       const Color(0xffDDDCD4),
//           //                       _adjustBrightness(const Color(0xffDDDCD4), 0.1)
//           //                     ])),
//           //             height: double.maxFinite,
//           //             width: double.maxFinite,
//           //           ),
//           //         ),
//           //         Tab(
//           //           child: Container(
//           //             height: 20,
//           //             color: Colors.amber,
//           //           ),
//           //         ),
//           //         Tab(
//           //           child: Container(
//           //             height: 20,
//           //             color: Colors.green,
//           //           ),
//           //         ),
//           //       ]),
//           // ),
//           // body:
//           // TabBarView(
//           //   children: [
//           //     Container(
//           //       decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//           //       child: Center(
//           //         child: Text("It's cloudy here"),
//           //       ),
//           //     ),
//           //     Center(
//           //       child: Text("It's rainy here"),
//           //     ),
//           //     Center(
//           //       child: Text("It's sunny here"),
//           //     ),
//           //   ],
//           // ),

//           //     Container(
//           //   child: Column(
//           //     children: [
//           //       Row(
//           //         children: [
//           //           AppElevatedBtn(
//           //             focusNode: _homeFocusNode,
//           //             isEnable: true,
//           //             onPressedFn: () {
//           //               _homeFocusNode.unfocus();
//           //               FocusScope.of(context).requestFocus(_bookFocusNode);
//           //             },
//           //             text: 'dashbord',
//           //           ),
//           //           AppElevatedBtn(
//           //             focusNode: _bookFocusNode,
//           //             isEnable: true,
//           //             onPressedFn: () {
//           //               _bookFocusNode.unfocus();
//           //               FocusScope.of(context).requestFocus(_studentFocusNode);
//           //             },
//           //             text: 'Book Management',
//           //             colorValue: 0xAA8E8D88,
//           //           ),
//           //           AppElevatedBtn(
//           //               focusNode: _studentFocusNode,
//           //               isEnable: true,
//           //               onPressedFn: () {
//           //                 _studentFocusNode.unfocus();
//           //                 FocusScope.of(context).requestFocus(_userFocusNode);
//           //               },
//           //               text: 'Student Management'),
//           //           AppElevatedBtn(
//           //               focusNode: _userFocusNode,
//           //               isEnable: true,
//           //               onPressedFn: () {
//           //                 _userFocusNode.unfocus();
//           //                 FocusScope.of(context).requestFocus(_reportsFocusNode);
//           //               },
//           //               text: 'User Management'),
//           //           AppElevatedBtn(
//           //               focusNode: _reportsFocusNode,
//           //               isEnable: true,
//           //               onPressedFn: () {
//           //                 _reportsFocusNode.unfocus();
//           //               },
//           //               text: 'Reports')
//           //         ],
//           //       )
//           //     ],
//           //   ),
//           // )
//           ),
//     );
//   }

//   Color _adjustBrightness(Color color, double adjustment) {
//     HSVColor hsv = HSVColor.fromColor(color);
//     HSVColor adjusted = HSVColor.fromAHSV(
//       hsv.alpha,
//       hsv.hue,
//       hsv.saturation,
//       math.min(math.max(hsv.value + adjustment, 0), 1),
//     );
//     return adjusted.toColor();
//   }
// }
