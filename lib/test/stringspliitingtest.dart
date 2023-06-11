import 'dart:core';

void main() {

  void splitString(String input, List<String> droppedItems, List<String> otherPortions) {
    RegExp regExp = RegExp(r'{(.*?)}');
    Iterable<Match> matches = regExp.allMatches(input);
    int currentIndex = 0;

    for (Match match in matches) {
      int matchIndex = match.start;
      String portion = input.substring(currentIndex, matchIndex).trim();

      if (portion.isNotEmpty) {
        otherPortions.add(portion);
      }

      String? droppedItem = match.group(1);
      droppedItems.add(droppedItem!.trim());

      currentIndex = match.end;
    }

    String lastPortion = input.substring(currentIndex).trim();
    if (lastPortion.isNotEmpty) {
      otherPortions.add(lastPortion);
    }
  }



  String longString = 'This is a long string. {Split} it by the [symbols] and add { gg }each portion to a list.';

  List<String> ContentImageSequence = [];
  List<String> ContentSegments = [];

  splitString(longString, ContentImageSequence, ContentSegments);

  print('Dropped items: $ContentImageSequence');
  print("other portions :");
  for(int i=0;i<ContentSegments.length;i++)
    {
      print(ContentSegments[i]);
    }
  print("Done");



}
