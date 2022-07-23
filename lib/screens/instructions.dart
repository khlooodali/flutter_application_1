import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/allpages.dart';
import 'package:flutter_application_1/screens/continueas.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/loginandsign.dart';

class instructions extends StatefulWidget {
  @override
  State<instructions> createState() => _instructionsState();
}

class _instructionsState extends State<instructions> {
  get bottomNavigationBar => null;

  int _selectedIndex = 0;

  get children => null;

  void whenpressed(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return LoginSignupScreen();
        }));
      } else if (index == 0) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return Home();
        }));
      } else if (index == 2) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return pages();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                opacity: .5,
                fit: BoxFit.fill,
                image: AssetImage("assets/background.jpg"),
              )),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Follow this this instructions to be in good health',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                backgroundColor: Colors.grey[200],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage('assets/foodGif.gif'))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'The best foods to eat when you have Breast Cancer',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    information(
                                        'Whether you’re newly diagnosed with breast cancer or you’re facing breast cancer that’s spread to another part of your body, you probably have many questions.\nThese may include: What should I eat?!',
                                        4,
                                        15,
                                        20),
                                    Text(
                                      'Dietitian Anna Taylor, RD, has offered these four diet tips for those undergoing cancer treatment:',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[700]),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    information(
                                        '1- Stay hydrated.. Aim for at least 2 liters to 3 liters of fluid per day — about 66 ounces to 99 ounces — mostly from caffeine-free fluids.',
                                        2,
                                        13,
                                        15),
                                    information(
                                        '2- Get enough calories. Forget the calculator — the best way to know whether you are eating enough calories for energy is to weigh yourself once or twice a week. If your weight is trending down week after week, speak with a dietitian to make a plan. Remember to eat regularly throughout the day. Small meals five to six times a day typically work well.',
                                        6,
                                        13,
                                        15),
                                    information(
                                        '3- Focus on nutrients and get the most nutrients per calorie.Choose foods from the food groups — things like fruits, vegetables, grains, beans, nuts, seeds, meats/eggs and dairy products. A balanced diet helps ensure you are getting the nutrients you need to keep your body strong.',
                                        4,
                                        13,
                                        15),
                                    information(
                                        '4- Don’t forget protein.. Protein helps maintain lean body mass/muscle. Protein is found in meat, poultry, fish, seafood, eggs, beans, lentils, nuts, seeds, soy and dairy products. Smaller amounts of proteins are found in vegetables and whole grains.',
                                        4,
                                        13,
                                        0)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'What do you eat during breast cancer treatment?',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'If you don’t have nutrition-related side effects from your cancer treatment that limit your ability to eat and/or digest food, Taylor says you can follow a generally healthy diet that includes:',
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                              width: 200,
                                              height: 200,
                                              child: Image.asset(
                                                  'assets/food1.jpg')),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              information(
                                                  '1- Fruits and vegetables: 5+ servings a day. Fruits and vegetables contain antioxidant and anti-estrogen properties.Cruciferous vegetables such as broccoli, cauliflower, kale, cabbage and Brussels sprouts are especially good to include and are rich in phytochemicals.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  '2- Whole grains: 25-30 grams of fiber daily.. Whole grains are unprocessed foods that are high in complex carbohydrates, fiber, phytochemicals as well as vitamins and minerals. A study by researchers at Soochow University in Suzhou, China, found that high fiber intakes may have a positive effect by altering hormonal actions of breast cancer and other hormone-dependent cancers.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  '3- Lean protein — and soy, too.Lean protein — and soy, too. For good protein sources, increase your intake of poultry, fish and legumes like beans and lentils. Minimize your intake of cured, pickled and smoked foods. Soy in moderate amounts, which means one to two servings/day of whole soy foods (like tofu, edamame and soy milk) also can be included. Studies, including research reported in the American Institute for Cancer Research, show that animals metabolize soy differently than humans. Not only is soy safe in moderate amounts, but research shows that soy contains isoflavones, a phytonutrient with anti-cancer properties. Up to three servings of whole soy foods per day doesn’t increase a breast cancer survivor’s risk of recurrence or death.',
                                                  20,
                                                  13,
                                                  20),
                                              Text(
                                                'After treatment, maintain a healthy weight :)',
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              information(
                                                  'Obese women have higher levels of estrogen circulating in their bodies than women who are in their ideal body weight range.',
                                                  6,
                                                  13,
                                                  15),
                                              information(
                                                  'Many studies including a study conducted by researchers from the Iranian Institute for Health Sciences Research in Tehran, Iran, have demonstrated an association between body mass size and breast cancer in post-menopausal women.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  'If you’re overweight, Taylor recommends losing weight through a healthy diet and regular exercise once you’ve finished treatment. Weight loss during treatment isn’t typically encouraged, as this is often associated with undesired muscle loss, leading to fatigue, a suppressed immune system and a slower healing process.',
                                                  15,
                                                  13,
                                                  15),
                                              information(
                                                  'Allow your body the nutrients it needs to fight cancer,” she says. Once your treatment is done, consider meeting with a dietitian for individualized recommendations to decrease recurrence risk and support a healthy weight.',
                                                  10,
                                                  13,
                                                  20),
                                              Text(
                                                'If you have side effects',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              information(
                                                  'Nausea. If you experience nausea, your dietitian may recommend that you try to eat more foods that are cool or at room temperature because they don’t have a strong odor. It may also help to eat lower-fat food since fats take longer to digest.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  'Many studies including a study conducted by researchers from the Iranian Institute for Health Sciences Research in Tehran, Iran, have demonstrated an association between body mass size and breast cancer in post-menopausal women.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  'Don’t skip meals entirely if you have nausea, since an empty stomach can make nausea worse,” Taylor says. “Instead, focus on small bites of food throughout the day.” Avoid strong flavors. Feel free to incorporate ginger root into your recipes, as this can help settle a nauseated stomach.',
                                                  15,
                                                  13,
                                                  15),
                                              information(
                                                  'Constipation. If constipation becomes an issue, your dietitian may encourage you to eat fiber-rich foods and increase your fluid intake, Taylor adds. Low-intensity walking and warm beverages also can help encourage regular bowel movements.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  'Fatigue. To combat fatigue, choose high-protein snacks and small frequent meals rather than large meals. People often experience more fatigue when they’re not eating well, or when they’re losing weight during treatment.',
                                                  10,
                                                  13,
                                                  15),
                                              information(
                                                  'If you’re experiencing any side effect that affects your ability to eat regularly, ask your care team if you can meet with a dietitian to review individualized nutrition recommendations.',
                                                  10,
                                                  13,
                                                  25),
                                              Text(
                                                'WISH YOU A GOOD HEALTH AND RECOVERING SOON',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    backgroundColor:
                                                        Colors.grey[200],
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.99),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.grey[200],
                      selectedIconTheme: IconThemeData(
                          color:
                              ispatient ? Colors.pink[200] : Colors.blue[200]),
                      selectedItemColor:
                          ispatient ? Colors.pink[200] : Colors.blue[200],
                      unselectedIconTheme: IconThemeData(
                        color: Colors.grey[600],
                      ),
                      unselectedItemColor: Colors.grey[600],
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.login),
                          label: 'Login',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.notes),
                          label: 'Pages',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: whenpressed,
                    ),
                  )
                ],
              ))),
    );
  }

  Column information(
      String text, int maxlines, double fontsize, double sizebox) {
    return Column(children: [
      Text(
        text,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: sizebox,
      )
    ]);
  }
}
