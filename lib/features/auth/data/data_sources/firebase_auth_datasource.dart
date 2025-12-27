import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> login(String email, String password) async {
    final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }

  Future<User> register(String email, String password) async {
    final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }
}
