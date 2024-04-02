import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class RegisterAmbulance extends StatefulWidget {
  const RegisterAmbulance({super.key});

  @override
  State<RegisterAmbulance> createState() => _RegisterAmbulanceState();
}

class _RegisterAmbulanceState extends State<RegisterAmbulance> {
  // bool _isGPSEnabled = false;
  // String? _selectedAmbulanceType;
  // String? _selectedSeatingCapacity;
  // String? _selectedAmbulanceStatus;

  final ambulanceTypesList = [
    'Basic Life Support (BLS)',
    'Advanced Life Support (ALS)',
    'Critical Care Transport (CCT)',
    'Neonatal Intensive Care Unit (NICU) Ambulance',
    'Air Ambulance',
    'Emergency Medical Responder (EMR) Vehicle',
  ];
  final seatingCapacityList = [
    '1 (Driver only)',
    '2 (Driver and 1 passenger)',
    '3 (Driver and 2 passengers)',
    '4 (Driver and 3 passengers)',
    '5 (Driver and 4 passengers)',
    '6 (Driver and 5 passengers)',
    '7 (Driver and 6 passengers)',
    'Custom (for ambulances with specialized seating configurations)',
  ];
  final ambulanceStatusLists = [
    'In Service',
    'Out of Service',
    'On Standby',
    'Under Maintenance',
    'Under Repair',
    'Dispatched',
    'Returning to Base',
    'Available',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _header(context),
              const SizedBox(
                height: 20,
              ),
              _inputField(context),

              const SizedBox(
                height: 20,
              ),
              // Drop down Fields
              // DropdownSearch(
              //     controller: _selectedAmbulanceType,
              //     hintText: "Ambulance Types",
              //     enabled: true,
              //     itemsVisibleInDropdown: 6,
              //     items: ambulanceTypes,
              //     onValueChanged: (value) {
              //       setState(() {
              //         SelectAmbulance = value;
              //       });
              //     }),
              DropdownButton(items: [], onChanged: (val) {})
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "REGISTER AMBULANCE",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 164, 152, 44)),
        ),
      ],
    );
  }

  _inputField(context) {
    return Container(
      // Wrap Column with Container
      height: MediaQuery.of(context).size.height, // Set a finite height
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Ambulance ID",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Registration Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
        //           Row(
        // children: [
        //     Expanded(
        //       child: DropdownButtonFormField<String>(
        //         decoration: InputDecoration(
        //           hintText: "Ambulance Type",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(18),
        //             borderSide: BorderSide.none,
        //           ),
        //           fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        //           filled: true,
        //         ),
        //         value: _selectedAmbulanceType,
        //         items: <String>[
        //           'Basic Life Support (BLS)',
        //           'Advanced Life Support (ALS)',
        //           'Critical Care Transport (CCT)',
        //           'Neonatal Intensive Care Unit (NICU) Ambulance',
        //           'Air Ambulance',
        //           'Emergency Medical Responder (EMR) Vehicle',
        //         ].map((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             _selectedAmbulanceType = newValue;
        //           });
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: DropdownButtonFormField<String>(
        //         decoration: InputDecoration(
        //           hintText: "Seating Capacity",
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(18),
        //             borderSide: BorderSide.none,
        //           ),
        //           fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        //           filled: true,
        //         ),
        //         value: _selectedSeatingCapacity,
        //         items: <String>[
        //           '1 (Driver only)',
        //           '2 (Driver and 1 passenger)',
        //           '3 (Driver and 2 passengers)',
        //           '4 (Driver and 3 passengers)',
        //           '5 (Driver and 4 passengers)',
        //           '6 (Driver and 5 passengers)',
        //           '7 (Driver and 6 passengers)',
        //           'Custom (for ambulances with specialized seating configurations)',
        //         ].map((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             _selectedSeatingCapacity = newValue;
        //           });
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // DropdownButtonFormField<String>(
        //   decoration: InputDecoration(
        //     hintText: "Ambulance Status",
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(18),
        //       borderSide: BorderSide.none,
        //     ),
        //     fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
        //     filled: true,
        //   ),
        //   value: _selectedAmbulanceStatus,
        //   items: <String>[
        //     'In Service',
        //     'Out of Service',
        //     'On Standby',
        //     'Under Maintenance',
        //     'Under Repair',
        //     'Dispatched',
        //     'Returning to Base',
        //     'Available',
        //   ].map((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        //   onChanged: (String? newValue) {
        //     setState(() {
        //       _selectedAmbulanceStatus = newValue;
        //     });
        //   },
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // Row(
        //   children: [
        //     const Expanded(
        //       child: Text(
        //         'GPS Integration',
        //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Switch(
        //       value: _isGPSEnabled,
        //       onChanged: (bool newValue) {
        //         setState(() {
        //           _isGPSEnabled = newValue;
        //         });
        //       },
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // Row(
        //   children: [
        //     const Text(
        //       "Attach Document",
        //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //     ),
        //     const SizedBox(
        //       width: 5,
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         // Navigator.push(
        //         //     context, MaterialPageRoute(builder: (context) => Login()));
        //       },
        //       style: ElevatedButton.styleFrom(
        //         side: const BorderSide(color: Colors.black, width: 2),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //       ).copyWith(
        //         backgroundColor: MaterialStateProperty.all(Colors.white),
        //         foregroundColor: MaterialStateProperty.all(Colors.black),
        //       ),
        //       child: const Padding(
        //         padding: EdgeInsets.all(12.0),
        //         child: Text(
        //           "Browse",
        //           style: TextStyle(fontSize: 18),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // ElevatedButton(
        //   onPressed: () {},
        //   style: ElevatedButton.styleFrom(
        //     padding: const EdgeInsets.symmetric(vertical: 16),
        //     backgroundColor: Colors.blue,
        //   ),
        //   child: const Text(
        //     'Register',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

final _selectedAmbulanceType = TextEditingController();
final _selectedSeatingCapacity = TextEditingController();
final _selectedAmbulanceStatus = TextEditingController();

String SelectAmbulance = "";

List<String> ambulanceTypes = [
  'Basic Life Support (BLS)',
  'Advanced Life Support (ALS)',
  'Critical Care Transport (CCT)',
  'Neonatal Intensive Care Unit (NICU) Ambulance',
  'Air Ambulance',
  'Emergency Medical Responder (EMR) Vehicle',
];
List<String> seatingCapacity = [
  '1 (Driver only)',
  '2 (Driver and 1 passenger)',
  '3 (Driver and 2 passengers)',
  '4 (Driver and 3 passengers)',
  '5 (Driver and 4 passengers)',
  '6 (Driver and 5 passengers)',
  '7 (Driver and 6 passengers)',
  'Custom (for ambulances with specialized seating configurations)',
];
List<String> ambulanceStatus = [
  'In Service',
  'Out of Service',
  'On Standby',
  'Under Maintenance',
  'Under Repair',
  'Dispatched',
  'Returning to Base',
  'Available',
];
