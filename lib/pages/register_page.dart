import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textField.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _confirmPasswordField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();

  String? selectedEducationLevel;

  // List of education levels
  final List<String> educationLevels = [
    'High School',
    'Associate Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctoral Degree',
  ];

  // Variable to hold selected file name or path
  String? fileName;

  // Function to pick a file
  Future<void> pickFile() async {
    // Use FilePicker to pick a file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // If a file is selected, get the file name
      setState(() {
        fileName = result
            .files.single.name; // Or use result.files.single.path for file path
      });
    } else {
      // Handle the case when no file is selected
      setState(() {
        fileName = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.app_registration,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Fill out the form carefully.",
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            controller: _emailField,
            hintText: "Email",
            obscureText: false,
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            controller: _passwordField,
            hintText: "Full Name",
            obscureText: true,
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            controller: _confirmPasswordField,
            hintText: "Education Level",
            obscureText: true,
          ),

          // Education Level Dropdown with custom style
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: DropdownButtonFormField<String>(
              value: selectedEducationLevel,
              hint: Text('Select Education Level'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEducationLevel = newValue;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your education level';
                }
                return null;
              },
              items:
                  educationLevels.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                hintText: 'Select Education Level',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.tertiary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),

          MyButton(
            text: fileName ?? 'Upload You CV and Certifications',

            onTap: pickFile,

            // Button to pick a file
          ),
          SizedBox(
            height: 25,
          ),

          MyButton(
            text: "Register",
            onTap: () {},
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'already Registered',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  'Login now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
