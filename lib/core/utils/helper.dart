import 'package:flutter/foundation.dart';

logMe(Object? obj, {String tag = 'log'}) {
  /* 
    use this for print something, its run only on debug mode.
  */
  if (kDebugMode) {
    print('$tag :$obj');
  }
}
