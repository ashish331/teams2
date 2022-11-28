import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'teams_model.dart';

class TeamsController extends GetxController {
  Teams? teams;
  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getTeamList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getTeamList() async {
    isLoading.value = true;
    var headers = {
      'authtoken':
          'eyJhbGciOiJSUzI1NiIsImtpZCI6ImE5NmFkY2U5OTk5YmJmNWNkMzBmMjlmNDljZDM3ZjRjNWU2NDI3NDAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2OTY0Nzc1MywidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY5NjQ3NzUzLCJleHAiOjE2Njk2NTEzNTMsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.OrzGiEqFeXVYX9FZ7xSFeQU_aZwju_f6OYIBRYiAQn1D5qgm4UdVNCBgFh9n2hlXwWrlYZi8PibtJZ2reSqg89f92cIJ1pDjLmUH7K-wA0bE9YrTKUuqzA8_s0Op_x4T2c104hxJ2qkUWlztDpT99wKlxf2YIEsSzwpfFzpxX9f0cTnlrry5Dv4VemlEGvVrFEHFUdwSkFgffpwyKxiKILo6fbK7ML0lnlhj9lsBPjusB7W64PSARzZGmbgxK0fOoZXhtSegCGcGpNuo0sYpBUhaxvAvisnPKnINo1-D4PMy56NJwQj8Jhc-92RbEYyKEkxCnqlHvUtn366MT2ZK6w'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/company/6dc9858b-b9eb-4248-a210-0f1f08463658/teams'));
   // request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var a = (await response.stream.bytesToString());

      teams = teamsFromJson(a);
      isLoading.value = false;
    } else {
     // print(response.reasonPhrase);
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
