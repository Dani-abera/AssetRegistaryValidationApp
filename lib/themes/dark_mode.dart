import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background:
        Color.fromARGB(255, 28, 28, 30), // Dark background for a clean look
    primary: Color.fromARGB(255, 56, 56,
        58), // A darker primary color for buttons and active elements
    secondary: Color.fromARGB(
        255, 44, 44, 46), // Secondary color for less emphasized elements
    tertiary:
        Color.fromARGB(255, 72, 72, 74), // Used for inputs and form fields
    inversePrimary:
        Colors.white, // White text on dark background for readability
  ),
);

/*

### Explanation

1. **Import Statement**:
   - `import 'package:flutter/material.dart';`: Imports Flutter's material design library, providing access to widgets and theming capabilities.

2. **ThemeData Object**:
   - `ThemeData`: A class that holds the color and typography values for a material design theme. In this case, it's configured for dark mode.

3. **ColorScheme**:
   - `ColorScheme.dark()`: A predefined color scheme for dark themes. It provides a set of colors that are optimized for dark backgrounds. You can customize these colors by specifying different values for properties like `background`, `primary`, `secondary`, etc.

4. **Color Properties**:
   - `background`: Sets the background color for the app's scaffold. A dark gray color (`Color.fromARGB(255, 20, 20, 20)`) is used to provide a dark appearance.
   - `primary`: Defines the primary color used for major components such as the AppBar and buttons. Here, a medium gray color (`Color.fromARGB(255, 122, 122, 122)`) is chosen.
   - `secondary`: Specifies the secondary color for accenting elements. A darker gray (`Color.fromARGB(255, 30, 30, 30)`) is selected to complement the primary color.
   - `tertiary`: An additional accent color. A slightly lighter gray (`Color.fromARGB(255, 47, 47, 47)`) is used for subtle distinctions.
   - `inversePrimary`: Used for elements that need to stand out against the primary color, such as text or icons on a primary-colored background. A light gray (`Colors.grey.shade300`) is chosen to provide sufficient contrast.

### Additional Notes

- **ARGB Color Format**:
  - `Color.fromARGB(255, R, G, B)`: Creates a color from red, green, blue, and alpha (opacity) components. The first parameter (`255`) represents full opacity, and the subsequent parameters define the color's RGB values.

- **Customizing Themes**:
  - You can further customize the `ThemeData` by adjusting other properties such as `textTheme` for typography, `iconTheme` for icon styles, and more. This allows you to create a cohesive and consistent look throughout your app.

- **Applying the Theme**:
  - To apply this `darkMode` theme to your app, set it in the `MaterialApp` widget's `theme` property:
    ```dart
    MaterialApp(
      theme: darkMode,
      // other properties...
    );
    ```


*/
