import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_03/presentation/provider/schedule_provider.dart';

class SettingView extends StatelessWidget {
  static const String routeName = '/setting';
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Consumer<ScheduleProvider>(
        builder: (context, schedule, child) => ListTile(
          title: const Text('Schedule Restaurant'),
          trailing: Switch.adaptive(
            value: schedule.isScheduled,
            onChanged: (value) async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Alarm actived'),
                ),
              );
              await schedule.scheduleRestaurant(value);
            },
          ),
        ),
      ),
    );
  }
}
