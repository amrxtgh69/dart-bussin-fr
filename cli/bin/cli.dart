import 'package:cli/cli.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Hello Dario");
  } else if (arguments.first == "version") {
    print("Dartpedia CLI version $version");
  } else if (arguments.first == "search") {
    print("The search command is recognized.");
  } else {
    printUsage();
  }
}
void searchWikipedia(List<String>? arguements) {
  print("searchWikipedia recieved arguments: $arguements");
}
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}

