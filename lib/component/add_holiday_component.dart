library add_holiday_component;

import '../service/holiday.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector: 'add-holiday',
    templateUrl: 'packages/holiday_angular/component/add_holiday_component.html',
    cssUrl: 'packages/holiday_angular/component/add_holiday_component.css',
    applyAuthorStyles: true,
    publishAs: 'ctrl',
    map: const {
      'holiday-list':'<=>holidays',
      'categories-list':'=>categories'
    }
)
class AddHolidayComponent {
  List<Holiday> holidays;
  List categories;

  String title;
  String selectedCategory = '';
  DateTime startDate = new DateTime.now();
  DateTime endDate = new DateTime.now();
  String description;

  void addHoliday(){

    holidays.add(new Holiday(((holidays.length)+1).toString(), title, selectedCategory, startDate, endDate, description, 3));
    title = '';
    description = '';
    selectedCategory = '';

  }

  AddHolidayComponent() {

  }
}