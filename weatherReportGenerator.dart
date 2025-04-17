import 'dart:io';
void main(){
  Map<String,dynamic>weatherData={};
  while(true){
    print('\n....Weather Rport Meanu....');
    print('1.Add city temperature:');
    print('2.View all temperature:');
    print('3.Update temperature for a city:');
    print('4.Delte a city:');
    print('5.Search city temperature:');
    print('6.Show cities above and below a certain temperature:');
    print('7.Show hottest and coldest city:');
    print('8.Show average temperature:');
    print('9.Exit');

    print("Choose an option (1-9):");
    int choose=int.parse(stdin.readLineSync()!);
    switch(choose){
      case 1:
      addTemperature(weatherData);
      break;
      case 2:
      viewTemperature(weatherData);
      break;
      case 3:
      updateTemperature(weatherData);
      break;
      case 4:
      deleteCity(weatherData);
      break;
      case 5:
      serchCity(weatherData);
      break;
      case 6:
      break;
      case 7:
      showHotColdCity(weatherData);
      break;
      case 8:
      showAverageTemperature(weatherData);
      break;
      case 9:
      print("Goodbye!");
      break;
      default:
      print("You choose wrong option.Try again!");
      break;
    }

  }
}




void addTemperature(Map<String,dynamic>data){
  print('Enter city name:');
  String? city=stdin.readLineSync();
  print('Enter temperature in °C:');
  double? temp=double.tryParse(stdin.readLineSync()??'');
  if(city!=null&&city.isNotEmpty&& temp!=null){
    data[city]=temp;
    print("Added: $city $temp");
  }
  else{
    print("Invalid input:");
  }
}



void viewTemperature(Map<String,dynamic>data){
  if(data.isEmpty){
    print("Nothing to add! Add first city and temperature!");
  }
  print("City temperature!");
  data.forEach((key, value) {
    print("City is : $key Temperature is : $value");
  });
}



void updateTemperature(Map<String,dynamic>data){
   if(data.isEmpty){
    print("Nothing to add! Add first city and temperature!");
  }

  print("Enter city name to update:");
  String? city=stdin.readLineSync();
  if(data.containsKey(city)){
    print("Enter new temperature:");
    double? temp=double.tryParse(stdin.readLineSync()??'');
    if(temp!=null){
      data[city!]=temp;
      print('City $city updated temperature is: $temp °C.');
    }
    else{
      print('Invalid temperature. Try again!');
      }
  }
  else{
    print('Invalid! City name not found. Try again!');
    }
}



void deleteCity(Map<String,dynamic>data){
  if(data.isEmpty){
    print("Nothing to add! Add first city and temperature!");
  }
  
  print("Enter city name which want to delete:");
  String? city=stdin.readLineSync();
  if(city!=null&&city.isNotEmpty&&data.containsKey(city)){
    data.remove(city);
    print("City $city is sucessfully remove or deleted!");
  }
  else{
    print("Invalid! This city is not found. Try again!");
  }
}




void serchCity(Map<String,dynamic>data){
  if(data.isEmpty){
    print("Nothing to add! Add first city and temperature!");
  }
  else{
    print("Enter the city name to search:");
    String? city=stdin.readLineSync();
    if(data.containsKey(city)){
      print("City name is $city and temperature is ${data[city]} °C");
    }
  }
}




void showHotColdCity(Map<String,dynamic>data){
  if(data.isEmpty){
    print("Nothing to add! Add first city and temperature!");

  }
  String hottestCity=data.keys.first;
  String coldestCity=data.keys.first;
  double maxTemperature=data[hottestCity];
  double miniTemperature=data[coldestCity];
  data.forEach((city,temp) { 
    if(temp>maxTemperature){
      hottestCity=city;
      maxTemperature=temp;
    }
    if(temp<maxTemperature){
      coldestCity=city;
      miniTemperature=temp;
    }
    print("Hotest City: $hottestCity $maxTemperature °C ");
    print("Hotest City: $coldestCity $miniTemperature °C ");

  });
}




void showAverageTemperature(Map<String,dynamic>data){
  if(data.isEmpty){
        print("Nothing to add! Add first city and temperature!");
  }

  double total=0;
  data.forEach((_, temp) {
    total +=temp;
  });
  double average=total/data.length;
  print("Average temperature: ${average.toStringAsFixed(2)}");
}