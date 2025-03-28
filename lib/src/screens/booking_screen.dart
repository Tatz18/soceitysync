import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
              child: TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(color: AppColors.lightBlue, shape: BoxShape.circle),
                  selectedDecoration: BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildAmenityCard(context, 'Community Hall', '10 AM - 12 PM'),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityCard(BuildContext context, String name, String time) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Available: $time', style: const TextStyle(color: AppColors.grey)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ActionButton(
                text: 'Book',
                onPressed: () => _book(context, name),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _book(BuildContext context, String name) {
    if (_selectedDay == null) {
      _showSnackBar(context, 'Please select a date!');
      return;
    }
    _showSnackBar(context, '$name booked for ${_selectedDay!.toLocal().toString().split(' ')[0]}');
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}