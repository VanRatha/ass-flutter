// import 'package:flutter/material.dart';
// import '../model/product_model.dart';
// import '../services/authentication.dart';
// import '../widget/Test_ItemOrder.dart';

// class HomeOrder extends StatelessWidget {
//   const HomeOrder({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Produce',
//           style: TextStyle(
//             fontSize: 30,
//             color: Colors.black,
//             fontWeight: null,
//           ),
//         ),
//         actions: [
//           const SizedBox(height: 100),
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: IconButton(
//               onPressed: () async {
//                 await AuthenticationService().logout();
//               },
//               icon: const Icon(Icons.logout),
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           // Container(
//           //   height: 150,
//           //   color: Color.fromARGB(255, 201, 41, 95),
//           //   child: Row(
//           //     children: [
//           //       Stack(
//           //         clipBehavior: Clip.none,
//           //         children: [
//           //           Positioned(
//           //             top: -380,
//           //             right: -110,
//           //             child: Container(
//           //               height: 600,
//           //               width: 600,
//           //               decoration: const BoxDecoration(
//           //                 color: Color.fromARGB(255, 183, 15, 71),
//           //                 shape: BoxShape.circle,
//           //               ),
//           //             ),
//           //           ),
//           //           Row(
//           //             children: const [
//           //               SizedBox(width: 20),
//           //               Text(
//           //                 "Order",
//           //                 style: TextStyle(
//           //                     fontSize: 30,
//           //                     fontWeight: FontWeight.w600,
//           //                     color: Colors.white),
//           //               ),
//           //               //     SizedBox(width: 250),
//           //               //     Text(
//           //               //       "Close",
//           //               //       style: TextStyle(
//           //               //           fontSize: 20,
//           //               //           fontWeight: FontWeight.w600,
//           //               //           color: Colors.white),
//           //               //     ),
//           //             ],
//           //           ),
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Container(
//             height: 150,
//             margin: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               // boxShadow: const [
//               //   BoxShadow(
//               //     blurRadius: 10,
//               //     spreadRadius: 3,
//               //     offset: Offset(0, 3),
//               //     color: Colors.white,
//               //   )
//               // ],
//               border: Border.all(
//                 color: Colors.red,
//                 width: 1,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "   Subtotal                                     \$49.50",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       "   Tax & Fees                                   \$2.75",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       "   Deleviery                                       Free",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.grey),
//                     ),
//                     Text(
//                       "   Total                                           \$52.25",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Positioned(
//           //   top: -380,
//           //   right: -110,
//           //   child: Container(
//           //     height: 600,
//           //     width: 600,
//           //     decoration: const BoxDecoration(
//           //         color: Color.fromARGB(255, 183, 15, 71),
//           //         shape: BoxShape.circle),
//           //   ),
//           // ),
//           Expanded(
//             child: ListView.separated(
//               padding: const EdgeInsets.all(0),
//               itemBuilder: (context, index) {
//                 var data = Order.orderlist[index];
//                 return ItemOrder(OrderModel: data);
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider(
//                   color: Colors.black,
//                   thickness: 1,
//                   height: 0,
//                 );
//               },
//               itemCount: Order.orderlist.length,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         alignment: Alignment.center,
//         height: 50.0,
//         //color: Colors.red,
//         margin: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.red,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: const Text(
//           'CheckOut',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
