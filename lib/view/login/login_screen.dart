// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../base/color_data.dart';
// import '../../../base/constant.dart';
// import '../../../base/resizer/fetch_pixels.dart';
// import '../../../base/widget_utils.dart';
// import '../../bloc/login_bloc.dart';
// import '../../repository/auth_repository.dart';
// import '../../routes/app_routes.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isPassVisible = true;
//
//   void finishView() {
//     Constant.closeApp();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         finishView();
//         return false;
//       },
//       child: BlocProvider<LoginBloc>(
//         // create: (_) => LoginBloc(authRepository: AuthRepository()),
//         create: (context) => LoginBloc(
//             authRepository: AuthRepository(context)), // <-- context passed here
//
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: backGroundColor,
//           body: SafeArea(
//             child: BlocListener<LoginBloc, LoginState>(
//               listener: (context, state) {
//                 if (state is LoginLoading) {
//                   showDialog(
//                     barrierDismissible: false,
//                     context: context,
//                     builder: (context) =>
//                         const Center(child: CircularProgressIndicator()),
//                   );
//                 } else if (state is LoginSuccess) {
//                   Navigator.pop(context);
//                   Constant.sendToNext(context, Routes.homeScreenRoute);
//                 } else if (state is LoginFailure) {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text(state.error)),
//                   );
//                 }
//               },
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: FetchPixels.getPixelWidth(20),
//                   vertical: FetchPixels.getPixelHeight(70),
//                 ),
//                 child: Column(
//                   children: [
//                     getVerSpace(FetchPixels.getPixelHeight(30)),
//                     getSvgImage("kleanit.svg",
//                         height: FetchPixels.getPixelHeight(124),
//                         width: FetchPixels.getPixelHeight(84.77)),
//                     getVerSpace(FetchPixels.getPixelHeight(30)),
//                     getCustomFont("Login", 24, Colors.black, 1,
//                         fontWeight: FontWeight.w800),
//                     getVerSpace(FetchPixels.getPixelHeight(10)),
//                     getCustomFont(
//                         "Glad to meet you again!", 16, Colors.black, 1,
//                         fontWeight: FontWeight.w400),
//                     getVerSpace(FetchPixels.getPixelHeight(30)),
//                     getDefaultTextFiledWithLabel(
//                       context,
//                       "Email",
//                       emailController,
//                       Colors.grey,
//                       height: FetchPixels.getPixelHeight(60),
//                       withprefix: true,
//                       image: "message.svg",
//                       function: () {},
//                       isEnable: false,
//                     ),
//                     getVerSpace(FetchPixels.getPixelHeight(20)),
//                     getDefaultTextFiledWithLabel(
//                       context,
//                       "Password",
//                       passwordController,
//                       Colors.grey,
//                       height: FetchPixels.getPixelHeight(60),
//                       withprefix: true,
//                       image: "lock.svg",
//                       isPass: isPassVisible,
//                       withSufix: true,
//                       suffiximage: "eye.svg",
//                       imagefunction: () {
//                         setState(() {
//                           isPassVisible = !isPassVisible;
//                         });
//                       },
//                       function: () {},
//                       isEnable: false,
//                     ),
//                     getVerSpace(FetchPixels.getPixelHeight(19)),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: GestureDetector(
//                         onTap: () {
//                           Constant.sendToNext(context, Routes.forgotRoute);
//                         },
//                         child: getCustomFont(
//                             "Forgot Password?", 16, greenColor, 1,
//                             fontWeight: FontWeight.w800),
//                       ),
//                     ),
//                     getVerSpace(FetchPixels.getPixelHeight(49)),
//                     Builder(builder: (context) {
//                       return getButton(
//                         context,
//                         greenColor,
//                         "Login",
//                         Colors.white,
//                         () {
//                           context.read<LoginBloc>().add(LoginButtonPressed(
//                               emailController.text.trim(),
//                               passwordController.text.trim()));
//                         },
//                         18,
//                         weight: FontWeight.w600,
//                         buttonHeight: FetchPixels.getPixelHeight(60),
//                         borderRadius: BorderRadius.circular(
//                             FetchPixels.getPixelHeight(15)),
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/color_data.dart';
import '../../../base/constant.dart';
import '../../../base/resizer/fetch_pixels.dart';
import '../../../base/widget_utils.dart';
import '../../bloc/login_bloc.dart';
import '../../repository/auth_repository.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassVisible = true;

  void finishView() {
    Constant.closeApp();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        finishView();
        return false;
      },
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authRepository: AuthRepository(context)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backGroundColor,
          body: SafeArea(
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is LoginSuccess) {
                  Navigator.pop(context); // Close loading dialog
                  Constant.sendToNext(context, Routes.homeScreenRoute);
                } else if (state is LoginFailure) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(20),
                  vertical: FetchPixels.getPixelHeight(70),
                ),
                child: Column(
                  children: [
                    getVerSpace(FetchPixels.getPixelHeight(30)),
                    getSvgImage("trace.svg",
                        // getSvgImage("kleanit (1).svg",
                        height: FetchPixels.getPixelHeight(124),
                        width: FetchPixels.getPixelHeight(84.77)),
                    getVerSpace(FetchPixels.getPixelHeight(30)),
                    // getpng("kleanit.png",
                    //     height: FetchPixels.getPixelHeight(124),
                    //     width: FetchPixels.getPixelHeight(84.77)),
                    getVerSpace(FetchPixels.getPixelHeight(30)),
                    getCustomFont("Login", 24, Colors.black, 1,
                        fontWeight: FontWeight.w800),
                    getVerSpace(FetchPixels.getPixelHeight(10)),
                    getCustomFont(
                        "Glad to meet you again!", 16, Colors.black, 1,
                        fontWeight: FontWeight.w400),
                    getVerSpace(FetchPixels.getPixelHeight(30)),
                    getDefaultTextFiledWithLabel(
                      context,
                      "Email",
                      emailController,
                      Colors.grey,
                      height: FetchPixels.getPixelHeight(60),
                      withprefix: true,
                      image: "message.svg",
                      function: () {},
                      isEnable: true,
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(20)),
                    getDefaultTextFiledWithLabel(
                      context,
                      "Password",
                      passwordController,
                      Colors.grey,
                      height: FetchPixels.getPixelHeight(60),
                      withprefix: true,
                      image: "lock.svg",
                      isPass: isPassVisible,
                      withSufix: true,
                      suffiximage: "eye.svg",
                      imagefunction: () {
                        setState(() {
                          isPassVisible = !isPassVisible;
                        });
                      },
                      function: () {},
                      isEnable: true,
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(19)),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Constant.sendToNext(context, Routes.forgotRoute);
                        },
                        child: getCustomFont(
                            "Forgot Password?", 16, greenColor, 1,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    getVerSpace(FetchPixels.getPixelHeight(49)),
                    Builder(builder: (context) {
                      return getButton(
                        context,
                        greenColor,
                        "Login",
                        Colors.white,
                        // ()
                        // {
                        //   context.read<LoginBloc>().add(LoginButtonPressed(
                        //         emailController.text.trim(),
                        //         passwordController.text.trim(),
                        //       ));
                        // },
                        () async {
                          final fcmToken =
                              await FirebaseMessaging.instance.getToken();
                          if (fcmToken != null) {
                            context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    fcmToken,
                                  ),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('FCM token not available.')),
                            );
                          }
                        },

                        18,
                        weight: FontWeight.w600,
                        buttonHeight: FetchPixels.getPixelHeight(60),
                        borderRadius: BorderRadius.circular(
                            FetchPixels.getPixelHeight(15)),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
