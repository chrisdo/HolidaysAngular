library holiday_manager_controller;

import 'package:angular/angular.dart';

import 'service/holiday.dart';

@NgController(
    selector: '[holiday-manager]',
    publishAs: 'ctrl')
class HolidayManagerController {

  Http _http;
  static const String LOADING_MESSAGE = "Loading holiday manager...";
  static const String ERROR_MESSAGE = """Sorry! Holiday Manager is currently on holidays""";

  int selected = 0;

  String message = LOADING_MESSAGE;
  bool holidaysLoaded = false;
  bool categoriesLoaded = false;

// Data objects that are loaded from the server side via json
  List categories = [];
  List<Holiday> holidays = [];

  // Filter box
  Map<String, bool> categoryFilterMap = {};
  String titleFilter = "";

  String dateFilter = "dd.MM.yyyy";

  Holiday holidayToAdd = new Holiday("","","Just for fun",new DateTime.now(), new DateTime.now(),"", 1);

  HolidayManagerController(Http this._http) {
    _loadData();
  }



  Holiday selectedHoliday;

  void addHoliday(){
    holidays.add(holidayToAdd);
    holidayToAdd = new Holiday("","","Just for fun",new DateTime.now(), new DateTime.now(),"", 1);
    print('clicked');
  }

  void selectHoliday(Holiday holiday) {
    selectedHoliday = holiday;
  }

  void _loadData() {
    holidaysLoaded = false;
    categoriesLoaded = false;
    _http.get('holidays.json')
      .then((HttpResponse response) {
      print(response);
        for (Map holiday in response.data) {
          holidays.add(new Holiday.fromJsonMap(holiday));
        }
        holidaysLoaded = true;
      },
      onError: (Object obj) {
        print(obj);
        holidaysLoaded = false;
        message = ERROR_MESSAGE;
      });

    _http.get('categories.json')
        .then((HttpResponse response) {
      print(response);
      for (String category in response.data) {
        categories.add(category);
        categoryFilterMap[category] = false;
      }
      categoriesLoaded = true;
    },
    onError: (Object obj) {
      print(obj);
      categoriesLoaded = false;
      message = ERROR_MESSAGE;
    });
  }


}