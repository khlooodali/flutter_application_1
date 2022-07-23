import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Baheya extends StatelessWidget {
  const Baheya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        ListView(children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '~Success Stories in Baheya~',
                textAlign: TextAlign.center,
                style: TextStyle(
                    backgroundColor: Colors.pink[200],
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                createfightersWidget(
                    'hananSalem.png',
                    'Hanan Salem',
                    'Hanan Salem is a  breast cancer fighter  in Baheya foundation, she is beautiful in shape and spirit, and one of four sisters who are breast cancer fighters at baheya foundation also. Allah gave her good husband who used to delight her and take her hands in the midst of her illness, and who would see her as a gift from Allah and a precious reward.',
                    'https://www.youtube.com/watch?v=pI5P9EA0P5w&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=48'),
                SizedBox(height: 10),
                createfightersWidget(
                    'zeinabKhalaf.png',
                    'Zeinab Khalaf',
                    'Zeinab khalaf started her story after her husband death, she is a strong breast cancer fighter.',
                    'https://www.youtube.com/watch?v=2H39kSX2rhw&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=46'),
                SizedBox(height: 10),
                createfightersWidget(
                    'omHashemIbrahim.png',
                    'Om Hashem Ibrahim',
                    'Om Hashem Ibrahim, a female breast cancer fighter at Baheya.She wanted to work , but her illness prevented her, Her mother is her support and her back bone.',
                    'https://www.youtube.com/watch?v=HHStVE6OUow&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=45'),
                SizedBox(height: 10),
                createfightersWidget(
                    'fatmaAbdElhamid.png',
                    'Fatma Abd Elhamid',
                    'Fatma Abdel Hamid is a breast cancer fighter and a role model in hope and will. She was treated at Baheya foundation.',
                    'https://www.youtube.com/watch?v=i4nYmc1XOv8&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=44'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'azzaAttia.png',
                    'Azza Attia',
                    'Azza Attia a story of faith and Satisfaction.She is a breast cancer fighter.She took 16 chemical sessions, but she wassatisfied and faithful.',
                    'https://www.youtube.com/watch?v=q7RgEIVJckk&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=40'),
                SizedBox(height: 10),
                createfightersWidget(
                    'monaKamal.png',
                    'Mona Kamal',
                    'Mona Kamal is one of Baheya’s fighters.She is the one that her calm and delight smile is the reason behind her strengthen and escaping from the painful feelings.',
                    'https://www.youtube.com/watch?v=14RyOktD-H0&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=37'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'salwaAbdElFatah.png',
                    'Salwa Abd ElFatah',
                    'Salwa Abd el Fatah is one of Baheya’s fighters.She has a cheerful face that makes all Baheya’s employees called her with mother. ',
                    'https://www.youtube.com/watch?v=JnBilk1ZzSM&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=35'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'omOmar.png',
                    'Om Omar',
                    'Om Omar is one of Baheya’s cancer fighters.She is an embodiment of love and loyalty that we miss in many Egyptian houses.',
                    'https://www.youtube.com/watch?v=EjqH7VQwjzw&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=31'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'mariamTadros.png',
                    'Mariam Tadros',
                    'Mariam Tadros is one of Baheya’s cancer fighters that teach us hope and will. She treated in Baheya from the cancer breast disease, and we still have more cancer fighters that need ppsychological  support and medical treatment.',
                    'https://www.youtube.com/watch?v=OOwhMk8Z7n0&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=28'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'sabahAid.png',
                    'Sabah Aid',
                    'Sabah Aid is one of Baheya’s fighters.For her and her husband, the secret behind their strength in facing the disease and all life difficulties is satisfaction. She satisfies with all she faces so she always smiles to all people.',
                    'https://www.youtube.com/watch?v=6hLMp2FSKzk&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=26'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'nadiaFathi.png',
                    'Nadia Fathi',
                    'Nadia Fathi is one of Baheya’s warriors.She planted love, goodness and tenderness in the heart of her sisters.',
                    'https://www.youtube.com/watch?v=aj9BYo1RsHs&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=24'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'zienabAbdElRahim.png',
                    'Zienab Abd ElRahim',
                    'Zienab Abdel Rahim is one of Baheya’s fighters.She is very active and energetic. She divided her time between her treatment in Baheya, and raising up and taking care of her children. Among all these tasks, she didn’t forget to give of her time and health to help others.',
                    'https://www.youtube.com/watch?v=kInRdVL7R98&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=23'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'hamemAhmed.png',
                    'Hamem Ahmed',
                    'Hamem Ahmed is one of Baheya cancer fighters.She may didn’t take any of her name meanings, because of her suffering with her disease and her son’s illness.But for her sister and Baheya, she is a great lady.',
                    'https://www.youtube.com/watch?v=7OKODlfPeKQ&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=22'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'basmahAhmed.png',
                    'Basmah Ahmed',
                    'Basmah Ahmed is one of Baheya’s cancer fighters.She is a very young lady starting her life journey. Her young age is the reason behind her strength and determination in facing her disease and the life troubles with a smile.',
                    'https://www.youtube.com/watch?v=Ghnq1WMMokU&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=16'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'trizaYosef.png',
                    'Triza Yosef',
                    'riza Yosef is one of Baheya’s cancer fighters.She is known in Baheya with her quiet smile that hide all her pain and suffering.',
                    'https://www.youtube.com/watch?v=IClANvnjQd8&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=9'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'abirKamal.png',
                    'Abir Kamal',
                    'Abir Kamal is one of Baheya’s cancer fighters. After she refused to take any medicine. She decided to challenge the disease with all her strength.',
                    'https://www.youtube.com/watch?v=qXx47Gi5arM&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=7'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'thanaaEldemrdash.png',
                    'Thanaa Eldemrdash',
                    'Thanaa Eldemrdash is one of Baheya’s cancer fighters.She got her medical treatment from the cancer breast in Baheya. We still have thousands of ladies waiting for medical treatment and psychological support.',
                    'https://www.youtube.com/watch?v=d-dAYL7__-w&list=PLx2EFu656F-GIp0yTTrYlpNhoL_bGvoq9&index=3&t=516s'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'safaaRoshdi.jpg',
                    'Safaa Roshdi',
                    'Safaa Roshdi is one of Baheya’s cancer fighters.Although she is young in age, she lives a very harsh life full of depressions. Now she is able to overcome all her life depressions and defeat the cancer with her strong spirit and patience.',
                    'https://www.youtube.com/watch?v=CI2iPzwg5i8'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'monaEsmael.jpg',
                    'Mona Esmael',
                    'Mona Esmael is one of Baheya’s cancer fighters.With Baheya, she still has the nicest smile in Baheya, in spite of the chemical treatment pain, and after her lose to her son during her medical treatment in Baheya.',
                    'https://www.youtube.com/watch?v=qPTJuFsnYwY'),
                SizedBox(
                  height: 10,
                ),
                createfightersWidget(
                    'haggahNadiaHassan.jpg',
                    'Haggah Nadia Hassan',
                    'Haggah Nadia Hassan is one of Baheya’s cancer fighters.She started suffering since 2002, she did mastectomy surgery then the disease reappeared in her right breast, so she was enforced to do partial mastectomy. Her close friend is the wholly Quraan.',
                    'https://www.youtube.com/watch?v=lK1dy_gpC38')
              ]))
        ])
      ],
    )));
  }

  SingleChildScrollView createfightersWidget(
    String img,
    String name,
    String info,
    String link,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        height: 330,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage('assets/$img'))),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$info',
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: () => launch('$link'),
                            child: Text(
                              'KNOW MORE',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            color: Color.fromARGB(255, 76, 159, 228),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////

class otherStories extends StatefulWidget {
  const otherStories({Key? key}) : super(key: key);

  @override
  State<otherStories> createState() => _otherStoriesState();
}

class _otherStoriesState extends State<otherStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      ListView(children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '~ Other Success Stories~',
              textAlign: TextAlign.center,
              style: TextStyle(
                  backgroundColor: Colors.pink[200],
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              createNewStory(
                'fight1.PNG',
                'My story started for the first time when I am 34 years old. I had two daughters, one of whom is 13 years old and the youngest of 4 years; The disease was contagious when I was not exposed to the fact that I could at any moment not be with them .',
                'My story started for the first time when I am 34 years old. I had two daughters, one of whom is 13 years old and the youngest of 4 years; The disease was contagious when I was not exposed to the fact that I could at any moment not be with them and I could not see them growing old before me, especially since the treatment would be chemical, radiological and stressfulBut, thanks to God, thanks to my family and friends, I was able to go through all the stages, no matter how difficult, tiring, and exhausting physically, healthily, and mentally, because I was very focused on trying not to hurt me in front of my children, and I preferred standing rigid, normal and natural with them.And after four years and in periodic examinations, I discovered that the disease came back to me again, but this time the treatment was stronger than the first time.I donot know. The second time is almost the same. In my life, nor my children, nor the protein of my life, although the second time I had to do a complete mastectomy, and I went through the treatment again, but I thank God that my treatment period is over and I am in the periodic follow-up phase and I am not afraid of the disease.',
              ),
              SizedBox(height: 10),
              createNewStory(
                  'fight2.PNG',
                  'One day, I dreamed that I had breast implants and that I had cancer, so I woke up frightened and examined my breasts. The next day I went to the doctor, and I think that it was the fourth day of Eid al-Adha, and at that time the doctor told me that I had to get a mammogram immediately.',
                  'One day, I dreamed that I had breast implants and that I had cancer, so I woke up frightened and examined my breasts. The next day I went to the doctor, and I think that it was the fourth day of Eid al-Adha, and at that time the doctor told me that I had to get a mammogram immediately. It turns out to be a reality and I actually had breast cancer. At that time, I had hope that it was still in the early stages.Two days later, I went to the doctor and he said we will do the operation and he asked for rumors and a lot of analyzes and two days later I did the operation, in the midst of all this douche. A month before that, he had a major operation in the brain. He also had a tumor and he couldnot move. However, he came with me at the time of the operation, and then a month later I started the chemotherapy journey and with That’s him, he was all the time with me, but in the third session, he did a second operation, all of this, and we are alone and We have 4 daughters, including a girl who is still a little girl and a girl who was in high school, however, she took responsibility and was able to answer a large group and entered the College of Pharmacy, the one who is older than her also went to the College of Pharmacy, and she was the one who kept her father’s job all the time while studying, but the older girl was the one who paralyzed the responsibility for me Exactly with her studies at the Faculty of Medicine and she left her father also, and she was the one who was with us in the tests, rumors, and this whole long journey.'),
              SizedBox(
                height: 10,
              ),
              createNewStory(
                  'fight3.jpg',
                  'Family support on the part of the husband and children is one of the foundations for raising the morale and psychological status of the woman with breast cancer, and how many cases have suffered from the loss of psychological support or ill treatment from the husband, but at the same time there are many cases that God has blessed with a husband who understands this situation and this disease that He primarily needs the support of his husband, children, relatives and friends',
                  'Family support on the part of the husband and children is one of the foundations for raising the morale and psychological status of the woman with breast cancer, and how many cases have suffered from the loss of psychological support or ill treatment from the husband, but at the same time there are many cases that God has blessed with a husband who understands this situation and this disease that He primarily needs the support of his husband, children, relatives and friends.Husband Hamdi Ismail and his wife Mrs. Zainab Taha Among those cases that illustrate the solidarity of the Egyptian family with the mother, sister, aunt and uncle, is the wonderful human story that describes the husband Hamdi Ismail’s love for his wife Zainab Taha. The doctors who assured her that this is a normal thing, and the wife says about this situation, "I was not convinced by the doctors’ words, and I mentioned this to my husband, which made us go to more than one doctor. In the end, the last doctor we went to told us to go to the National Cancer Institute, and there they took his eye from me.Here, the husband grabs the edge of the conversation and confirms, "My wife’s fear and not being convinced by the doctors’ words one by one made us go to the National Institute to take a sample of the breast and analyze it. The results showed that the tumor was malignant, and the entire breast must be removed due to our delay in discovering the disease.The wife, Zainab Taha, confirms that the disease was discovered in May 1992, and the surgery was performed to remove the breast on 3/9/1992. The wife describes the situation, saying, "My husband did not tell me what I was going to do, as he convinced me that this operation aims to take a sample of the breast, not an excision, He did not tell me that I had breast cancer and therefore he endured one shock after another and was by my side every moment, until the result was a coronary bypass operation from the impact of the horror of the situations that passed us.Here, the wife praises and thanks God a lot for the husband’s support for her in those previous ordeals, saying, “God stood by me during the previous period, and after him my husband, who used to help me with the housework without tire or fatigue and did not allow me to do any work that exhausted me, but on the contrary supported me even in the back and forth.In the end, the husband talks about his support for his wife and stresses the importance of this role in raising her morale, as he criticizes the performance of husbands who slander their wives and their treatment of their wives changes after learning that they are ill, saying, “The husband has to bear his wife through thick and thin, and everything that happens to them is from God. The disease and healing are from him, and therefore the lady has no hand in what she suffers from, but rather he has to support and take care of her so that God takes care of him in adversity.'),
              SizedBox(
                height: 10,
              ),
              createNewStory(
                  'fight4.PNG',
                  'My name is R.Y. I am 68 years old. I worked as a nurse and they taught us in our department how to do a self-examination of the breasts, and I used to do it all the time. 3 years ago, I found a lump in my left breast and went for a mammogram.',
                  'My name is R.Y. I am 68 years old. I worked as a nurse and they taught us in our department how to do a self-examination of the breasts, and I used to do it all the time. 3 years ago, I found a lump in my left breast and went for a mammogram.He was detected by a female oncologist, and she said that the cleft is safe and there are no problems at all, but she said that I have to follow up every 9 months or every year and do a mammogram. . And this is my second year, and I am following and doing a mammogram, as the doctor said, and thank God, there are no problems.'),
              SizedBox(
                height: 10,
              ),
              createNewStory(
                  'fight5.PNG',
                  'Ms. Mona says, I was in my thirties when I learned that I had breast cancer and that I had to undergo an excision surgery.',
                  'Ms. Mona says, I was in my thirties when I learned that I had breast cancer and that I had to undergo an excision surgery.She says the worst days were those days I spent in the hospital alone after the surgery and I couldn’t look in the mirror, and what made it even more cruel for me was the strange reaction of my husband, who was working outside, he never showed up, he just called me every once in a while.She says while dealing with the effects of chemotherapy, I was trying to find one of the reasons for staying alive, as I was involved in charitable activities and social work, especially with children suffering from cancer, as well as orphans who lost their parents after being infected with it. She says the more cases I see, the more I thank God for what I am in After the chemo period ended, I discovered the true strength within me.She says in order to defeat the shame and ignorance that surrounds breast cancer in Egypt, I decided to help other women in obtaining information about this disease so that it could detect the infection early. I also supported women who had already contracted the disease to reduce their suffering and open new horizons for them. For me, my lack of information made the impact of the disease worse, as they say we always fear the unknown, and I hope that avoid this fear in others.'),
              SizedBox(
                height: 10,
              ),
              createNewStory(
                  'fight6.PNG',
                  'At first, I felt a lump in the breast and the nipple pulled in, so I went to a gynecologist and obstetrician, and he told me that I was pregnant in a month and a half. After the excision, I will be exposed to chemotherapy and radiation, so I aborted the child, and after a month, the doctor performed a tumor excision for me, and after that I took chemotherapy sessions and then radiation.',
                  'At first, I felt a lump in the breast and the nipple pulled in, so I went to a gynecologist and obstetrician, and he told me that I was pregnant in a month and a half. After the excision, I will be exposed to chemotherapy and radiation, so I aborted the child, and after a month, the doctor performed a tumor excision for me, and after that I took chemotherapy sessions and then radiation.The lady said that the most difficult stage I went through was the stage of chemotherapy, but after that stage ended and my hair began to appear again, and I became in the best condition. At the end of my talk about my story, I would like to tell every woman that cancer is not fatal and has its own treatment. People used to fear when they hear the name of the word cancer, but now no, if any woman gets cancer, after the end of her treatment, she can lead her life normally. It is very possible to have children, which encouraged me and gave me hope that I met women who underwent mastectomy 20 or 25 years ago and are still alive. Cancer, ladies, does not mean death at all.'),
              SizedBox(
                height: 10,
              ),
              createNewStory(
                  'fight7.PNG',
                  'She says, "In the beginning, I found a small thing next to the breast, and during this period I was going to a surgeon, where I was complaining about a gland in the neck. So I asked the doctor that I felt a small thing appearing next to the breast. The doctor answered me that this could be a mammary gland without signing a medical examination on me and after he told me that." I reassured and calmed myself.',
                  'She says, "In the beginning, I found a small thing next to the breast, and during this period I was going to a surgeon, where I was complaining about a gland in the neck. So I asked the doctor that I felt a small thing appearing next to the breast. The doctor answered me that this could be a mammary gland without signing a medical examination on me and after he told me that." I reassured and calmed myself.After the passage of 8-9 years, I felt this thing increasing in size until it reached the size of the palm of the hand with pain in the hand and heaviness under the armpit, so I felt fear, so I went to an oncologist, and he told me that this is a cancerous tumor, so the doctor referred me to take a sample of the tumor to make sure. I had a mastectomy immediately.At the end of my talk about my story, I would like to say a word to every woman:-\nEvery woman should follow the means of early detection and not be late in going to the doctor if she feels any symptoms, and no woman should hesitate to choose between her life and keeping her shape, she must choose her life first.')
            ],
          ),
        ),
      ])
    ])));
  }

  Row createNewStory(String img, String subtext, String text) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage('assets/$img'), fit: BoxFit.fill)),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[300],
            ),
            child: Column(children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$subtext',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: FlatButton(
                      color: Colors.lightBlue,
                      child: Text(
                        'READ MORE',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 16,
                                  child: Container(
                                      height: 800.0,
                                      width: 500.0,
                                      child: SingleChildScrollView(
                                        child: Container(
                                          color: Colors.white,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 450,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(30),
                                                        bottomRight:
                                                            Radius.circular(30),
                                                      ),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/$img'),
                                                          fit: BoxFit.fill)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '$text',
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                )
                                              ]),
                                        ),
                                      )));
                            });
                      }),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
