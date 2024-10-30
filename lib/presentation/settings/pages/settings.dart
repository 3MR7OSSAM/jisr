import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import 'package:jisr/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Define state for each day toggle
  Map<String, bool> workOffDays = {
    'Sunday': false,
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': true,
    'Saturday': true,
  };

  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            const Text('Settings',style: TextStyle(fontSize: 30),),
            SizedBox(height: 10.h,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.beach_access,color: Colors.black54,),
                SizedBox(width: 8),
                Text('Work off days', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
            const Divider(),
            ...workOffDays.keys.map((day) {
              return SwitchListTile(
                activeColor: AppColors.whiteColor,
                activeTrackColor:  AppColors.primary,
                inactiveThumbColor: AppColors.grey,
                inactiveTrackColor: AppColors.grey.withOpacity(0.5),
                title: Text(day),
                value: workOffDays[day]!,
                onChanged: (bool value) {
                  setState(() {
                    workOffDays[day] = value;
                  });
                },
              );
            }),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              trailing: Text(language),
              onTap: () {
                // Language change logic here
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Log out logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
