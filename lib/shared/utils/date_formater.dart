String formatDate(String date) {
  List temp = date.split(' ');
  temp = temp[0].split('-');
  return temp.length == 3 ? ('${temp[2]}/${temp[1]}/${temp[0]}') : date;
}

String formatStringForDateTimeParse(String date) {
  return ('$date 00:00:00.000');
}
