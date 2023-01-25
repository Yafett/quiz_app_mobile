import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permainan_matematika/pages/level/level-two.dart';

class LevelOnePage extends StatefulWidget {
  const LevelOnePage({super.key});

  @override
  State<LevelOnePage> createState() => _LevelOnePageState();
}

class _LevelOnePageState extends State<LevelOnePage> {
  var score = 0;
  var jawaban;

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  _buildScaffold() {
    return Scaffold(
        body: Container(
      child: Stack(children: [
        _buildBackgroundImage(),
        _buildBackgroundEffect(),
        SafeArea(
          child: Container(
            // padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Soal ke - 1',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.coiny(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Score : 0',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.coiny(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Yang menunjukkan pecahan 1/3 adalah....',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18),
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                _buildWrongDialog();
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      scale: 1.3,
                                      image: AssetImage(
                                          'assets/images/level-one-1.png'),
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                _buildWrongDialog();
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      scale: 1.5,
                                      image: AssetImage(
                                        'assets/images/level-one-2.jpeg',
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                _buildCorrectDialog();
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image:   DecorationImage(
                                      scale: 1.5,
                                       image: AssetImage(
                                          'assets/images/level-one-3.png'),
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                _buildWrongDialog();
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      scale: 2,
                                      image: AssetImage(
                                          'assets/images/level-one-4.png'),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }

  _buildBackgroundImage() {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: AssetImage('assets/images/background.gif'),
      )),
      padding: const EdgeInsets.all(20),
    );
  }

  _buildBackgroundEffect() {
    return Opacity(
      opacity: 0.8,
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
    );
  }

  _buildCorrectDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image(
                          image: AssetImage('assets/images/happy.png'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Yeayy, jawabanmu benar!',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Color(0xff555555)),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    AudioPlayer().play(
                        volume: 1,
                        position: Duration(milliseconds: 0),
                        AssetSource('audios/click.mp4'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelTwoPage(
                                  score: 1,
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff0FA958),
                    ),
                    child: Center(
                        child: Text(
                      'Lanjutkan',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _buildWrongDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        width: 80,
                        child: Image(
                          image: AssetImage('assets/images/sad.png'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Yahhh, jawabanmu salah!',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Color(0xff555555)),
                      ),
                      Text(
                        'Jawaban yang benar adalah lingkaran abu-abu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Color(0xff555555)),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    AudioPlayer().play(
                        volume: 1,
                        position: Duration(milliseconds: 0),
                        AssetSource('audios/click.mp4'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LevelTwoPage(
                                  score: 0,
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF24E1E),
                    ),
                    child: Center(
                        child: Text(
                      'Lanjutkan',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
