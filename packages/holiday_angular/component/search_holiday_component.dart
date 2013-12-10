library search_holiday_component;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'search-holiday',
    templateUrl: 'packages/holiday_angular/component/search_holiday_component.html',
    cssUrl: 'packages/holiday_angular/component/search_holiday_component.css',
    publishAs: 'ctrl',
    map: const {
      'title-filter-string': '<=>titleFilterString',
      'category-filter-map' : '<=>categoryFilterMap'
    }
)
class SearchHolidayComponent {
  String titleFilterString = "";
  Map categoryFilterMap;

  get categories {
    return categoryFilterMap.keys.toList();
  }

  void clearFilters() {
    categoryFilterMap.keys.forEach((f) => categoryFilterMap[f] = false);
    titleFilterString = "";
  }
}