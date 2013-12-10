library category_filter;

import 'package:angular/angular.dart';

@NgFilter(name: 'categoryfilter')
class CategoryFilter {
  call(holidayList, filterMap) {
    if (holidayList is List && filterMap != null && filterMap is Map) {
      // If there is nothing checked, treat it as "everything is checked"
      bool nothingChecked = filterMap.values.every((isChecked) => !isChecked);
      if (nothingChecked) {
        return holidayList.toList();
      }
      return holidayList.where((i) => filterMap[i.category] == true).toList();
    }
  }
}

