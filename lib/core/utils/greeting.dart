/// Time-of-day line used by the home header.
///
/// The wireframe shows "GOOD MORNING" as the pattern.
abstract final class Greeting {
  static String forHour(int hour) {
    if (hour < 12) {
      return 'GOOD MORNING';
    }
    if (hour < 17) {
      return 'GOOD AFTERNOON';
    }
    return 'GOOD EVENING';
  }
}
