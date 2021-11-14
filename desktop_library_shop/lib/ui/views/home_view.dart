import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Home view updated'));
  }
}


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
