// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DispatcherManagementPage extends StatefulWidget {
  const DispatcherManagementPage({super.key});

  @override
  _DispatcherManagementPageState createState() =>
      _DispatcherManagementPageState();
}

class _DispatcherManagementPageState extends State<DispatcherManagementPage> {
  List<String> dispatcherList = [
    'Samuel Mokonnon',
    'Mihretu Jaleta',
    'Hailu Gudeta',
    'Feyisa Gizaw',
    'Daniel Tamiru',
    'Nagasa Geneti',
  ]; // Example dispatcher list
  final TextEditingController _dispatcherController = TextEditingController();
  bool _isEditing = false;
  late String _editedDispatcher;
  List<String> selectedAmbulances =
      []; // Stores selected ambulances for assignment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Dispatcher Management',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/specialist-female-doctor-copy-space.jpg"), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: dispatcherList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                dispatcherList[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22, // Adjust the font size as needed
                  fontFamily: 'serif', // Use 'serif' as the font family
                ),
              ),
              // style: TextStyle(fontSize: 18, fontFamily: 'serif',),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                        _editedDispatcher = dispatcherList[index];
                        _dispatcherController.text = _editedDispatcher;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        dispatcherList.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isEditing = false;
            _dispatcherController.clear();
            selectedAmbulances.clear();
          });
          _showAddDispatcherDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDispatcherDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_isEditing ? 'Edit Dispatcher' : 'Add Dispatcher'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _dispatcherController,
                decoration: const InputDecoration(
                  hintText: 'Enter dispatcher name',
                ),
              ),
              DropdownButtonFormField(
                value: selectedAmbulances.isNotEmpty
                    ? selectedAmbulances[0]
                    : null,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedAmbulances.clear();
                    selectedAmbulances.add(newValue!);
                  });
                },
                items: <String>[
                  'Basic Life Support (BLS)',
                  'Advanced Life Support (ALS)',
                  'Critical Care Transport (CCT)',
                  'Air Ambulance',
                  'Emergency Medical Responder',
                  //  (EMR) Vehicle'
                ] // Example ambulance list
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  hintText: 'Select ambulance',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_isEditing) {
                    dispatcherList[dispatcherList.indexOf(_editedDispatcher)] =
                        _dispatcherController.text;
                  } else {
                    dispatcherList.add(_dispatcherController.text);
                  }
                });
                Navigator.pop(context);
              },
              child: Text(_isEditing ? 'Save' : 'Add'),
            ),
          ],
        );
      },
    );
  }
}
