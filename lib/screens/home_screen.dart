import 'package:flutter/cupertino.dart';
import 'meditation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMinutes = 5;
  final List<int> _durations = [1, 3, 5, 10, 15, 20, 30, 45, 60];

  void _startMeditation() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => MeditationScreen(durationMinutes: _selectedMinutes),
      ),
    );
  }

  void _showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    _selectedMinutes = _durations[index];
                  });
                },
                scrollController: FixedExtentScrollController(
                  initialItem: _durations.indexOf(_selectedMinutes),
                ),
                children: List<Widget>.generate(_durations.length, (int index) {
                  return Center(
                    child: Text(
                      '${_durations[index]} min',
                    ),
                  );
                }),
              ),
            ),
            CupertinoButton(
              child: const Text('Done'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Meditate'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.sparkles,
                size: 80,
                color: CupertinoColors.activeBlue,
              ),
              const SizedBox(height: 40),
              const Text(
                'Choose Duration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                color: CupertinoColors.systemGrey5.resolveFrom(context),
                onPressed: _showPicker,
                child: Text(
                  '$_selectedMinutes minutes',
                  style: TextStyle(
                    color: CupertinoColors.label.resolveFrom(context),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              CupertinoButton.filled(
                onPressed: _startMeditation,
                borderRadius: BorderRadius.circular(30),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Text(
                    'Start Session',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
