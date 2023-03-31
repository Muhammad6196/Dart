import 'dart:math';

double getdistance(double la1, double lo1, double la2, double lo2) {
  double radius = 6378.1;
  double lat = (la2 - la1) * (pi / 180);
  double lon = (lo2 - lo1) * (pi / 180);
  double a = sin(lat / 2) * sin(lat / 2) +
      cos(la1 * (pi / 180)) *
          cos(la2 * (pi / 180)) *
          sin(lon / 2) *
          sin(lon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = radius * c;
  return distance;
}

String findLongest_CommonSubsequence(List<String> string_Array) {
  int shortest_String_Index = 0;
  for (int k = 1; k < string_Array.length; k++) {
    if (string_Array[k].length < string_Array[shortest_String_Index].length) {
      shortest_String_Index = k;
    }
  }
  String shortest_String = string_Array[shortest_String_Index];
  int shortestStringLength = shortest_String.length;
  String lcs = "";
  for (int a = 0; a < shortestStringLength; a++) {
    bool is_Present = true;
    for (int j = 0; j < string_Array.length; j++) {
      if (j == shortest_String_Index) {
        continue;
      }
      if (!string_Array[j].contains(shortest_String[a])) {
        is_Present = false;
        break;
      }
    }
    if (is_Present) {
      lcs += shortest_String[a];
    }
  }
  return lcs;
}

void main() {
  //Create a list of integers and find the longest subsequence of consecutive numbers in the list.
  print('------Longest Sequence------');
  List<int> list = [1, 16, 15, 78, 86, 3, 2, 9, 4];
  list.sort();
  List<int> currentseq = [list[0]];
  List<int> longseq = [list[0]];
  for (int i = 1; i < list.length; i++) {
    if (list[i] == list[i - 1] + 1) {
      currentseq.add(list[i]);
    } else if (currentseq.length > longseq.length) {
      longseq = currentseq;
    } else {
      currentseq = [list[i]];
    }
  }
  print(list);
  print("The Longest Sequence is $longseq");

  //Create a map that associates the names of cities with their latitude and longitude coordinates. Given a starting and ending city, find the shortest distance between them (you can assume a spherical Earth).
  print('\n\n------Distance b/w Cities------');
  Map<String, List<double>> cities = {
    'Karachi': [24.8607, 67.0011],
    'Lahore': [31.5204, 74.3587],
    'Islamabad': [33.6844, 73.0479],
    'Hyderabad': [25.3960, 68.3578],
    'Multan': [30.1575, 71.5249],
    'Faisalabad': [31.4504, 73.1350]
  };
  String startcity = 'Karachi';
  String endcity = 'Islamabad';
  double distance = getdistance(cities[startcity]![0], cities[startcity]![1],
      cities[endcity]![0], cities[endcity]![1]);
  print('Distance Between $startcity and $endcity is $distance');

  //Create a list of maps, where each map represents a product with a name, price, and quantity. Sort the list by the total cost of each product (price x quantity) in descending order.
  print('\n\n------Product Arrangement------');
  List<Map<String, dynamic>> products = [
    {'name': 'Cookie', 'price': 10.0, 'quantity': 5},
    {'name': 'Juice', 'price': 5.0, 'quantity': 10},
    {'name': 'Milk', 'price': 15.0, 'quantity': 3},
    {'name': 'Rice', 'price': 8.0, 'quantity': 7},
  ];

  print("Before Arrangement: \n$products");
  products.sort((a, b) =>
      (b['price'] * b['quantity']).compareTo(a['price'] * a['quantity']));
  print("After Arrangement: \n$products");

  //Create a map that associates the names of countries with their population and area. Find the top 5 largest countries by population density (population / area).
  print('\n\n------Top 5 country with population density------');
  Map<String, List<double>> couintries = {
    'USA': [328.2, 9.834],
    'India': [1393, 3.287],
    'China': [1393, 9.597],
    'Brazil': [213.4, 8.516],
    'Australia': [25.4, 7.692],
    'Russia': [144.5, 17.098]
  };

  Map<String, double> densityList = {};

  for (String country in couintries.keys) {
    double density = couintries[country]![0] / couintries[country]![1];
    densityList.addAll({country: density});
  }
  var sorted = densityList.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  print("The Top 5 Largest countries by Population Density");
  List<MapEntry<String, double>> top5 =
      densityList.entries.toList().take(5).toList();
  for (var entry in top5) {
    print("==================");
    print('Country: ${entry.key}\nDensity: ${entry.value}');
  }

  //Create a list of strings and find the longest common subsequence (substring) among all the strings in the list.
  print('\n\n------Longest Common Sequence------');

  List<String> strings = ["apple", "apology", "aproach", "appointment"];

  String lcs = findLongest_CommonSubsequence(strings);

  print("Longest common subsequence: $lcs");
}
