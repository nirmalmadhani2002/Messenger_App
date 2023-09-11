// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_flutter_app/screens/LoginPage.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Helper/Apis.dart';
// import '../Helper/firebase_helper.dart';
// import 'HomePage.dart';
// import 'SplashPage.dart';
//
// class Sing_up extends StatefulWidget {
//   const Sing_up({super.key});
//
//   @override
//   State<Sing_up> createState() => _Sing_upState();
// }
//
// class _Sing_upState extends State<Sing_up> {
//   bool passwordVisible = false;
//   GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   String? email;
//   String? password;
//
//   @override
//   void initState() {
//     super.initState();
//     passwordVisible = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: Form(
//         key: signInFormKey,
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   width: double.infinity,
//                   height: 300,
//                   child: Image.asset("assets/images/Sing-Up.png"),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 20),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Sing-Up",
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                 ),
//                 // Container(
//                 //   margin: EdgeInsets.only(
//                 //     left: 25,
//                 //     right: 25,
//                 //     top: 25,
//                 //     bottom: 15,
//                 //   ),
//                 //   child: TextFormField(
//                 //     textInputAction: TextInputAction.next,
//                 //     controller: emailController,
//                 //     validator: (val) {
//                 //       if (val!.isEmpty) {
//                 //         return "Enter Email first....";
//                 //       }
//                 //       return null;
//                 //     },
//                 //     onSaved: (val) {
//                 //       email = val;
//                 //     },
//                 //     keyboardType: TextInputType.emailAddress,
//                 //     decoration: InputDecoration(
//                 //         labelText: "Email",
//                 //         icon: Icon(Icons.email_outlined),
//                 //         labelStyle: TextStyle(fontWeight: FontWeight.w400),
//                 //         border: OutlineInputBorder(
//                 //           borderSide: BorderSide(color: Colors.black),
//                 //         )),
//                 //   ),
//                 // ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     left: 25,
//                     right: 25,
//                     top: 25,
//                     bottom: 15,
//                   ),
//                   child: TextFormField(
//                     textInputAction: TextInputAction.next,
//                     controller: emailController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return "Enter Email first....";
//                       }
//                       return null;
//                     },
//                     onSaved: (val) {
//                       email = val;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                         labelText: "Email",
//                         icon: Icon(Icons.email_outlined),
//                         labelStyle: TextStyle(fontWeight: FontWeight.w400),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         )),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 25, right: 25),
//                   child: TextFormField(
//                     obscureText: passwordVisible,
//                     controller: passwordController,
//                     validator: (val) {
//                       if (val!.isEmpty) {
//                         return "Enter Password....";
//                       }
//                       return null;
//                     },
//                     onSaved: (val) {
//                       password = val;
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       icon: const Icon(Icons.password),
//                       suffixIcon: IconButton(
//                         icon: Icon(passwordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off),
//                         onPressed: () {
//                           setState(
//                             () {
//                               passwordVisible = !passwordVisible;
//                             },
//                           );
//                         },
//                       ),
//                       labelStyle: TextStyle(fontWeight: FontWeight.w400),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Color(0xff6C63FF),
//                     minimumSize:
//                         Size(350, MediaQuery.of(context).size.width / 8),
//                   ),
//                   onPressed: () async {
//                     if (signInFormKey.currentState!.validate()) {
//                       signInFormKey.currentState!.save();
//                     }
//
//                     Map<String, dynamic> res = await FirebaseAuthHelper
//                         .firebaseAuthHelper
//                         .singUp(email: email!, password: password!);
//
//                     if (res['user'] != null) {
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text(
//                               "Sing-up successful...",
//                             ),
//                             backgroundColor: Colors.green,
//                             behavior: SnackBarBehavior.floating),
//                       );
//                       Navigator.of(context).pushNamed('loginPage');
//                     } else if (res['error'] != null) {
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(res['error']),
//                           backgroundColor: Colors.red,
//                           behavior: SnackBarBehavior.floating,
//                         ), // SnackBar
//                       );
//                     } else {
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text(
//                               "Sing-up failed...",
//                             ),
//                             backgroundColor: Colors.red,
//                             behavior: SnackBarBehavior.floating),
//                       );
//                     }
//                     setState(() {
//                       emailController.clear();
//                       passwordController.clear();
//
//                       email = null;
//                       password = null;
//                     });
//                   },
//                   child: Text(
//                     "Sing Up",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 23,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 //   children: [
//                 //     FloatingActionButton(
//                 //       foregroundColor: Colors.white,
//                 //       backgroundColor: Colors.white,
//                 //       onPressed: () async {
//                 //         SharedPreferences data =
//                 //             await SharedPreferences.getInstance();
//                 //         data.setBool(SplashPageState.Keytool, true);
//                 //         User? user = await FirebaseAuthHelper.firebaseAuthHelper
//                 //             .signInAnonymously();
//                 //
//                 //         if (user != null) {
//                 //           ScaffoldMessenger.of(context).showSnackBar(
//                 //             SnackBar(
//                 //                 duration: Duration(seconds: 1),
//                 //                 content: Text(
//                 //                   "Login successful...",
//                 //                 ),
//                 //                 backgroundColor: Colors.green,
//                 //                 behavior: SnackBarBehavior.floating),
//                 //           );
//                 //           Navigator.of(context).pushNamedAndRemoveUntil(
//                 //               'homePage', (route) => false);
//                 //         } else {
//                 //           ScaffoldMessenger.of(context).showSnackBar(
//                 //             SnackBar(
//                 //                 duration: Duration(seconds: 1),
//                 //                 content: Text(
//                 //                   "Login failed...",
//                 //                 ),
//                 //                 backgroundColor: Colors.red,
//                 //                 behavior: SnackBarBehavior.floating),
//                 //           );
//                 //         }
//                 //       },
//                 //       child: Image.asset(
//                 //         "assets/images/anonymous.png",
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 FloatingActionButton(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.white,
//                   onPressed: () async {
//                     Map<String, dynamic> res = await FirebaseAuthHelper
//                         .firebaseAuthHelper
//                         .singWithGoogle();
//
//                     SharedPreferences data =
//                         await SharedPreferences.getInstance();
//                     data.setBool(SplashPageState.Keytool, true);
//
//                     if (res['user'] != null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text(
//                               "Login successful...",
//                             ),
//                             backgroundColor: Colors.green,
//                             behavior: SnackBarBehavior.floating),
//                       );
//                       if (await (APIs.userExists())) {
//                         Navigator.of(context).pushNamedAndRemoveUntil(
//                             'homePage', (route) => false);
//                       } else {
//                         await APIs.CreateUser().then((value) =>
//                             Navigator.pushReplacement(context,
//                                 MaterialPageRoute(builder: (_) => HomePage())));
//                       }
//                     } else if (res['error'] != null) {
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(res['error']),
//                           backgroundColor: Colors.red,
//                           behavior: SnackBarBehavior.floating,
//                         ), // SnackBar
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                             "Login failed...",
//                           ),
//                           backgroundColor: Colors.red,
//                           behavior: SnackBarBehavior.floating,
//                         ),
//                       );
//                     }
//                     setState(() {
//                       emailController.clear();
//                       passwordController.clear();
//
//                       email = null;
//                       password = null;
//                     });
//                   },
//                   child: Image.asset(
//                     "assets/images/Google__G__Logo.png",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Don't have an account?"),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             PageTransition(
//                                 type: PageTransitionType.rightToLeft,
//                                 child: const LoginPage(),
//                                 inheritTheme: true,
//                                 ctx: context),
//                           );
//                           setState(() {
//                             emailController.clear();
//                             passwordController.clear();
//
//                             email = null;
//                             password = null;
//                           });
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff6C63FF),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
