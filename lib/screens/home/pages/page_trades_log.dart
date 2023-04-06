import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_tradebook/authentication/get_current_user_id.dart';
import 'package:my_tradebook/main.dart';
import 'package:my_tradebook/screens/home/pages/widgets/widget_trade_log_item.dart';
import 'package:my_tradebook/widgets/widget_search_gif.dart';

// ignore: must_be_immutable
class PageTradesLog extends StatelessWidget {
  CollectionReference tradesAndFund = FirebaseFirestore.instance
      .collection('users')
      .doc(returnCurrentUserId())
      .collection('Trades_and_fund');
  PageTradesLog({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: tradesAndFund
            .where('type', whereIn: ['profit', 'loss'])
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SpinKitCircle(
              color: whiteColor,
              duration: Duration(milliseconds: 3000),
            ));
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong 😟'));
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = snapshot
              .data!.docs
              .cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
          if (docs.isEmpty) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WidgetSearchGif(),
                  Text('No trade entries found! 😧 ')
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                Map<String, dynamic> data = docs[index].data();
                String docId = docs[index].id;
                if (docs.isEmpty) {
                  return const Center(child: WidgetSearchGif());
                } else {
                  return WidgetTradeLogItem(
                      docId: docId,
                      type: data['type'],
                      amount: data['amount'],
                      date: data['date'].toDate(),
                      swp: data['swing_profit'],
                      swl: data['swing_loss'],
                      intp: data['intraday_profit'],
                      intl: data['intraday_loss'],
                      comments: data['description']);
                }
              },
              itemCount: docs.length,
            );
          }
        });
  }
}
