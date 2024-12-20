// Importing necessary packages
import 'package:flutter/material.dart'; // Provides Flutter's material design widgets
import 'package:food_delivery/auth/login_or_register.dart'; // Custom authentication screen
import 'package:food_delivery/models/restaurant.dart'; // Restaurant model
import 'package:food_delivery/themes/theme_provider.dart'; // Theme provider for managing app themes
import 'package:provider/provider.dart'; // State management package

// The main function is the entry point of the application
void main() {
  runApp(
    // MultiProvider allows multiple providers to be created and accessed throughout the app
    MultiProvider(
      providers: [
        // ChangeNotifierProvider for ThemeProvider to manage theme-related state
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        // ChangeNotifierProvider for Restaurant to manage restaurant-related state
        ChangeNotifierProvider(
          create: (context) => AssetRegistry(),
        ),
      ],
      // MyApp is the root widget of the application
      child: const MyApp(),
    ),
  );
}

// MyApp is a stateless widget that represents the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // The build method describes the part of the user interface represented by this widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset App', // Title of the application
      // The theme of the app is provided by ThemeProvider
      theme: Provider.of<ThemeProvider>(context).themeData,
      // The home property defines the default route of the app
      home: LoginOrRegister(), // Initial screen for user authentication
    );
  }
}

/*
* Explanation

* Imports:
flutter/material.dart: Imports Flutter's material design library, providing a wide range of pre-designed widgets that adhere to Material Design guidelines.
food_delivery/auth/login_or_register.dart: Imports a custom widget for handling user authentication (login or registration).
food_delivery/models/restaurant.dart: Imports the Restaurant model, which likely contains data and methods related to restaurant information.
food_delivery/themes/theme_provider.dart: Imports a custom ThemeProvider for managing the application's theme.
provider/provider.dart: Imports the Provider package, a popular state management solution in Flutter.

* Main Function:
The main function is the entry point of the Flutter application.
runApp initializes the app and inflates the given widget (MyApp) to attach it to the screen.
MultiProvider is used to provide multiple objects throughout the widget tree. In this case:
ThemeProvider: Manages theme-related state, allowing dynamic theme changes.
Restaurant: Manages restaurant-related state, possibly including data like menu items, restaurant details, etc.

* MyApp Widget:
MyApp is a stateless widget that serves as the root of the application.
The build method returns a MaterialApp, which is a convenience widget that wraps several widgets commonly required for material design applications.
title: Sets the title of the application.
theme: Retrieves the current theme from ThemeProvider using Provider.of<ThemeProvider>(context).themeData. This allows the app's theme to be dynamically changed based on the state managed by ThemeProvider.
home: Sets the default route of the app to the LoginOrRegister widget, which is likely the initial screen presented to the user for authentication purposes.

* Additional Notes

* Provider Package:
The Provider package offers a simple way to manage state across the application. By using ChangeNotifierProvider, you can create and provide instances of classes that extend ChangeNotifier. This setup allows widgets to listen to changes and rebuild accordingly.
In this code, both ThemeProvider and Restaurant are provided at the root of the widget tree, making them accessible throughout the app.

* ThemeProvider:
The ThemeProvider class is responsible for managing the app's theme. By calling Provider.of<ThemeProvider>(context).themeData, the current theme is accessed and applied to the MaterialApp. This setup facilitates dynamic theme switching based on user preferences or other logic defined within ThemeProvider.
LoginOrRegister Widget:
The LoginOrRegister widget serves as the initial screen of the app, guiding users through the authentication process. This widget likely contains logic to determine whether a user should log in or register a new account.
*/
