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
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooks.stream,
    );
  }
}

class BaseStreamProvider extends StatelessWidget {
  const BaseStreamProvider({Key? key, required this.initData, required this.streamData})
      : super(key: key);
  final int initData;
  final Stream<int> streamData;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (BuildContext context) => streamData,
      initialData: initData,
      builder: (context, _) => (initData == -1)
          ? CircularProgressIndicator()
          : Column(
              children: [
                Text(
                  '${Provider.of<int>(context)}',
                  style: Theme.of(context).textTheme.headline4,
                ),
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
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalCopies.stream,
    );
  }
}

class ActiveBooksIssued extends StatefulWidget {
  ActiveBooksIssued({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _ActiveBooksIssuedState createState() => _ActiveBooksIssuedState();
}

class _ActiveBooksIssuedState extends State<ActiveBooksIssued> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalActiveBooksIssued.stream,
    );
  }
}

class BooksIssuedSoFar extends StatefulWidget {
  BooksIssuedSoFar({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksIssuedSoFarState createState() => _BooksIssuedSoFarState();
}

class _BooksIssuedSoFarState extends State<BooksIssuedSoFar> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksIssuedSoFar.stream,
    );
  }
}

class BooksIssuedToday extends StatefulWidget {
  BooksIssuedToday({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksIssuedTodayState createState() => _BooksIssuedTodayState();
}

class _BooksIssuedTodayState extends State<BooksIssuedToday> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksIssuedToday.stream,
    );
  }
}

class BooksReturned extends StatefulWidget {
  BooksReturned({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksReturnedState createState() => _BooksReturnedState();
}

class _BooksReturnedState extends State<BooksReturned> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksReturnedToday.stream,
    );
  }
}

class BooksDelayInReturn extends StatefulWidget {
  BooksDelayInReturn({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksDelayInReturnState createState() => _BooksDelayInReturnState();
}

class _BooksDelayInReturnState extends State<BooksDelayInReturn> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksDelayInReturn.stream,
    );
  }
}

class BooksDueReturn extends StatefulWidget {
  BooksDueReturn({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksDueReturnState createState() => _BooksDueReturnState();
}

class _BooksDueReturnState extends State<BooksDueReturn> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksDueReturn.stream,
    );
  }
}

class BooksAsNew extends StatefulWidget {
  BooksAsNew({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksAsNewState createState() => _BooksAsNewState();
}

class _BooksAsNewState extends State<BooksAsNew> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksAsNew.stream,
    );
  }
}

class UseableBooks extends StatefulWidget {
  UseableBooks({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _UseableBooksState createState() => _UseableBooksState();
}

class _UseableBooksState extends State<UseableBooks> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalUseableBooks.stream,
    );
  }
}

class BooksToDiscard extends StatefulWidget {
  BooksToDiscard({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksToDiscardState createState() => _BooksToDiscardState();
}

class _BooksToDiscardState extends State<BooksToDiscard> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksToDiscard.stream,
    );
  }
}

class PoorBooks extends StatefulWidget {
  PoorBooks({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _PoorBooksState createState() => _PoorBooksState();
}

class _PoorBooksState extends State<PoorBooks> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalPoorBooks.stream,
    );
  }
}

class BooksInSingleRack extends StatefulWidget {
  BooksInSingleRack({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksInSingleRackState createState() => _BooksInSingleRackState();
}

class _BooksInSingleRackState extends State<BooksInSingleRack> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksInSingleRack.stream,
    );
  }
}

class BooksCapacity extends StatefulWidget {
  BooksCapacity({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _BooksCapacityState createState() => _BooksCapacityState();
}

class _BooksCapacityState extends State<BooksCapacity> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalBooksCapacityInRack.stream,
    );
  }
}

class TotalStudents extends StatefulWidget {
  TotalStudents({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _TotalStudentsState createState() => _TotalStudentsState();
}

class _TotalStudentsState extends State<TotalStudents> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalStudents.stream,
    );
  }
}

class TotalStaffs extends StatefulWidget {
  TotalStaffs({Key? key}) : super(key: key);
  int initData = -1;
  @override
  _TotalStaffsState createState() => _TotalStaffsState();
}

class _TotalStaffsState extends State<TotalStaffs> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var data = await loc<BookDao>().getSampleDataCount();
      setState(() {
        widget.initData = data;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loc<BookDao>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStreamProvider(
      initData: widget.initData,
      streamData: loc<BookDao>().totalStaffs.stream,
    );
  }
}
