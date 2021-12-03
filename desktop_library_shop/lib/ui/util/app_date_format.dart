class AppDate {
  static DateTime format(String date) {
    List splitDate = date.split('-');
    return DateTime(int.parse(splitDate[2]), int.parse(splitDate[1]), int.parse(splitDate[0]));
  }
}
