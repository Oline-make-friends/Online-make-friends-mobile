import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Alert {
  static showLoadingIndicatorDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            // child: Container(
            //   height: 220,
            //   width: 100,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.rectangle,
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   // child: Column(
            //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   //   children: [
            //   //     CircleAvatar(
            //   //       backgroundColor: Colors.transparent,
            //   //       radius: 45,
            //   //       child: Image.network(
            //   //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr-dOUIjd8RtyY5Ts-tfgaZXjKa0L8IeQvDw&usqp=CAU"),
            //   //     ),
            //   //     const Center(
            //   //       child: CircularProgressIndicator(
            //   //         color: Colors.black,
            //   //       ),
            //   //     )
            //   //   ],
            //   // ),
            //   child: Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // ),
            child: Center(
              child: Container(
                width: 130,
                height: 130,
                child: RiveAnimation.network(
                    'https://public.rive.app/community/runtime-files/2136-4216-hexasphere-loading-animation.riv'),
              ),
            ),
          );
        });
  }
}
