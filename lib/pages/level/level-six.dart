import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permainan_matematika/pages/home-page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelSixPage extends StatefulWidget {
     var score;
  LevelSixPage({super.key, this.score});

  @override
  State<LevelSixPage> createState() => _LevelSixPageState();
}

class _LevelSixPageState extends State<LevelSixPage> {
  final _answerController = TextEditingController();
  var name;

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
                          'Soal ke - 6',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: GoogleFonts.coiny(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Score : ${widget.score.toString()}',
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
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              image: DecorationImage(
                                scale: 1.5,
                                image:
                                    AssetImage('assets/images/level-six-1.png'),
                              )),
                          child: Container(),
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Bagian yang berwarna biru pada gambar di atas bernilai ….',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        )),
                      ],
                    ),
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
                          onTap: () async {
                            AudioPlayer().play(
                                volume: 1,
                                position: Duration(milliseconds: 0),
                                AssetSource('audios/click.mp4'));
                            final prefs = await SharedPreferences.getInstance();

                            name = prefs.getString('name');
                            if (_answerController.text.toString() != '2/4') {
                              _buildFinishDialog(widget.score.toString());
                            } else {
                              _buildFinishDialog(widget.score.toString());
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
                  ),
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

  _buildFinishDialog(score) {
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
                      Text(
                        'Selamat ${name.toString()}, Kamu Mendapatkan ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Color(0xff555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${widget.score.toString()} Point',
                        style: GoogleFonts.poppins(
                            fontSize: 58,
                            color: Color(0xff0FA958),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
}
