import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';


final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我出生在一個很平凡但很美滿的小家庭，父親是個擁有40多年土水經驗的水泥師，母親是個料理非凡的幼稚園廚媽，而弟弟和我都還在學校求學。父母用民主的方式管教我們，希望我們能夠獨立自主、主動學習，累積人生經驗，但他們會適時的給予鼓勵和建議，父母親只對我們要求兩件事，要吃飯，要睡覺。因為沒有健康的身體，就算有再多的才華、再大的抱負也無法發揮出來。'
          '在小學時代的我對整個世間事務未知懵懂，在課業求知上認真上進，每當考試成績考得很好時，就非常有成就感。'
          '小學畢業後，進入了一所公立中學，更是玩到瘋，交了最要好的朋友，騎著一台腳踏車到處趴趴走，也學會了許多應有的禮節與待人處世的道理。課業上也不斷的努力精進，成績一路維持在校前段班，雖然英文仍然是一大罩門，但還是不懼困難，勉強維持在水平之上，最擅長的理科更是永遠保持在頂端水準，會考後也穩定的考上理想的彰化第一中學，彰化高中。'
          '進高中後，每天都覺得很快樂。上高中後，學生的特色是能K、能玩，所以我不斷地努力學習，希望能夠達到此目標。由於愛玩的關係，在課業方面，漸漸跟不上進度，便開始試著嘗試不一樣的世界，開始喜歡看書，開始學著畫畫，在這段過程中，也聽過越來越多的音樂，發現其實人生並不一定只能在課業中尋求出入，開始更了解自己的興趣，喜歡的事物。非常慶幸，我還是喜歡數學，也感謝班導認真地指導，讓我今天還能在這理想的大學就讀學習。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(
          children: [
            LearningCard(
              title: '高中時期',
              description:
              '初中時期是我學習的開始，我發現了自己對科學和數學的濃厚興趣。老師們的啟發讓我更加渴望深入了解這些領域。我積極參與學校的科學競賽和數學競賽，這不僅豐富了我的知識，還培養了我的解難能力。',
              imagePath: 'assets/images/high_school.svg',
            ),
            LearningCard(
              title: '大學生活',
              description:
              '進入高中，我開始面對更多的學科選擇。經過深思熟慮，我選擇了理科方向，專攻物理和化學。並且開始對藝術領域方面，有著更多的認識。這些經歷讓我更深刻地理解了知識的奧妙，也培養了我對探索未知的渴望。',
              imagePath: 'assets/images/university.svg',
            ),
            LearningCard(
              title: '專業領域',
              description:
              '進入大學，我經歷了專業選擇的關鍵時刻。在多次實習和實踐中，我確定了自己對某一領域的熱愛。我選擇了資訊工程系，這是一個讓我心靈深處充滿激情的領域。在大學時期，我不僅深入學習了專業知識，還參與了社會實踐和實習活動，擴展了我的視野。',
              imagePath: 'assets/images/professional.svg',
            ),
            LearningCard(
              title: '技術社群',
              description:
              '大學期間，我積極參與了各種學術和職業發展機會，包括參與專業會議、發表論文、實習和實際專案。這些經驗讓我更加了解自己的專業領域，也培養了我解決實際問題的能力',
              imagePath: 'assets/images/community.svg',
            ),
          ],
        )
    );
  }
}
class LearningCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const LearningCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 10),
            SvgPicture.asset(
              imagePath,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學習新語言'),
                  Text('2. 認識新朋友'),
                  Text('3. 打好資工基礎'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 多修通識學分'),
                  Text('2. 多方學習不同領域知識'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 更精進資工方面專業知識'),
                  Text('2. 補足英文短板'),
                  Text('3. 繼續擴展人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 確保達成畢業門檻'),
                  Text('2. 準備研究所'),
                  Text('3. 有個簡單的經濟來源'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  final String s4 = '軟體開發與工程： 這是許多資訊工程師的主要領域之一。專攻軟體開發可以涵蓋應用程式、網站、軟體系統等方面。從前端開發到後端開發，都提供了豐富的發展機會。'

                    '數據科學與大數據： 專注於數據科學和大數據分析，可以幫助企業提取價值信息、制定策略和進行決策。這個領域需要深入了解統計學、機器學習和數據處理等知識。'

                    '人工智慧與機器學習： 這是當前熱門的領域，涉及機器學習、深度學習、自然語言處理等。開發智能系統、機器學習模型，以及應用於自主駕駛、語音辨識等方面。'

                    '網路與資訊安全： 保護資訊和網路系統的安全至關重要。專攻資訊安全可包括網路安全、應用程式安全、數據安全等領域，以確保系統不受到不當存取和攻擊。'

                    '物聯網（IoT）： 物聯網是連接物理世界與數字世界的關鍵，從智能家居到智慧城市，都需要資訊工程師來開發、部署和管理相應的系統。'

                    '雲端運算與架構： 隨著雲端技術的發展，企業越來越依賴雲端服務。專注於雲端運算和架構，能夠參與建構高效的雲端解決方案。'

                    '軟硬整合： 將軟體和硬體結合，參與嵌入式系統、嵌入式軟體開發，以及物聯網設備的設計和開發。';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('未來方向', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s4, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}