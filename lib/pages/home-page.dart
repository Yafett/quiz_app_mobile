import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permainan_matematika/pages/introduction-page.dart';
import 'package:permainan_matematika/pages/level/level-one.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  final keyFour = GlobalKey();

  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => ShowCaseWidget.of(context).startShowCase([
              keyOne,
              keyTwo,
              keyThree,
              keyFour,
            ]));
    final _assetsAudioPlayer = AssetsAudioPlayer.withId('0');

    // _assetsAudioPlayer.stop();
    _assetsAudioPlayer.open(
      Audio('assets/audios/background.mp4'),
      autoStart: false,
      showNotification: false,
      loopMode: LoopMode.playlist,
      volume: 0.1,
    );
    _assetsAudioPlayer.playOrPause();
    _assetsAudioPlayer.setVolume(0.1);
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Widget _buildScaffold() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              _buildBackgroundImage(),
              _buildBackgroundEffect(),
              Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Game  Pecahan Sederhana',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: GoogleFonts.coiny(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 130),
                      Column(
                        children: [
                          Showcase(
                            key: keyOne,
                            description: 'Masukan Namamu disini',
                            child: Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.amber,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff555555),
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 35),
                                        hintText: 'Masukkan Namamu',
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Color(0xffFFE295),
                                            fontSize: 26,
                                            fontWeight: FontWeight.w600),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Colors.amber,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: 15),
                          Showcase(
                            key: keyTwo,
                            description: 'Klik disini untuk Mulai Permainan',
                            child: GestureDetector(
                              onTap: () async {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                print('object');
                                final prefs =
                                    await SharedPreferences.getInstance();

                                prefs.setString(
                                    'name', _nameController.text.toString());

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LevelOnePage()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Mulai',
                                      style: GoogleFonts.poppins(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff49ABD9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Showcase(
                            key: keyThree,
                            description:
                                'Klik disini untuk Melihat Materi Mengenai Pecahan',
                            child: GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            IntroductionPage()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Cara Mengerjakan',
                                      style: GoogleFonts.poppins(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff49ABD9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Showcase(
                            key: keyFour,
                            description:
                                'Klik disini untuk Keluar dari Permainan',
                            child: GestureDetector(
                              onTap: () {
                                AudioPlayer().play(
                                    volume: 1,
                                    position: Duration(milliseconds: 0),
                                    AssetSource('audios/click.mp4'));
                                _buildExitModal();
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Keluar',
                                      style: GoogleFonts.poppins(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff49ABD9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  _buildExitModal() {
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
                          image: AssetImage('assets/images/exit.png'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Kamu yakin ingin keluar?',
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Color(0xff555555)),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AudioPlayer().play(
                            volume: 1,
                            position: Duration(milliseconds: 0),
                            AssetSource('audios/click.mp4'));
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff0FA958),
                        ),
                        child: Center(
                            child: Text(
                          'Tidak',
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AudioPlayer().play(
                            volume: 1,
                            position: Duration(milliseconds: 0),
                            AssetSource('audios/click.mp4'));
                        SystemNavigator.pop();
                        exit(0);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffF24E1E),
                        ),
                        child: Center(
                            child: Text(
                          'Iya',
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
