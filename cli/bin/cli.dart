import 'dart:io';
import 'package:cli/cli.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Hello Dario");
  } else if (arguments.first == "version") {
    print("Dartpedia CLI version $version");
  } else if (arguments.first == "search") {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print("Please provide article title");
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

  print("Looking for an article about '$articleTitle'. Please wait.");
  print("Here ya go!");
  print("Pretend this is an article about '$articleTitle'");
}
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

