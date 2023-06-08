import 'dart:developer';
import 'dart:io';

checkInternet() async {
  log('in check intennrnt');
  try {
    // var result = await InternetAddress.lookup('google.com');
    if (true) {
      log('true');
      return true;
    }
  } on SocketException catch (e) {
    log('false');
    return false;
  }
}
