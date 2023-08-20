import 'package:flutter/material.dart';
import 'package:mass_qr/models/settings.dart';
import 'package:mass_qr/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:mass_qr/utils/custom_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();

}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    SettingsModel settings = Provider.of<SettingsModel>(context, listen: false);
    return Scaffold(
      appBar: customAppBar(
        "Multi QR | Settings",
        hvBack: true
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Blur Level'),
            Slider(
              value: settings.blurValue,
              min: 0.0,
              max: 10.0,
              onChanged: (value) {
                setState(() {
                  settings.updateBlurValue(value);
                });
              },
              label: 'Blur: ${settings.blurValue.toInt()}',
              divisions: 10,
              semanticFormatterCallback: (value) => '${value.round()}',
            ),
            SizedBox(height: 24.0),
            Text('Speech Rate'),
            Slider(
              value: settings.speechRate,
              min: 0.0,
              max: 2.0,
              onChanged: (value) {
                setState(() {
                  settings.updateSpeechRate(value);
                });
              },
              label: 'Speech Rate: ${settings.speechRate.toStringAsFixed(1)}',
              divisions: 20,
              semanticFormatterCallback: (value) => '${value.toStringAsFixed(
                  1)}',
            ),
            Row(
              children:[
            Expanded(
              child: ElevatedButton(
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    print(prefs.getKeys());

                    print(prefs.getString("authToken"));
                    await prefs.remove('authToken');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text('Logout')),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}