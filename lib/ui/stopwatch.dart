import 'package:flutter/material.dart';
import 'package:new_stopwatch/ui/reset_button.dart';
import 'package:new_stopwatch/ui/start_stop_button.dart';
import 'package:new_stopwatch/ui/stopwatch_renderer.dart';
import 'package:new_stopwatch/ui/stopwatch_ticker_ui.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  /// Global key used to manipulate the state of the StopwatchTickerUI
  final _tickerUIKey = GlobalKey<StopwatchTickerUIState>();
  bool _isRunning = false;

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
    });
    _tickerUIKey.currentState?.toggleRunning(_isRunning);
  }

  void _reset() {
    setState(() {
      _isRunning = false;
    });
    _tickerUIKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            // non-ticker dependent UI
            StopwatchRenderer(radius: radius),
            // ticker dependent UI
            StopwatchTickerUI(
              key: _tickerUIKey,
              radius: radius,
            ),
            // reset button
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            // start/stop button
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}






// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:new_stopwatch/ui/elapsed_time_text_basic.dart';
// import 'package:new_stopwatch/ui/reset_button.dart';
// import 'package:new_stopwatch/ui/start_stop_button.dart';
// import 'package:new_stopwatch/ui/stopwatch_renderer.dart';
//
// import 'elapsed_time_text.dart';
//
// class Stopwatch extends StatefulWidget {
//   @override
//   _StopwatchState createState() => _StopwatchState();
// }
//
// class _StopwatchState extends State<Stopwatch>
//     with SingleTickerProviderStateMixin {
//   Duration _previouslyElapsed = Duration.zero;
//   Duration _currentlyElapsed = Duration.zero;
//   Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;
//   late final Ticker _ticker;
//   bool _isRunning = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _ticker = this.createTicker((elapsed) {
//       setState(() {
//         _currentlyElapsed = elapsed;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _ticker.dispose();
//     super.dispose();
//   }
//
//    void _toggleRunning () {
//     setState(() {
//       _isRunning = ! _isRunning;
//       if (_isRunning) {
//         _ticker.start();
//       } else {
//         _ticker.stop();
//         _previouslyElapsed += _currentlyElapsed;
//         _currentlyElapsed = Duration.zero;
//       }
//     });
//    }
//
//    void _resetTimer () {
//     _ticker.stop();
//     setState(() {
//       _isRunning = false;
//       _previouslyElapsed = Duration.zero;
//       _currentlyElapsed = Duration.zero;
//     });
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final radius = constraints.maxWidth / 2;
//       // print(radius);/
//       return Stack(children: [
//         StopWatchRenderer(
//           elapsed: _elapsed,
//           radius: radius,
//         ),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: SizedBox(
//             width: 80,
//             height: 80,
//             child: ResetButton(
//               onPressed: _resetTimer,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: SizedBox(
//             width: 80,
//             height: 80,
//             child: StartStopButton(
//               isRunning: _isRunning,
//               onPressed: _toggleRunning,
//             ),
//           ),
//         ),
//        ]
//       );
//     });
//   }
// }
