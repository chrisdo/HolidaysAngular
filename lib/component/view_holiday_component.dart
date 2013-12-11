library view_holiday_component;

import '../service/holiday.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector: 'view-holiday',
    templateUrl: 'packages/holiday_angular/component/view_holiday_component.html',
    cssUrl: 'packages/holiday_angular/component/view_holiday_component.css',
    applyAuthorStyles: true,
    publishAs: 'ctrl',
    map: const {
      'holiday-item':'<=>holiday'
    }
)
class ViewHolidayComponent {
  Holiday holiday;

  String dateFormatString = "dd.MM.yyyy";



  ViewHolidayComponent() {

  }
}