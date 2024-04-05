import 'package:flutter/material.dart';

class DispatcherManagementPage extends StatefulWidget {
  const DispatcherManagementPage({Key? key}) : super(key: key);

  @override
  _DispatcherManagementPageState createState() =>
      _DispatcherManagementPageState();
}

class _DispatcherManagementPageState extends State<DispatcherManagementPage> {
  List<String> dispatcherList = [
    'Dispatcher 1',
    'Dispatcher 2',
    'Dispatcher 3'
  ]; // Example dispatcher list
  TextEditingController _dispatcherController = TextEditingController();
  bool _isEditing = false;
  late String _editedDispatcher;
  List<String> selectedAmbulances =
      []; // Stores selected ambulances for assignment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dispatcher Management'),
      ),
      body: ListView.builder(
        itemCount: dispatcherList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(dispatcherList[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                      _editedDispatcher = dispatcherList[index];
                      _dispatcherController.text = _editedDispatcher;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isEditing = false;
            _dispatcherController.clear();
            selectedAmbulances.clear();
          });
          _showAddDispatcherDialog(context);
        },
        child: Icon(Icons.add),
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
                decoration: InputDecoration(
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
                  'Ambulance 1',
                  'Ambulance 2',
                  'Ambulance 3'
                ] // Example ambulance list
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
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
              child: Text('Cancel'),
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
