import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<List<Map>> fetchData(
  String from, {
  String? byName,
  String? byEmail,
  String? byPhone,
  double? byPrice,
  String? byCategory,
  String? byGender,
  String? byGUID,
}) async {
  try {
    Query query = FirebaseFirestore.instance.collection(from);

    if (byName != null) query = query.where('Name', isEqualTo: byName);
    if (byCategory != null)
      query = query.where('Category', isEqualTo: byCategory);
    if (byGender != null) query = query.where('Interest', isEqualTo: byGender);
    if (byEmail != null) query = query.where('email', isEqualTo: byEmail);
    if (byPhone != null) query = query.where('PhoneNumber', isEqualTo: byPhone);
    if (byPrice != null)
      query = query.where('Price', isLessThanOrEqualTo: byPrice);
    if (byGUID != null)
      query = query.where(FieldPath.documentId, isEqualTo: byGUID);

    final querySnapshot = await query.get();

    return querySnapshot.docs.map<Map>((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
}

Future<void> registerUser(
    {required String email,
    required String password,
    required String name,
    required String phone}) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final uid = userCredential.user?.uid;

    if (uid != null) {
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'Name': name,
        // 'Address': addr,
        'PhoneNumber': phone,
        'Email': email,
      });
      print("User has been registered: $uid");
    }
  } catch (e) {
    throw Exception('Error registering user: $e');
  }
}

Future<void> deleteUser(String email) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: email)
        .get();

    for (var doc in querySnapshot.docs) {
      await FirebaseFirestore.instance.collection('Users').doc(doc.id).delete();
    }
    print('User with email $email deleted successfully.');
  } catch (e) {
    throw Exception('Failed to delete user: $e');
  }
}

Future<void> storeData(String name, String category, String description,
    double price, String interest,
    {String image = ""}) async {
  try {
    await FirebaseFirestore.instance.collection('Data').add({
      'Name': name,
      'Category': category,
      'Description': description,
      'Price': price,
      'Interest': interest,
      'Image': image,
    });
    print("Data added successfully.");
  } catch (e) {
    throw Exception('Failed to add product: $e');
  }
}

Future<void> deleteProduct(String GUID) async {
  try {
    await FirebaseFirestore.instance.collection('Products').doc(GUID).delete();
    print('Product deleted successfully.');
  } catch (e) {
    throw Exception('Failed to delete product: $e');
  }
}

Future<void> updateData(
    String from, String GUID, String fieldName, dynamic newValue) async {
  try {
    final docRef = FirebaseFirestore.instance.collection(from).doc(GUID);
    await docRef.update({fieldName: newValue});
    print('Data updated successfully!');
  } catch (e) {
    throw Exception('Failed to update field data: $e');
  }
}

Future<bool> isUserLoggedIn() async {
  return FirebaseAuth.instance.currentUser != null;
}

Future<void> loginUser(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("Login successful!");
  } catch (e) {
    throw Exception('Login failed: $e');
  }
}

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the Google Authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId:
            "469899818347-4546o3e5uqi3osc0r7jceifp5ebfn269.apps.googleusercontent.com",
        scopes: ['email', 'profile', 'openid']).signIn();
    if (googleUser == null) {
      print('Google sign-in aborted by user.');
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print('Error during Google sign-in: $e');
    return null;
  }
}

Future<void> registerUserWithGoogle() async {
  try {
    final UserCredential? userCredential = await signInWithGoogle();

    if (userCredential != null) {
      final User? user = userCredential.user;

      if (user != null) {
        final String name = user.displayName ?? 'No Name';
        final String email = user.email ?? 'No Email';
        final String? photoUrl = user.photoURL;

        print('User registered successfully!');
        print('Name: $name');
        print('Email: $email');
        if (photoUrl != null) {
          print('Photo URL: $photoUrl');
        }
      } else {
        print('Failed to retrieve user details.');
      }
    } else {
      print('Google sign-in failed.');
    }
  } catch (e) {
    print('Error during user registration with Google: $e');
  }
}

Future<void> logoutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    print("Logout successful!");
  } catch (e) {
    throw Exception('Logout failed: $e');
  }
}
