import 'package:firebase_auth/firebase_auth.dart';

String returnCurrentUserId() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  String? userId = user?.uid;
  return userId!;
}
