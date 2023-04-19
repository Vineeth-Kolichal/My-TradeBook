import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tradebook/database/firebase/dashbord_calculations/filter_data_with_date.dart';
import 'package:my_tradebook/database/firebase/dashbord_calculations/total_pnl_section.dart';

Future<List<Map<String, dynamic>>> lineGraphData() async {
  List totalAmountList = List.generate(10, (index) => null);
  List displayAmountList = List.generate(10, (index) => null);
  List<List<DocumentSnapshot<Object?>>> lastTenData;
  double sum = 0.0;
  lastTenData = await lastTenWeeksData();
  int k = lastTenData.length - 1;
  for (var x in lastTenData) {
    for (var y in x) {
      if (y['type'] == 'profit' || y['type'] == 'deposite') {
        sum += y['amount'];
      } else {
        sum -= y['amount'];
      }
    }
    totalAmountList[k] = sum;
    k--;
    sum = 0;
  }
  double tenWeekTotal = 0.0;
  for (var x = 0; x < totalAmountList.length; x++) {
    if (totalAmountList[x] != null) {
      tenWeekTotal = tenWeekTotal + totalAmountList[x];
    }
  }
  double balanceBeforeTenWeek = await getCurrentBalance() - tenWeekTotal;
  for (var i = 0; i < totalAmountList.length; i++) {
    if (totalAmountList[i] != null) {
      if (i == 0) {
        displayAmountList[i] = totalAmountList[i] + balanceBeforeTenWeek;
        // print(totalAmountList[i]);
        // print(displayAmountList);
      } else {
        displayAmountList[i] = displayAmountList[i - 1] + totalAmountList[i];
      }
    }
  }
  // print(totalAmountList);
  // print('ten week total = $tenWeekTotal');
  // print('balance before tenweek= $balanceBeforeTenWeek');
  // print(displayAmountList);
  List<Map<String, dynamic>> chartData = [];
  for (int a = 1; a <= 10; a++) {
    if (a == 0) {
      chartData.add(
        {'domain': 0.toString(), 'measure': balanceBeforeTenWeek},
      );
    } else {
      chartData.add(
        {'domain': a.toString(), 'measure': displayAmountList[a - 1]},
      );
    }
  }
  return chartData;
}
