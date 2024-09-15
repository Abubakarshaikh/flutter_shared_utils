/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Regex Util.
 * @Date: 2018/9/8
 */

/// ID card province dictionary.
List<String> ID_CARD_PROVINCE_DICT = [
  '11=Beijing',
  '12=Tianjin',
  '13=Hebei',
  '14=Shanxi',
  '15=Inner Mongolia',
  '21=Liaoning',
  '22=Jilin',
  '23=Heilongjiang',
  '31=Shanghai',
  '32=Jiangsu',
  '33=Zhejiang',
  '34=Anhui',
  '35=Fujian',
  '36=Jiangxi',
  '37=Shandong',
  '41=Henan',
  '42=Hubei',
  '43=Hunan',
  '44=Guangdong',
  '45=Guangxi',
  '46=Hainan',
  '50=Chongqing',
  '51=Sichuan',
  '52=Guizhou',
  '53=Yunnan',
  '54=Tibet',
  '61=Shaanxi',
  '62=Gansu',
  '63=Qinghai',
  '64=Ningxia',
  '65=Xinjiang',
  '71=Taiwan Old',
  '81=Hong Kong',
  '82=Macau',
  '83=Taiwan New',
  '91=Foreign',
];

/// Regex Utility.
class RegexUtil {
  /// Simple mobile number regex.
  static const String regexMobileSimple = '^[1]\\d{10}\$';

  /// Exact mobile number regex.
  ///  <p>China Mobile: 134(0-8), 135, 136, 137, 138, 139, 147, 150, 151, 152, 157, 158, 159, 165, 172, 178, 182, 183, 184, 187, 188, 195, 198</p>
  ///  <p>China Unicom: 130, 131, 132, 145, 155, 156, 166, 167, 171, 175, 176, 185, 186</p>
  ///  <p>China Telecom: 133, 153, 162, 173, 177, 180, 181, 189, 199, 191</p>
  ///  <p>Global Star: 1349</p>
  ///  <p>Virtual operator: 170</p>
  static const String regexMobileExact =
      '^((13[0-9])|(14[57])|(15[0-35-9])|(16[2567])|(17[01235-8])|(18[0-9])|(19[1589]))\\d{8}\$';

  /// Telephone number regex.
  static const String regexTel = '^0\\d{2,3}[- ]?\\d{7,8}';

  /// ID card number regex (15 digits).
  static const String regexIdCard15 =
      '^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$';

  /// ID card number regex (18 digits).
  static const String regexIdCard18 =
      '^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$';

  /// Email address regex.
  static const String regexEmail =
      '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';

  /// URL regex.
  static const String regexUrl = '[a-zA-Z]+://[^\\s]*';

  /// Chinese character regex.
  static const String regexZh = '[\\u4e00-\\u9fa5]';

  /// Date regex with pattern 'yyyy-MM-dd'.
  static const String regexDate =
      '^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\$';

  /// IP address regex.
  static const String regexIp =
      '((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)';

  /// Username regex, must contain letters and numbers, 6-18 characters.
  static const String regexUsername =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z]{6,18}\$';

  /// Username regex, must contain letters and numbers, can contain special characters, 6-18 characters.
  static const String regexUsername2 =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z\\W]{6,18}\$';

  /// Username regex, must contain letters, numbers, and special characters, 6-18 characters.
  static const String regexUsername3 =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)(?![0-9a-zA-Z]+\$)(?![0-9\\W]+\$)(?![a-zA-Z\\W]+\$)[0-9A-Za-z\\W]{6,18}\$';

  /// QQ number regex.
  static const String regexQQ = '[1-9][0-9]{4,}';

  /// Postal code regex for China.
  static const String regexChinaPostalCode = "[1-9]\\d{5}(?!\\d)";

  /// Passport regex.
  static const String regexPassport =
      r'(^[EeKkGgDdSsPpHh]\d{8}$)|(^(([Ee][a-fA-F])|([DdSsPp][Ee])|([Kk][Jj])|([Mm][Aa])|(1[45]))\d{7}$)';

  static final Map<String, String> cityMap = {};

  /// Returns whether the input matches the simple mobile number regex.
  static bool isMobileSimple(String input) {
    return matches(regexMobileSimple, input);
  }

  /// Returns whether the input matches the exact mobile number regex.
  static bool isMobileExact(String input) {
    return matches(regexMobileExact, input);
  }

  /// Returns whether the input matches the telephone number regex.
  static bool isTel(String input) {
    return matches(regexTel, input);
  }

  /// Returns whether the input matches the ID card number regex.
  static bool isIDCard(String input) {
    if (input.length == 15) {
      return isIDCard15(input);
    }
    if (input.length == 18) {
      return isIDCard18Exact(input);
    }
    return false;
  }

  /// Returns whether the input matches the 15-digit ID card number regex.
  static bool isIDCard15(String input) {
    return matches(regexIdCard15, input);
  }

  /// Returns whether the input matches the 18-digit ID card number regex.
  static bool isIDCard18(String input) {
    return matches(regexIdCard18, input);
  }

  /// Returns whether the input matches the exact 18-digit ID card number regex.
  static bool isIDCard18Exact(String input) {
    if (isIDCard18(input)) {
      List<int> factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
      List<String> suffix = [
        '1',
        '0',
        'X',
        '9',
        '8',
        '7',
        '6',
        '5',
        '4',
        '3',
        '2'
      ];
      if (cityMap.isEmpty) {
        List<String> list = ID_CARD_PROVINCE_DICT;
        List<MapEntry<String, String>> mapEntryList = [];
        for (int i = 0, length = list.length; i < length; i++) {
          List<String> tokens = list[i].trim().split('=');
          MapEntry<String, String> mapEntry = MapEntry(tokens[0], tokens[1]);
          mapEntryList.add(mapEntry);
        }
        cityMap.addEntries(mapEntryList);
      }
      if (cityMap[input.substring(0, 2)] != null) {
        int weightSum = 0;
        for (int i = 0; i < 17; i++) {
          weightSum += int.parse(input[i]) * factor[i];
        }
        int idCardMod = weightSum % 11;
        String idCardLast = input.substring(17).toUpperCase();
        return idCardLast == suffix[idCardMod];
      }
    }
    return false;
  }

  /// Returns whether the input matches the email regex.
  static bool isEmail(String input) {
    return matches(regexEmail, input);
  }

  /// Returns whether the input matches the URL regex.
  static bool isURL(String input) {
    return matches(regexUrl, input);
  }

  /// Returns whether the input matches the Chinese character regex.
  static bool isZh(String input) {
    return '〇'.compareTo(input) <= 0 && '鿿'.compareTo(input) >= 0;
  }

  /// Returns whether the input matches the username regex.
  static bool isUsername(String input) {
    return matches(regexUsername, input);
  }

  /// Returns whether the input matches the date regex with pattern 'yyyy-MM-dd'.
  static bool isDate(String input) {
    return matches(regexDate, input);
  }

  /// Returns whether the input matches the IP address regex.
  static bool isIP(String input) {
    return matches(regexIp, input);
  }

  /// Returns whether the input matches the regex pattern.
  static bool matches(String regex, String input) {
    return input.isNotEmpty && RegExp(regex).hasMatch(input);
  }
}
