import 'dart:io';
import 'package:flutter/services.dart';

class ExtensionString {
  static Future<String> addCss(String html) async {
    final cssString = await rootBundle.loadString("css/images/dic.css");
    return """<head>
	     <style>
	     $cssString
      </style>
      </head>
      <body>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
      <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <link rel='Stylesheet' type='text/css' href='images/dic.css'>
        <div class='p10'>
        <div id='partofspeech_0'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="Stylesheet" type="text/css" href="images/dic.css">
        <div class="m5t" id="mtd_0">
        $html
        </div>
        </div>
        </div>
        </div>
        </div>
        <script>
        document.addEventListener('click', function(e){
            s = window.getSelection();
            var range = s.getRangeAt(0);
            var node = s.anchorNode;
            while (range.toString().indexOf(' ') != 0) {
                range.setStart(node, (range.startOffset - 1));
            }
            range.setStart(node, range.startOffset + 1);
            do {
                range.setEnd(node, range.endOffset + 1);

            } while (range.toString().indexOf(' ') == -1 && range.toString().trim() != '' && range.endOffset < node.length);
            var str = range.toString().trim();
            Print.postMessage(str);
        })
    </script>
      </body>
      """;
  }

  static String removeSpecialCharacter(String word) {
    final newWord = word.replaceAll(RegExp(r"[+:-\\(\\)\\.]"), "");
    return newWord;
  }

  static String removeSpaceIntoText(String word) {
    final newWord = word.replaceAll(" ", "");
    return newWord;
  }

  static String removeSpecialWord(String word) {
    final newWord = word.replaceAll(RegExp(r"[,\\.!?\\']"), "");
    return newWord;
  }

  static bool checkValidateEmail(String email) {
    bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);
    return emailValid;
  }

  static bool checkValidatePhone(String phone) {
    bool phoneValid = RegExp(r"^(?:[+0]9)?[0-9]{9,16}$").hasMatch(phone);
    return phoneValid;
  }

  static String convertTextToSearchImage(String word) {
    final newWord = word.replaceAll(" ", "%20");
    return newWord;
  }

  static bool checkPhone(String phone) {
    final exp = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final regex = new RegExp(exp);
    if (regex.hasMatch(phone)) {
      return true;
    }
    return false;
  }

  static String formatMoney(int money) {
    final moneyString = money.toString();
    var result = "";
    for (int i = moneyString.length - 1; i >= 0; i = i - 1 ) {
      if (i != 0 && i != moneyString.length - 1 && ((moneyString.length - i) % 3 == 0)) {
        result = ".${moneyString[i]}$result";
      } else {
        result = "${moneyString[i]}$result";
      }
    }
    result += " đ";
    return result;
  }

  static String formatNumber(double number, {int numberDecimal = 2}) {
    final numberString = number.toString();
    final numberSplit = numberString.split(".");
    final numberFirst = numberSplit.first;
    var result = "";
    for (int i = numberFirst.length - 1; i >= 0; i = i - 1 ) {
      if (i != 0 && i != numberFirst.length - 1 && ((numberFirst.length - i) % 3 == 0)) {
        result = ",${numberFirst[i]}$result";
      } else {
        result = "${numberFirst[i]}$result";
      }
    }
    var numberSecond = numberSplit.last;
    if (numberSecond.length <= (numberDecimal - 1)) {
      numberSecond += "0";
    } else {
      numberSecond = numberSecond.substring(0, numberDecimal);
    }
    return result + "." + numberSecond;
  }

  static String makeElipsBetweenString(String text) {
    if (text.length <= 6) {
      return text;
    }
    final first = text.substring(0, 3);
    final end = text.substring(text.length - 3, text.length);
    return first + "..." + end;
  }
}