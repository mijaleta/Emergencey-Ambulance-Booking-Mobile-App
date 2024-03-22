import 'package:ambu_app/widgets/edit_item.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

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
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: const Size(60, 50),
                  elevation: 10,
                ),
                icon: const Icon(
                  Ionicons.checkmark,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              EditItem(
                title: 'Photo',
                widget: Column(
                  children: [
                    Image.asset(
                      '/assets/great-beki.jpg',
                      height: 100,
                      width: 100,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.lightBlueAccent,
                      ),
                      child: const Text('Upload Image'),
                    )
                  ],
                ),
              ),
              const EditItem(title: 'Name', widget: TextField()),
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
              const EditItem(widget: TextField(), title: "Age"),
              const SizedBox(
                height: 40,
              ),
              const EditItem(
                widget: TextField(),
                title: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
