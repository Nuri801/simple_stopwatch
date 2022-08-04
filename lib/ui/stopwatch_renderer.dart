import 'package:flutter/material.dart';
import 'package:new_stopwatch/ui/clock_markers.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer({
    Key? key,
    required this.radius,
  }) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            top: radius,
            left: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
      ],
    );
  }
}


// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:new_stopwatch/ui/clock_hand.dart';
// import 'package:new_stopwatch/ui/clock_markers.dart';
// import 'elapsed_time_text.dart';
//
// class StopWatchRenderer extends StatelessWidget {
//   const StopWatchRenderer(
//       {Key? key, required this.elapsed, required this.radius})
//       : super(key: key);
//
//   final Duration elapsed;
//   final double radius;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         for (var i = 0; i < 60; i++)
//           Positioned(
//               left: radius,
//               top: radius,
//               child: ClockSecondsTickMarker(
//               seconds: i, radius: radius)
//           ),
//         for (var i = 5; i <=60; i += 5)
//           Positioned(
//               left: radius,
//               top: radius,
//               child: ClockTextMarker(
//                 value: i,
//                 maxValue: 60,
//                 radius: radius,
//               )
//           ),
//         Positioned(
//           left: radius,
//           top: radius,
//           child: ClockHand(
//               rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
//               handThickness: 2,
//               color: Colors.orange,
//               handLength: radius
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           top: radius * 1.3,
//           child: ElapsedTimeText(
//             elapsed: elapsed,
//           ),
//         ),
//       ],
//     );
//   }
// }
