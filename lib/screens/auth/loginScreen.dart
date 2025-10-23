import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_elevatedButton.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/reusableWidgets/c_toggleSwitch.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:evently_project/utils/dialogUtils.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../providers/appLanguageProvider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex=0;
  bool isPassword= true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: SafeArea(
          child: Column(
            spacing: height*0.02,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.eventlyLogo,height: height*0.22,fit: BoxFit.cover,),
              Form(
                key: formKey,
                child: Column(
                  spacing: height*0.019,
                  children: [
                    C_textFormField(
                      controller: emailController,
                      hintText: 'email',
                      prefixIcon: Icon(BoxIcons.bxs_envelope),
                    ),
                    C_textFormField(
                      controller: passwordController,
                      hintText: 'password',
                      prefixIcon: Icon(BoxIcons.bxs_lock),
                      isPassword: isPassword,
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isPassword=!isPassword;
                          });
                        },
                        icon: isPassword?Icon(BoxIcons.bxs_hide):Icon(BoxIcons.bxs_show),
                      ),
                    ),
                    C_hyperLink(
                      text: 'forget_password',
                      isItalic: true,
                      isUnderlined: true,
                      alignment: AlignmentDirectional.topEnd,
                      onPressed: (){
                        Navigator.pushNamed(context, RouteNames.resetPasswordScreen);
                      }
                    ),
                  ],
                ),
              ),
              Column(
                spacing: height*0.02,
                children: [
                  C_elevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('login_button',style: AppStyles.medium20offWhite,).tr()
                      ],
                    ),
                    onPressed: ()=> login(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('no_account',style: Theme.of(context).textTheme.bodySmall).tr(),
                      C_hyperLink(text: 'create_account',
                        isItalic: true,
                        isUnderlined: true,
                        onPressed: (){
                          Navigator.pushNamed(context, RouteNames.registerScreen);
                        }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: AppColors.primaryColor,indent: width*0.06,)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.04),
                        child: Text('or',style: AppStyles.medium16primary,).tr(),
                      ),
                      Expanded(child: Divider(color: AppColors.primaryColor,endIndent: width*0.06,)),
                    ],
                  ),
                  C_elevatedButton(
                    borderColor: AppColors.primaryColor,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    onPressed: signInWithGoogle,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Brand(Brands.google),
                        SizedBox(width: width*0.002,),
                        Text('login_with_google',style:AppStyles.medium20primary).tr(),
                      ],
                    ),
                  ),
                  C_ToggleSwitch(
                    selectedIndex: selectedIndex,
                    onToggle: (index) {
                      if(index==0){
                        languageProvider.changeLanguage(context, 'en');
                      }else{
                        languageProvider.changeLanguage(context, 'ar');
                      }
                      setState(() {
                        selectedIndex = index!;
                      });
                    },
                    icons: [
                      Image.asset(AppAssets.usIcon, height: 30),
                      Image.asset(AppAssets.egIcon, height: 30),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() async {
    DialogUtils.showLoading(context: context, message: 'Loading ...');
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
        '867964367777-8vsrq1v5s5ji2pl0e88ti3s8pjo5b9qv.apps.googleusercontent.com',
      );
      final googleUser = await googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;

      final authorization = await authorizationClient.authorizationForScopes(['email', 'profile']) ??
      await authorizationClient.authorizationForScopes(['email', 'profile']);

      final accessToken = authorization?.accessToken;

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final user = userCredential.user;

      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(
          context: context,
          message: 'Enjoy :)',
          title: 'Login successful',
          posActionName: 'Ok',
          posAction: (){
            Navigator.pushNamedAndRemoveUntil(context, RouteNames.homeScreen, (route) => false,);
          }
      );
    }catch (e){
      DialogUtils.hideLoading(context: context);
      DialogUtils.showMessage(
        context: context,
        message: 'Google Sign in process has been inturpted',
        title: 'Error',
        posActionName: 'Back',
      );
      print(e.toString());
    }
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showLoading(context: context, message: 'Loading ...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
            context: context,
            message: 'Enjoy :)',
            title: 'Login successful',
            posActionName: 'Ok',
            posAction: (){
              Navigator.pushNamedAndRemoveUntil(context, RouteNames.homeScreen, (route) => false,);
            }
        );
      } catch (e) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: 'The supplied auth credential is incorrect, malformed or has expired.',
          title: 'Error',
          posActionName: 'Back',
        );
        print(e.toString());
      }
    }
  }
}