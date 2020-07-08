import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcelpros/screens/bedRoom.dart';

import 'bedRoomProvider.dart';

class BedRoomStateLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BedRoomProvider(),
      child: Scaffold(
        body: BedRoom(),
      ),
    );
  }
}
