import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Form_SearchAnchor())));
}

// ignore: camel_case_types
class Form_SearchAnchor extends StatefulWidget {
  const Form_SearchAnchor({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Form_SearchAnchor> {
  final List<String> searchWords = [
    "中国 China",
    "你好 Hello",
    "世界 World",
    "谢谢 Thanks",
    "不 No",
    "是 Yes",
    "对不起 Sorry",
    "没关系 It's okay",
    "再见 Goodbye",
    "爱 Love",
    "喜欢 Like",
    "朋友 Friend",
    "家庭 Family",
    "工作 Work",
    "学习 Study",
    "音乐 Music",
    "电影 Film",
    "书籍 Book",
    "食物 Food",
    "水 Water",
    "太阳 Sun",
    "月亮 Moon",
    "星星 Star",
    "红色 Red",
    "蓝色 Blue",
    "绿色 Green",
    "黄色 Yellow",
    "黑色 Black",
    "白色 White",
    "快乐 Happy",
    "悲伤 Sad",
    "生气 Angry",
    "惊讶 Surprised",
    "思考 Think",
    "梦想 Dream",
    "希望 Hope",
    "和平 Peace",
    "美丽 Beautiful",
    "伟大 Great",
    "小 Small",
    "大 Big",
    "快 Fast",
    "慢 Slow",
    "热 Hot",
    "冷 Cold",
    "年轻 Young",
    "老 Old",
    "男人 Man",
    "女人 Woman",
    "孩子 Child",
    "动物 Animal",
    "自然 Nature",
    "城市 City",
    "国家 Country",
    "地球 Earth",
    "生活 Life",
    "旅行 Travel",
    "运动 Sport",
    "科技 Technology",
    "互联网 Internet",
    "游戏 Game",
    "健康 Health",
    "自由 Freedom",
    "真相 Truth",
    "艺术 Art",
    "历史 History",
    "未来 Future",
    "过去 Past",
    "现在 Present",
    "勇敢 Brave",
  ];
  final List<String> searchHistory = <String>[];
  final random = Random();

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> getSuggests(SearchController controller, StateSetter setState) {
      List<({String value, String type, IconData typeIcon})> suggests = [];
      if (controller.text.isNotEmpty) {
        suggests = searchWords.where((e) => e.contains(controller.text)).map((e) => (value: e, type: "search", typeIcon: Icons.search)).toList();
      } else {
        int randomSuggestStart = random.nextInt(searchWords.length - 5);
        var randomSuggests = searchWords.sublist(randomSuggestStart, randomSuggestStart + 5);
        suggests.addAll(searchHistory.map((e) => (value: e, type: "history", typeIcon: Icons.history)));
        suggests.addAll(randomSuggests.map((e) => (value: e, type: "suggest", typeIcon: Icons.recommend_outlined)));
      }

      return suggests.map((item) => ListTile(
            leading: Icon(item.typeIcon),
            title: Text(item.value),
            subtitle: Text(item.type),
            trailing: IconButton(
                icon: const Icon(Icons.call_missed),
                onPressed: () {
                  controller.text = item.value;
                  controller.selection = TextSelection.collapsed(offset: controller.text.length);
                  controller.closeView(item.value);
                }),
            onTap: () {
              setState(() {
                controller.closeView(item.value);
                if (searchHistory.length >= 5) {
                  searchHistory.removeLast();
                }
                searchHistory.insert(0, item.value);
                var set = searchHistory.toSet();
                searchHistory.clear();
                searchHistory.addAll(set);
              });
            },
          ));
    }

    return Column(
      children: [
        SearchAnchor.bar(
          barHintText: 'Search words',
          onSubmitted: (text) {
            debugPrint("onSubmitted $text, should : controller.closeView");
          },
          suggestionsBuilder: (context, controller) => getSuggests(controller, setState),
        )
      ],
    );
  }
}
