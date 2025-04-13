String calculateDuration(String start, String end) {
  try {
    final startTime = DateTime.parse(start);
    final endTime = DateTime.parse(end);
    final duration = endTime.difference(startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  } catch (_) {
    return "Invalid time";
  }
}
