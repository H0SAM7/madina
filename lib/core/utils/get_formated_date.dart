String getFormattedDateTime({required String createdAt}) {
  // Parse the string to DateTime
  DateTime parsedDate = DateTime.parse(createdAt);

  // Extract day, month, year, hour, and minute
  int day = parsedDate.day;
  String month = _getMonthName(parsedDate.month);
  int year = parsedDate.year;
  int hour = parsedDate.hour;
  int minute = parsedDate.minute;

  // Determine if the time is PM and adjust hour for 12-hour format
  String period = hour >= 12 ? 'م' : 'ص'; // م for PM, ص for AM
  hour = hour % 12;
  hour = hour == 0 ? 12 : hour; // Convert hour '0' to '12'

  // Format minute to ensure two digits
  String formattedMinute = minute.toString().padLeft(2, '0');

  // Return the formatted string in Arabic
  return '$day $month $year $hour:$formattedMinute $period';
}

// Helper function to get Arabic month name
String _getMonthName(int month) {
  const List<String> months = [
    'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
    'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
  ];
  return months[month - 1];
}


  String formatHijriDate(String hijriDate) {
    // Split the date and time
    List<String> parts = hijriDate.split(' - ');
    if (parts.length != 2) return hijriDate; // Fallback if format is unexpected

    String datePart = parts[0]; // "الثلاثاء 15 ذوالقعدة 1446"
    String timePart = parts[1]; // "08:03:03"

    // Optionally reformat the time (e.g., convert 24-hour to 12-hour with AM/PM in Arabic)
    List<String> timeComponents = timePart.split(':');
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);
    int second = int.parse(timeComponents[2]);
    String period = hour >= 12 ? 'م' : 'ص'; // م for PM, ص for AM
    hour = hour % 12 == 0 ? 12 : hour % 12;
    String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';

    return '$datePart\n'; // Display date and time on separate lines
  }