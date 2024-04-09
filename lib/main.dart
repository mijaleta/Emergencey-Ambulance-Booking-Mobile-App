// ignore_for_file: prefer_const_constructors

import 'package:ambu_app/pages/account_page.dart';
import 'package:ambu_app/pages/ambulance_registration.dart';
import 'package:ambu_app/pages/ambulance_search_page.dart';
import 'package:ambu_app/pages/conditions/privacy_policy_page.dart';
import 'package:ambu_app/pages/conditions/terms_of_service_page.dart';
import 'package:ambu_app/pages/driver_page.dart';
import 'package:ambu_app/pages/edit_screen.dart';
import 'package:ambu_app/pages/emergency_types.dart';
import 'package:ambu_app/pages/feedback_page.dart';
import 'package:ambu_app/pages/forgot_password_page.dart';
import 'package:ambu_app/pages/history.dart';
import 'package:ambu_app/pages/hospital_page.dart';
import 'package:ambu_app/pages/login.dart';
import 'package:ambu_app/pages/logout.dart';
import 'package:ambu_app/pages/nurse_page.dart';
// import 'package:ambu_app/pages/reset_password.dart';
import 'package:ambu_app/pages/setting.dart';
import 'package:ambu_app/pages/special_request_page.dart';
import 'package:ambu_app/system/ambulance_fleet_management.dart';
import 'package:ambu_app/system/ambulance_routing_tracking.dart';
import 'package:ambu_app/system/continuous_improvement.dart';
import 'package:ambu_app/system/dispatcher_management.dart';
import 'package:ambu_app/system/emergency_response_coordination.dart';
import 'package:ambu_app/system/regulatory_compliance.dart';
import 'package:ambu_app/system/system_configuration_settings.dart';
import 'package:ambu_app/users/dispatcher.dart';
import 'package:ambu_app/users/driver.dart';
import 'package:ambu_app/users/nurse.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ambu_app/provider/request_provider.dart';
import 'package:ambu_app/pages/patient_request_page.dart';
import 'package:ambu_app/pages/dispatcher_page.dart';
import 'package:ambu_app/pages/change_password.dart';
// import 'package:ambu_app/pages/login_page.dart';
import 'package:ambu_app/pages/home_page.dart';
import 'package:ambu_app/pages/signup_page.dart';
import 'package:ambu_app/pages/splash_screen.dart';
import 'package:ambu_app/pages/language_selection_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations/Afaan Oromo/home_page_dhukkubsataa.dart';
import 'localizations/Amharic/yetamami_home_page.dart';

void main() {
  // await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergency Ambulance Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,

      // ],
      // supportedLocales: [
      //   Locale('en'), // English
      //   Locale('es'), // Spanish
      // ],
      initialRoute: '/splash',
      routes: {
        '/home': (context) => HomePage(),
        // '/loginPage': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/splash': (context) => SplashScreen(),
        '/languageSelection': (context) => LanguageSelectionPage(),
        '/ambulanceRequest': (context) => PatientRequestPage(),
        // '/dispatcherPage': (context) => DispatcherPage(), // Fixed typo here
        '/changePasswordPage': (context) => ChangePasswordPage(),
        '/forgotPasswordPage': (context) => ForgotPasswordPage(),
        '/login': (context) => Login(),
        // '/reset': (context) => ResetPasswordPage(),
        '/searchAmbulancePage': (context) => AmbulanceSearchPage(),
        'feedbackPage': (context) => FeedbackPage(),
        'accountPage': (context) => AccountScreen(),
        'editAccountScreen': (context) => EditAccount(),
        'registerAmbulance': (context) => RegisterAmbulance(),
        'logout': (context) => Logout(),
        'history': (context) => History(),
        // 'settings': (context) => SettingsScreen(),
        'nursePage': (context) => NursePage(),
        'driverPage': (context) => DriverPage(),
        // 'hospitalPage': (context) => HospitalPage(),
        'emergencyTypes': (context) => EmergencyTypeSelectionPage(),
        'specialRequest': (context) => SpecialRequestPage(),
        'privacyPolicy': (context) => PrivacyPolicyPage(),
        'termsOfService': (context) => TermsOfServicePage(),
        'driver': (context) => Driver(),
        'nurse': (context) => Nurse(),
        'dispatcher': (context) => Dispatcher(),
        '/ambulanceFleetManagementPage': (context) =>
            AmbulanceFleetManagementPage(),
        '/ambulanceRoutingTrackingPage': (context) =>
            AmbulanceRoutingTrackingPage(),
        '/continuousImprovementPage': (context) => ContinuousImprovementPage(),
        '/dataManagementReportingPage': (context) =>
            DataManagementReportingPage(),
        '/dispatcherManagementPage': (context) => DispatcherManagementPage(),
        '/emergencyPreparednessPage': (context) => EmergencyPreparednessPage(),
        '/emergencyResponseCoordinationPage': (context) =>
            EmergencyResponseCoordinationPage(),
        '/regulatoryCompliancePage': (context) => RegulatoryCompliancePage(),
        '/systemConfigurationSettingsPage': (context) =>
            SystemConfigurationSettingsPage(),
        '/userManagementPage': (context) => UserManagementPage(),
        'afanOromoHomepage': (context) => HomePageDhukkubsataa(),
        'amharicHomepage': (context) => AmharicHomePage(),
      },
    );
  }
}
