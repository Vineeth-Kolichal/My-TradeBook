import 'package:flutter/material.dart';
import 'package:my_tradebook/views/login/screen_login.dart';
import 'package:my_tradebook/views/widgets/widget_appbar.dart';

class PageAboutTradeBokk extends StatelessWidget {
  const PageAboutTradeBokk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 247),
      appBar: const WidgetAppbar(title: 'About Tradebook'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              const Text(
                  '\t\t\tTradebook is a very useful app for traders that helps them to know about their cash flow in the stock market. The user can view and analyze their trades and determine whether they are currently in a loss or profit.'),
              const Divider(),
              const Text(
                'How to Use ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              sizedBoxTen,
              const Text(
                "👉Firstly, add your capital in the fund section of the 'My TradeBook' app. To do so, click on the plus button below and select the date, deposit option, and enter the capital amount.",
              ),
              sizedBoxTen,
              const Text(
                "👉After adding the capital amount, you can add trade details after each trading day. We recommend adding trade logs after receiving the contract note from the broker and including the net realized PNL in the trades log section.",
              ),
              sizedBoxTen,
              const Text(
                "👉If you are using multiple broking platforms to trade, add PNL details from all of them to track the correct cash flow.",
              ),
              sizedBoxTen,
              const Text(
                "👉Continue this process every trading day to easily track your funds.",
              ),
              sizedBoxTen,
              const Text(
                "👉On the dashboard, you can see a doughnut graph and a bar graph. The doughnut graph shows details of the trades you took (swing and intraday).",
              ),
              sizedBoxTen,
              const Text(
                "👉The bar graph shows the 10-week cash flow, with each bar representing a week. If you did not take any trades in a week, the corresponding bar will show zero.",
              ),
              sizedBoxTen,
              const Text(
                "👉Green bars indicate a positive cash flow compared to the previous week, while red bars indicate a negative cash flow.",
              ),
              sizedBoxTen,
              const Text(
                "👉On the dashboard, you can also see the total current balance and the PNL for the last day, current week, current quarter, and current financial year.",
              ),
              const Divider(),
              const Text(
                'FAQ',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              sizedBoxTen,
              const Text(
                "1. How 'My TradeBook' help to traders?",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              sizedBoxTen,
              const Text(
                  '\t\t\t Tradebook helps users understand their cash flow in the stock market, and users can write comments about the trades they have taken.'),
              sizedBoxTen,
              const Text(
                "2. Will user get report as pdf from this app?",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              sizedBoxTen,
              const Text(
                  '\t\t\t Currently, this feature is not available, but you will receive an update soon with this feature. Then, you will be able to download the report as a PDF.'),
              sizedBoxTen,
              const Text(
                "3. What is position sizing?",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              sizedBoxTen,
              const Text(
                  '\t\t\t In stock market trading, a "position" refers to the ownership status of a security (such as a stock, option, or future) in a traders portfolio. A trader can take a long or short position in a security, depending on their market outlook and trading strategy. Position sizing means setting a predefined target and stop-loss based on the profit that one expects from one trade and dividing the total trading capital according to the risk and reward that one expects to get from one trade.'),
              sizedBoxTen,
              const Text(
                "4. How position sizing help to users?",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              sizedBoxTen,
              const Text(
                  '\t\t\t Position sizing helps users stay profitable even if they have multiple losing trades.'),
            ],
          ),
        ),
      ),
    );
  }
}
