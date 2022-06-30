import 'package:flutter/material.dart';

// class GridPositionPage extends StatefulWidget {
//   @override
//   _GridPositionPageState createState() => _GridPositionPageState();
// }

// class _GridPositionPageState extends State<GridPositionPage> {

//   // ↓ hold tap position, set during onTapDown, using getPosition() method
//   Offset tapXY;
//   // ↓ hold screen size, using first line in build() method
//   RenderBox overlay;

//   @override
//   Widget build(BuildContext context) {
//     // ↓ save screen size
//     overlay = Overlay.of(context).context.findRenderObject();

//     return BaseExamplePage(
//       title: 'Grid Position',
//       child: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(100, (index) {
//           return Center(
//             child: InkWell(
//               child: Text(
//                 'Item $index',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//               // ↓ save screen tap position now
//               onTapDown: getPosition,
//               onLongPress: () => showMenu(
//                   context: context,
//                   position: relRectSize,
//                   items: [
//                     PopupMenuItem(
//                       child: FlatButton.icon(
//                         label: Text('Delete'),
//                         icon: Icon(Icons.delete),
//                       ),
//                     )
//                   ]
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   // ↓ create the RelativeRect from size of screen and where you tapped
//   RelativeRect get relRectSize => RelativeRect.fromSize(tapXY & const Size(40,40), overlay.size);

//   // ↓ get the tap position Offset
//   void getPosition(TapDownDetails detail) {
//     tapXY = detail.globalPosition;
//   }
// }