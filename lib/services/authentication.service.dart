import 'package:car_shop_app/models/user.model.dart';
import 'package:car_shop_app/repositories/user.repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final UserRepository _userRepository = UserRepository();

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final loggedCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      final loggedUser = loggedCredentials.user;

      if (loggedUser == null) return;

      final savedUser = await _userRepository.getById(loggedUser.uid);
      if (savedUser == null)
        await _userRepository.save(
          UserModel(
              id: loggedUser.uid,
              name: loggedUser.displayName ?? '',
              email: loggedUser.email ?? ''),
        );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
