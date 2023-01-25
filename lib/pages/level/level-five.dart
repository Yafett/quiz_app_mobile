import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'level-six.dart';

class LevelFivePage extends StatefulWidget {
  var score;
  LevelFivePage({super.key, this.score});

  @override
  State<LevelFivePage> createState() => _LevelFivePageState();
}

class _LevelFivePageState extends State<LevelFivePage> {
  final _answerController = TextEditingController();

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
                          'Soal ke - 5',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.coiny(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Score : ${widget.score}',
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
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Angka 3 pada bentuk pecahan 1/3 menunjukkan....',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18),
                    )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                    color: Color(0xff555555), fontSize: 20),
                                controller: _answerController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  hintText: 'Masukkan Jawabanmu',
                                  hintStyle: GoogleFonts.poppins(
                                      color: Color(0xffADADAD), fontSize: 20),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            AudioPlayer().play(
                                volume: 1,
                                position: Duration(milliseconds: 0),
                                AssetSource('audios/click.mp4'));
                            if (_answerController.text
                                    .toString()
                                    .toLowerCase() !=
                                'penyebut') {
                              _buildWrongDialog();
                            } else {
                              _buildCorrectDialog();
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffE4AA13),
                            ),
                            child: Center(
                                child: Text(
                              'Lanjutkan',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
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
                            builder: (context) =>
                                LevelSixPage(score: widget.score + 1)));
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
                        'Jawaban yang benar adalah Penyebut',
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
                            builder: (context) =>
                                LevelSixPage(score: widget.score)));
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
