import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ambu_app/widgets/edit_item.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.arrow_back_outline),
        ),
        leadingWidth: 80,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: IconButton(
        //       onPressed: () {},
        //       style: IconButton.styleFrom(
        //         backgroundColor: Colors.lightBlueAccent,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(15),
        //         ),
        //         fixedSize: const Size(60, 50),
        //         elevation: 10,
        //       ),
        //       icon: const Icon(
        //         Ionicons.checkmark,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Edit your account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              EditItem(
                title: '',
                widget: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50, // Adjust the radius as needed
                      backgroundColor: Colors.transparent, // Optional
                      backgroundImage: AssetImage(
                        'assets/great-beki.jpg',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.lightBlueAccent,
                          backgroundColor: Colors.black),
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              EditItem(
                title: 'Name',
                widget: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              EditItem(
                title: 'Gender',
                widget: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Male";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "Male"
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Ionicons.male,
                        color: gender == "Male" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          gender = "Female";
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: gender == "Female"
                            ? Colors.deepPurple
                            : Colors.grey.shade200,
                        fixedSize: const Size(50, 50),
                      ),
                      icon: Icon(
                        Ionicons.female,
                        color: gender == "Female" ? Colors.white : Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              EditItem(
                title: "Email",
                widget: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.2,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // padding: const EdgeInsets.symmetric(horizontal: 50),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
