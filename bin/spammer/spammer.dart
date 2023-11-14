import 'dart:io';
import 'package:http/http.dart' as http;

class Spammer {
  String url = '';
  String token = '';
  var timesToRun = 1;
  int count = 1;

  void startApp() async {
    stdout.write('Enter url:   ');
    url = stdin.readLineSync().toString();

    stdout.write('Enter token:   ');
    token = stdin.readLineSync().toString();

    stdout.write('How many calls:   ');
    timesToRun = int.parse(stdin.readLineSync().toString());
    
    runSpam(url, token);
  }

  void runSpam(String url, String token) async {
    for (int i = 0; i < timesToRun; i++) {
      var headers = {'Authorization': 'Bearer $token'};
      http.Request request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);

      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          print('${count++} Successful');
          // print(await response.stream.bytesToString());
        } else {
          print('${count++} Error if statement');
          print(response.reasonPhrase);
        }
      } catch (e) {
        print('${count++} Error catch block');
        print(e.toString());
      }
    }
  }
}
