class Utils {

  static bool checkEmptyValue(Map map, String key) =>
      map.containsKey(key) && map[key].isNotEmpty;
}