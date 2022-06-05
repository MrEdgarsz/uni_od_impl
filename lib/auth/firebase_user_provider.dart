import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class UniODImplFirebaseUser {
  UniODImplFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

UniODImplFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<UniODImplFirebaseUser> uniODImplFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<UniODImplFirebaseUser>(
        (user) => currentUser = UniODImplFirebaseUser(user));
