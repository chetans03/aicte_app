import 'package:aicte/screens/confirmpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 130, 230),
      body: Center(
        child: Form(
          // key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  "images/aicte.png",
                ),
              ),
              const Text(
                "AICTE Feedback App",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Register",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Faculty ID",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    label: Text("Faculty ID"),
                    contentPadding: EdgeInsets.all(20),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 0) {
                      return "Please enter the correct ID";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (newValue) {
                  //   id = newValue!;
                  // },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "OTP",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: TextFormField(
                          // obscureText: _isHidden ? false : true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("OTP"),
                            contentPadding: EdgeInsets.all(20),
                            // suffix: InkWell(
                            //   onTap: _togglePasswordView,
                            //   child: Icon(
                            //     _isHidden ? Icons.visibility : Icons.visibility_off,
                            //   ),
                            // ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.trim().length < 0) {
                              return "Please enter correct password";
                            } else {
                              return null;
                            }
                          },
                          // onSaved: (newValue) {
                          //   password = newValue!;
                          // },
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Send OTP"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => ConfirmPassword(),
                    ),
                  );
                },
                child: Text("Vefify"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
