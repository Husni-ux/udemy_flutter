import 'package:flutter/material.dart';

// import 'package:scanner/Scanner.dart';
// import 'package:scanner/create_QR.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/qrReader/cubit/cubit.dart';
import 'package:udemy_flutter/layout/qrReader/cubit/state.dart';

import 'Scanner.dart';
import 'create_Qr.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QrCubit(),
      child: BlocConsumer<QrCubit , QrState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = QrCubit.get(context);
          return Scaffold(
              appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text(
                cubit.titles[cubit.currentIndex]
              ),
          ),

          bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index){
          cubit.changeBottomBarScreen(index);
          },
          items: cubit.bottomItem,
          ),
            body: cubit.Scr[cubit.currentIndex],
          );

          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateColor.resolveWith(
          //                   (states) => Color(0xFF008080)),
          //         ),
          //         onPressed: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (ctx) => CreateScanner()));
          //         },
          //         child: Text('Create QR Code'),
          //       ),
          //       ElevatedButton(
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateColor.resolveWith(
          //                   (states) => Color(0xFF008080)),
          //         ),
          //         onPressed: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (ctx) => Scanner()));
          //         },
          //         child: Text('Read QR Code'),
          //       ),
          //     ],
          //   ),
          // ),

        },

      ),
    );
  }
}