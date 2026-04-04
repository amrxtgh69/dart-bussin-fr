import 'dart:io';
import 'package:cli/cli.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Hello Dario");
  } else if (arguments.first == "version") {
    print("Dartpedia CLI version $version");
  } else if (arguments.first == "search") { 
    /* `arguments.sublist(1)` creates the list containing all elements
     *  of argument after the first element (search)
    */
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null; 
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
  final String? articleTitle;

  // if the user didn't pass any arguments then request an article title 
  if (arguments == null || arguments.isEmpty) {
    print("Please provide article title");
    // await user input and provide a default empty '' string if the input is null
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // join the list into the single string 
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


Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.http(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  }
  return "Error, failed to fetch article $articleTitle. Status code: ${response.statusCode}";
}