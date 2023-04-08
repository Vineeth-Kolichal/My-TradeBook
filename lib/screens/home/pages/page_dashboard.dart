import 'package:flutter/material.dart';
import 'package:my_tradebook/database/firebase/dashbord_calculations/total_pnl_section.dart';
import 'package:my_tradebook/functions/function_short_amount.dart';
import 'package:my_tradebook/main.dart';
import 'package:my_tradebook/screens/home/pages/widgets/widget_fund_movement.dart';
import 'package:my_tradebook/screens/home/pages/widgets/widget_pnl_analysis_graph.dart';
import 'package:my_tradebook/screens/login/screen_login.dart';

class PageDashboard extends StatefulWidget {
  const PageDashboard({super.key});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  Map<String, int>? doughNutValue = {
    'Profit-swing': 10,
    'Loss-swing': 25,
    'Profit-intraday': 25,
    'Loss-intraday': 25
  };

  List<Map<String, dynamic>> chartData = [
    {'domain': 1, 'measure': 00},
    {'domain': 2, 'measure': 21},
    {'domain': 3, 'measure': 55},
    {'domain': 4, 'measure': 41},
    {'domain': 5, 'measure': 110},
    {'domain': 6, 'measure': 17},
    {'domain': 7, 'measure': 127},
    {'domain': 8, 'measure': 78},
    {'domain': 9, 'measure': 89},
    {'domain': 10, 'measure': 187},
    {'domain': 11, 'measure': 148},
    {'domain': 12, 'measure': 127},
  ];
  String number = '0.0';

  var _selectedIdex = 0;
  final List<String> pnlTitle = [
    "Last day's P&L",
    'This week P&L',
    'This quarter P&L',
    'This FY P&L'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              Material(
                color: whiteColor,
                borderRadius: BorderRadius.circular(13),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Current Balance'),
                                sizedBoxTen,
                                FutureBuilder(
                                    future: getCurrentBalance(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<double>
                                            currentBalancesnapshot) {
                                      if (currentBalancesnapshot.data == null) {
                                        return const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    customPrimaryColor),
                                          ),
                                        );
                                      }
                                      double currentBalance =
                                          currentBalancesnapshot.data!;

                                      return Tooltip(
                                        textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        waitDuration:
                                            const Duration(milliseconds: 100),
                                        showDuration:
                                            const Duration(milliseconds: 5000),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 0.4),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              whiteColor,
                                              Color.fromARGB(
                                                  255, 238, 238, 247),
                                            ],
                                          ),
                                        ),
                                        message: "₹ $currentBalance",
                                        child: Text(
                                          shortenNumber(currentBalance),
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            width: 20,
                            thickness: 1,
                            indent: 20,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 100,
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(pnlTitle[_selectedIdex]),
                                sizedBoxTen,
                                Tooltip(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  waitDuration:
                                      const Duration(milliseconds: 100),
                                  showDuration:
                                      const Duration(milliseconds: 5000),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 0.4),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        whiteColor,
                                        Color.fromARGB(255, 238, 238, 247),
                                      ],
                                    ),
                                  ),
                                  message: "₹ $number",
                                  child: Text(
                                    '+${shortenNumber(double.parse(number))}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: (double.parse(number) < 0.0
                                            ? Colors.red
                                            : Colors.green)),
                                  ),
                                ),
                                Text(
                                  "1.79%",
                                  style: TextStyle(
                                      color: (double.parse(number) < 0.0
                                          ? Colors.red
                                          : Colors.green)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              sizedBoxTen,
              WidgetPnlAnalysis(
                selectedIdex: _selectedIdex,
              ),
              sizedBoxTen,
              WidgetFundMovement(chartData: chartData),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            color: whiteColor,
            borderRadius: BorderRadius.circular(13),
            elevation: 1,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 45,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: choiceChipList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  final List<String> _choiceChipNameList = [
    'Last Day',
    'This week',
    'This Quarter',
    'This FY'
  ];

  List<Widget> choiceChipList() {
    List<Widget> chips = [];
    for (var i = 0; i < _choiceChipNameList.length; i++) {
      Widget item = ChoiceChip(
        pressElevation: 0,
        elevation: 0,
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          _choiceChipNameList[i],
          style: TextStyle(
              color: (_selectedIdex == i) ? Colors.white : Colors.black),
        ),
        selected: _selectedIdex == i,
        selectedColor: customPrimaryColor,
        onSelected: (value) {
          setState(() {
            _selectedIdex = i;
          });
        },
      );
      chips.add(item);
    }
    return chips;
  }
}
