import 'package:angular/angular.dart';

import 'package:holiday_angular/holiday_manager.dart';
import 'package:holiday_angular/component/search_holiday_component.dart';
import 'package:holiday_angular/component/view_holiday_component.dart';
import 'package:holiday_angular/component/add_holiday_component.dart';
import 'package:holiday_angular/filter/category_filter.dart';


class MyAppModule extends Module {
  MyAppModule() {
    type(HolidayManagerController);
    type(SearchHolidayComponent);
    type(CategoryFilter);
    type(ViewHolidayComponent);
    type(AddHolidayComponent);
  }
}

main() {

  ngBootstrap(module: new MyAppModule());
}