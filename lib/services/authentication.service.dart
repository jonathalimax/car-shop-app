// import 'dart:convert';
// import 'dart:math';

import 'package:car_shop_app/models/user.model.dart';
import 'package:car_shop_app/repositories/user.repository.dart';
// import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  Future signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredentials =
        await _firebaseAuth.signInWithCredential(credential);

    _syncUserRepository(userCredentials);
  }

  Future signInWithApple() async {
    // final rawNonce = _generateNonce();
    // final nonce = _sha256ofString(rawNonce);

    // final appleCredential = await SignInWithApple.getAppleIDCredential(
    //   scopes: [
    //     AppleIDAuthorizationScopes.email,
    //     AppleIDAuthorizationScopes.fullName,
    //   ],
    //   nonce: nonce,
    // );

    // final oauthCredential = OAuthProvider("apple.com").credential(
    //   idToken: appleCredential.identityToken,
    //   rawNonce: rawNonce,
    // );

    // final userCredentials =
    //     await _firebaseAuth.signInWithCredential(oauthCredential);

    // _syncUserRepository(userCredentials);
  }

  Future _syncUserRepository(UserCredential userCredential) async {
    final loggedUser = userCredential.user;
    if (loggedUser == null) return;

    final savedUser = await _userRepository.getById(loggedUser.uid);
    if (savedUser == null)
      await _userRepository.save(
        UserModel(
          id: loggedUser.uid,
          name: loggedUser.displayName ?? '',
          email: loggedUser.email ?? '',
        ),
      );
  }

  String _generateNonce([int length = 32]) {
    // final charset =
    //     '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    // final random = Random.secure();
    // return List.generate(length, (_) => charset[random.nextInt(charset.length)])
    //     .join();
    return '';
  }

  String _sha256ofString(String input) {
    // final bytes = utf8.encode(input);
    // final digest = sha256.convert(bytes);
    // return digest.toString();
    return '';
  }
}
