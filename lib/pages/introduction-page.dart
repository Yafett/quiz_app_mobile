import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permainan_matematika/pages/home-page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();

  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  _buildScaffold() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: PageView(
          onPageChanged: (index) {
            setState(() => isLastPage = index == 5);
          },
          controller: controller,
          children: [
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi dua bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/2',
              title: 'Pecahan Setengah',
              urlImage: '1',
              urlBg: '1',
            ),
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi tiga bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/3',
              title: 'Pecahan Sepertiga',
              urlImage: '2',
              urlBg: '2',
            ),
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi empat bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/4',
              title: 'Pecahan Seperempat',
              urlImage: '3',
              urlBg: '3',
            ),
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi lima bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/5',
              title: 'Pecahan Seperlima',
              urlImage: '4',
              urlBg: '4',
            ),
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi enan bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/6',
              title: 'Pecahan Seperenam',
              urlImage: '5',
              urlBg: '5',
            ),
            _buildPage(
              color: Color(0xff0FA958),
              subtitle:
                  'Jika sebuah benda utuh dibagi menjadi delapan bagian sama besar, maka tiap-tiap bagian tersebut dinamakan 1/8',
              title: 'Pecahan Seperdelapan',
              urlImage: '6',
              urlBg: '6',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? ElevatedButton(
              onPressed: () {
                AudioPlayer().play(
                    volume: 0.3,
                    position: Duration(milliseconds: 0),
                    AssetSource('audios/click.mp4'));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(70),
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Get Started',
                  style: GoogleFonts.gothicA1(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            )
          : Container(
              color: Color.fromARGB(255, 209, 209, 209),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      AudioPlayer().play(
                          volume: 0.3,
                          position: Duration(milliseconds: 0),
                          AssetSource('audios/click.mp4'));
                      controller.jumpToPage(5);
                    },
                    child: Text(
                      'SKIP',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 6,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 12,
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Color(0xff1B82CD),
                      ),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AudioPlayer().play(
                          volume: 0.3,
                          position: Duration(milliseconds: 0),
                          AssetSource('audios/click.mp4'));
                      controller.jumpToPage(5);
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'NEXT',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subtitle,
          required String urlBg}) =>
      Container(
        color: color,
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg-${urlBg}.jpg'),
              )),
              padding: const EdgeInsets.all(0),
            ),
            Opacity(
              opacity: 0.7,
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0xff1B82CD)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 140),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/images/pecahan-${urlImage}.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.gothicA1(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(height: 14),
                        Text(
                          subtitle,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.gothicA1(
                              // letterSpacing: 10,
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 230, 230, 230)),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      );
}
