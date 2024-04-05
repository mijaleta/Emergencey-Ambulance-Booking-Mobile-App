import 'package:flutter/material.dart';

class AmbulanceFleetManagementPage extends StatefulWidget {
  const AmbulanceFleetManagementPage({Key? key}) : super(key: key);

  @override
  _AmbulanceFleetManagementPageState createState() =>
      _AmbulanceFleetManagementPageState();
}

class _AmbulanceFleetManagementPageState
    extends State<AmbulanceFleetManagementPage> {
  List<String> ambulanceList = [
    'Ambulance 1',
    'Ambulance 2',
    'Ambulance 3'
  ]; // Example ambulance list
  TextEditingController _ambulanceController = TextEditingController();
  bool _isEditing = false;
  late String _editedAmbulance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Ambulance Fleet Management',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: ambulanceList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(ambulanceList[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = true;
                      _editedAmbulance = ambulanceList[index];
                      _ambulanceController.text = _editedAmbulance;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      ambulanceList.removeAt(index);
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
            _ambulanceController.clear();
          });
          _showAddAmbulanceDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddAmbulanceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_isEditing ? 'Edit Ambulance' : 'Add Ambulance'),
          content: TextFormField(
            controller: _ambulanceController,
            decoration: InputDecoration(
              hintText: 'Enter ambulance name',
            ),
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
                    ambulanceList[ambulanceList.indexOf(_editedAmbulance)] =
                        _ambulanceController.text;
                  } else {
                    ambulanceList.add(_ambulanceController.text);
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
