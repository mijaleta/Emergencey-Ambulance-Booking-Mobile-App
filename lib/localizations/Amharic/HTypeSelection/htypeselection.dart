import 'package:flutter/material.dart';
import 'package:ambu_app/pages/special_request_page.dart';
import 'package:flutter/widgets.dart';

import '../../../pages/patient_req_example.dart';
import '../HSpecialrequest/hspecialrequest.dart';

class HEmergencyTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "የአደጋውን አይነት መምረጥ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/mobile5.jpg',
            ), // Change the path to your image
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestAmbulancePage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'አምቡላንስ ይጠይቁ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RequestAmbulancePage(),
                            ),
                          );
                        },
                        child: Text(
                          "ጥያቄ ጀምር",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'አምቡላንስ ከመጠየቅዎ በፊት ደህንነትዎን ያረጋግጡ እና አስፈላጊ ዝርዝሮችን ያቅርቡ.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'ተረጋግተህ ሁኔታውን ገምግም።',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'ማንኛውንም ጉዳት ያረጋግጡ እና ከተቻለ መሰረታዊ የመጀመሪያ እርዳታ ያቅርቡ።',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black),
              title: Text(
                'ትክክለኛ የአካባቢ ዝርዝሮችን ያቅርቡ እና የአደጋ ጊዜን በግልፅ ይግለጹ።',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HSpecialRequestPage(),
                      ),
                    );
                  },
                  child: Text(
                    "ልዩ ጥያቄ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
