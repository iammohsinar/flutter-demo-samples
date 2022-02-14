//
// @ Author: Mohsin AR
// @ Email: mohsinazeemrind@gmail.com
// @ Github: https://github.com/iammohsinar
// @ Create Time: 04-12-2021 02:18:58
// @ Modified time: 10-02-2022 00:44:07
//

class AppDate {
  static DateTime format(String date) {
    List splitDate = date.split('-');
    return DateTime(int.parse(splitDate[2]), int.parse(splitDate[1]), int.parse(splitDate[0]));
  }
}
