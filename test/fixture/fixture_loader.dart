import 'dart:io';

///Load a file from the ../test/fixture/ folder.
String fixture(String filename) => File('test/fixture/$filename').readAsStringSync();