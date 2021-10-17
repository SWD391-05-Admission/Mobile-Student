import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_customer/models/talkshow.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:video_player/video_player.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen();
  static const routesName = '/save';

  @override
  _SaveScreenState createState() => _SaveScreenState();
}

PageController _pageControllerCongDong;

List<Talkshow> listTalkshow = Talkshow.createListTalkshow();
List<User> listConsultant = User.createListConsulant();
int _currentIndexCongDong = 0;
Icon _like = Icon(
  Icons.favorite_border,
  size: 50,
  color: Colors.white,
);

class _SaveScreenState extends State<SaveScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  // @override
  // void initState() {
  //   _pageControllerCongDong = PageController(
  //     viewportFraction: 1,
  //   );
  //   super.initState();
  // }
  List listVideo = [
    // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
  ];
  bool isPlay = true;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //   // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    // );
    _controller = VideoPlayerController.asset(
      listVideo[0],
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isCongDong = true;
  @override
  Widget build(BuildContext context) {
    final double _sizeHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final double _sizeWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageControllerCongDong,
        itemCount: listVideo.length,
        itemBuilder: (context, index) {
          isPlay = true;
          log('INDEX : $index');
          log('INDEX CONG DONG : $_currentIndexCongDong');
          _controller = VideoPlayerController.asset(
            listVideo[index],
          );
          _initializeVideoPlayerFuture = _controller.initialize();
          // return GestureDetector(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       color: Color(0xFFDDDDDD),
          //       border: Border.all(
          //         color: Colors.black54,
          //         width: 0.07,
          //       ),
          //     ),
          //     // height: 700,
          //     child: Column(
          //       // crossAxisAlignment: CrossAxisAlignment.start,
          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         // SizedBox(
          //         //   height: 1,
          //         // ),
          //         Padding(
          //           padding: const EdgeInsets.only(top: 24),
          //           child: SizedBox(
          //             // height: 100,
          //             // width: 100,
          //             // child:
          //             //     Image.network(listTalkshow[index].image),
          //             child: ClipRRect(
          //               // borderRadius: BorderRadius.circular(4.0),
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(4),
          //                   topRight: Radius.circular(4)),
          //               child: Image.network(listConsultant[index].image),
          //             ),
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             SizedBox(
          //               width: _sizeWidth * 0.02,
          //             ),
          //             Text(
          //               'Address : ${listConsultant[index].address}',
          //               style: TextStyle(
          //                 fontFamily: AppFonts.poppins,
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             SizedBox(
          //               width: _sizeWidth * 0.02,
          //             ),
          //             Text(
          //               'Birthday : ${listConsultant[index].birthday}',
          //               style: TextStyle(
          //                 fontFamily: AppFonts.poppins,
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           children: [
          //             SizedBox(
          //               width: _sizeWidth * 0.02,
          //             ),
          //             (index == 2)
          //                 ? Row(
          //                     children: [
          //                       Text(
          //                         'Fullname : ${listConsultant[index].fullName}',
          //                         style: TextStyle(
          //                           fontFamily: AppFonts.poppins,
          //                           fontSize: 12,
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: _sizeWidth * 0.53,
          //                       ),
          //                       // Text(
          //                       //   'See more >>',
          //                       //   style: TextStyle(
          //                       //     fontFamily: AppFonts.poppins,
          //                       //     fontSize: 12,
          //                       //   ),
          //                       // )
          //                     ],
          //                   )
          //                 : Text(
          //                     'Price : ${listTalkshow[index].price}',
          //                     style: TextStyle(
          //                       fontFamily: AppFonts.poppins,
          //                       fontSize: 12,
          //                     ),
          //                   ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/talkshow-detail-screen',
          //         arguments: listTalkshow[index]);
          //   },
          // );
          return GestureDetector(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // setState(() {
                  //   _controller = VideoPlayerController.network(
                  //     listVideo[index],
                  //   );
                  // });
                  _controller.play();
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Positioned(
                          child: GestureDetector(
                            child: _like,
                            onTap: () {
                              if (_like.icon == Icons.favorite_rounded) {
                                setState(() {
                                  _like = Icon(
                                    Icons.favorite_border,
                                    size: 50,
                                    color: Colors.red,
                                  );
                                });
                              } else {
                                setState(() {
                                  _like = Icon(
                                    Icons.favorite_rounded,
                                    size: 50,
                                    color: Colors.red,
                                  );
                                });
                              }

                              log('TAP LIKE');
                            },
                          ),
                          // top: _sizeHeight * 0.1,
                          top: _sizeHeight * 0.46,
                          left: _sizeWidth * 0.85,
                        ),
                        // Positioned(
                        //   child: GestureDetector(
                        //     child: Icon(
                        //       Icons.message_outlined,
                        //       size: 40,
                        //       color: Colors.white,
                        //     ),
                        //     onTap: () {
                        //       log('TAP COMMENT');
                        //     },
                        //   ),
                        //   // top: _sizeHeight * 0.1,
                        //   top: _sizeHeight * 0.5,
                        //   left: _sizeWidth * 0.88,
                        // ),
                        // Positioned(
                        //   child: GestureDetector(
                        //     child: Icon(
                        //       Icons.share,
                        //       size: 40,
                        //       color: Colors.white,
                        //     ),
                        //     onTap: () {
                        //       log('TAP SHARE');
                        //     },
                        //   ),
                        //   // top: _sizeHeight * 0.1,
                        //   top: _sizeHeight * 0.6,
                        //   left: _sizeWidth * 0.88,
                        // ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black54,
                    ),
                  );
                }
              },
            ),
            onTap: () {
              if (isPlay) {
                _controller.pause();
                isPlay = false;
              } else {
                _controller.play();
                isPlay = true;
              }
            },
          );
        },
        onPageChanged: (index) {
          // setState(() {
          //   _currentIndexCongDong = index;
          // });
          // log('INDEC CONG DONG $_currentIndexCongDong');
        },
      ),
    );
    // return Scaffold(
    //   body: FutureBuilder(
    //     future: _initializeVideoPlayerFuture,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         // If the VideoPlayerController has finished initialization, use
    //         // the data it provides to limit the aspect ratio of the video.
    //         return AspectRatio(
    //           aspectRatio: _controller.value.aspectRatio,
    //           // Use the VideoPlayer widget to display the video.
    //           child: VideoPlayer(_controller),
    //         );
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState(() {
    //         if (_controller.value.isPlaying) {
    //           _controller.pause();
    //         } else {
    //           _controller.play();
    //         }
    //       });
    //     },
    //     child: Icon(
    //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
    //     ),
    //   ),
    // );
  }
}
