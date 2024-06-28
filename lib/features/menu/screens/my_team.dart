// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_grocery/localization/app_localization.dart';
// import 'package:provider/provider.dart';

// import '../../../common/widgets/web_app_bar_widget.dart';
// import '../../../helper/date_converter_helper.dart';
// import '../../../helper/responsive_helper.dart';
// import '../../../utill/color_resources.dart';
// import '../../../utill/dimensions.dart';
// import '../../../utill/styles.dart';
// import '../../order/providers/order_provider.dart';

// class MyTeamPages extends StatefulWidget {
//   const MyTeamPages({Key? key}) : super(key: key);

//   @override
//   State<MyTeamPages> createState() => _MyTeamPagesState();
// }

// class _MyTeamPagesState extends State<MyTeamPages> {
//   @override
//   void initState() {
//     Provider.of<OrderProvider>(context, listen: false).getLevelList(context);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ResponsiveHelper.isDesktop(context)
//           ? const PreferredSize(
//               preferredSize: Size.fromHeight(120), child: WebAppBarWidget())
//           : null,
//       body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
//         print("dtaa aayaaa bhai log");
//         print(orderProvider.levelOrderList);
//         print("dtaa aayaaa bhai log");
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 28.0, horizontal: 5),
//                 child: Row(
//                     children: List.generate(
//                         orderProvider.levelOrderList!.length,
//                         (index) => InkWell(
//                               onTap: () {

//                               },
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Text(orderProvider
//                                     .levelOrderList![index].level
//                                     .toString()),
//                               ),
//                             ))
//                     //  [
//                     //   levelCard(isTrue: true),
//                     //   levelCard(),
//                     //   levelCard(),
//                     // ],
//                     ),
//               ),
//               Column(
//                 children: List.generate(
//                     orderProvider.levelOrderList!.length,
//                     (index) => Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 22.0),
//                                 child: Text(
//                                   "All Users - 8",
//                                   style: poppinsBold.copyWith(
//                                       color: Color.fromARGB(255, 29, 97, 31),
//                                       fontSize: Dimensions.fontSizeLarge),
//                                 ),
//                               ),
//                             ),
//                             SingleChildScrollView(
//                               child: Column(
//                                 children: List.generate(
//                                   orderProvider
//                                       .levelOrderList![index].users!.length,
//                                   (i) => earningCard(context),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   earningCard(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 22, right: 2),
//           padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context)
//               ? 30
//               : Dimensions.paddingSizeSmall),
//           decoration: BoxDecoration(
//             // color: Theme.of(context).cardColor,
//             color: Theme.of(context).cardColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context).shadowColor.withOpacity(0.5),
//                 spreadRadius: 1,
//                 blurRadius: 5,
//               )
//             ],
//             borderRadius: BorderRadius.circular(Dimensions.radiusSizeTen),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(' User - Ashwary Mittal',
//                       style: poppinsBold.copyWith(
//                           fontSize: Dimensions.fontSizeDefault)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 4.0),
//                         child: Text("Total Orders",
//                             style: poppinsBold.copyWith(
//                                 fontSize: Dimensions.fontSizeDefault)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: Text("18",
//                             style: poppinsBold.copyWith(
//                                 color: Color.fromARGB(255, 29, 97, 31),
//                                 fontSize: Dimensions.fontSizeDefault)),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text("Total Referral",
//                           style: poppinsBold.copyWith(
//                               fontSize: Dimensions.fontSizeDefault)),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 14.0),
//                         child: Text("0",
//                             style: poppinsBold.copyWith(
//                                 color: Color.fromARGB(255, 29, 97, 31),
//                                 fontSize: Dimensions.fontSizeDefault)),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 4.0),
//                         child: Text("Last Order",
//                             style: poppinsBold.copyWith(
//                                 fontSize: Dimensions.fontSizeDefault)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 30.0),
//                         child: Text("15/05/24 19:15PM",
//                             style: poppinsBold.copyWith(
//                                 color: Color.fromARGB(255, 29, 97, 31),
//                                 fontSize: Dimensions.fontSizeDefault)),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Joining Date',
//                       style: poppinsRegular.copyWith(
//                           fontSize: Dimensions.fontSizeDefault)),
//                   Text("15/05/24 17:10PM",
//                       style: poppinsSemiBold.copyWith(
//                           fontSize: Dimensions.fontSizeDefault)),
//                   Container(
//                     margin: EdgeInsets.only(left: 18, top: 18, bottom: 5),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: Color.fromARGB(255, 29, 97, 31)),
//                     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                     child: Text("View More",
//                         style: poppinsRegular.copyWith(
//                             color: Colors.white,
//                             fontSize: Dimensions.fontSizeLarge)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (_) => OrderDetailsScreenEdit(
//             //             orderId: orderList![index].id,
//             //             orderModel: orderList![index])));
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             height: 50,
//             width: MediaQuery.of(context).size.width / 1.2,
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//               // color: Theme.of(context).cardColor,
//               color: Color.fromARGB(255, 177, 231, 179),
//               // // boxShadow: [
//               // //   BoxShadow(
//               // //     color: Theme.of(context).shadowColor.withOpacity(0.5),
//               // //     spreadRadius: 1,
//               // //     blurRadius: 5,
//               // //   )
//               // ],
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(15),
//                   bottomRight: Radius.circular(15)),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "TotalEarnings ₹1530",
//                   style: poppinsRegular.copyWith(
//                       color: Colors.green,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Container levelCard({bool isTrue = false}) {
//     return Container(
//       margin: EdgeInsets.only(left: 18),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: isTrue
//               ? Color.fromARGB(255, 29, 97, 31)
//               : Color.fromARGB(255, 177, 231, 179)),
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//       child: Text("Level 1",
//           style: poppinsRegular.copyWith(
//               color: isTrue ? Colors.white : Color.fromARGB(255, 29, 97, 31),
//               fontSize: Dimensions.fontSizeLarge)),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grocery/features/order/domain/models/level_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/web_app_bar_widget.dart';
import '../../../helper/responsive_helper.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../../order/providers/order_provider.dart';

class MyTeamPages extends StatefulWidget {
  const MyTeamPages({Key? key}) : super(key: key);

  @override
  State<MyTeamPages> createState() => _MyTeamPagesState();
}

class _MyTeamPagesState extends State<MyTeamPages> {
  int _selectedLevelIndex = 0; // Add this state variable

  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).getLevelList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveHelper.isDesktop(context)
          ? const PreferredSize(
              preferredSize: Size.fromHeight(120), child: WebAppBarWidget())
          : null,
      body: Consumer<OrderProvider>(builder: (context, orderProvider, child) {
        if (orderProvider.levelOrderList == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(vertical: 28.0, horizontal: 5),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    orderProvider.levelOrderList!.length,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          _selectedLevelIndex = index; // Update selected index
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _selectedLevelIndex == index
                                    ? Color.fromARGB(255, 29, 97, 31)
                                    : Color.fromARGB(255, 177, 231, 179)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: Text(
                                "Level ${orderProvider.levelOrderList![index].level.toString()}",
                                style: poppinsRegular.copyWith(
                                    color: _selectedLevelIndex == index
                                        ? Colors.white
                                        : Color.fromARGB(255, 29, 97, 31),
                                    fontSize: Dimensions.fontSizeLarge)),
                          )

                          // Text(
                          //   orderProvider.levelOrderList![index].level.toString(),
                          //   style: TextStyle(
                          //     color: _selectedLevelIndex == index
                          //         ? Colors.green
                          //         : Colors.black,
                          //     fontWeight: _selectedLevelIndex == index
                          //         ? FontWeight.bold
                          //         : FontWeight.normal,
                          //   ),
                          // ),
                          ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        "All Users - ${orderProvider.levelOrderList![_selectedLevelIndex].users!.length}",
                        style: poppinsBold.copyWith(
                            color: Color.fromARGB(255, 29, 97, 31),
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        orderProvider
                            .levelOrderList![_selectedLevelIndex].users!.length,
                        (i) => earningCard(
                            context,
                            orderProvider.levelOrderList![_selectedLevelIndex]
                                .users![i]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget earningCard(BuildContext context, Users user) {
    String formattedLastOrderDate = 'No orders';
    if (user.orders != null && user.orders!.isNotEmpty) {
      DateTime? lastOrderDate;
      try {
        lastOrderDate = DateTime.parse(user.orders!.last.createdAt!);
        formattedLastOrderDate =
            DateFormat('dd/MM/yy HH:mm').format(lastOrderDate);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    String joinOrderDate = '';
    if (user.createdAt != null && user.createdAt!.isNotEmpty) {
      DateTime? joinDate;
      try {
        joinDate = DateTime.parse(user.createdAt!);
        joinOrderDate = DateFormat('dd/MM/yy HH:mm').format(joinDate);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 22, right: 2),
          padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context)
              ? 30
              : Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(Dimensions.radiusSizeTen),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User - ${user.fName}',
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault)),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("Total Orders",
                            style: poppinsBold.copyWith(
                                fontSize: Dimensions.fontSizeDefault)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(user.orders!.length.toString(),
                            style: poppinsBold.copyWith(
                                color: Color.fromARGB(255, 29, 97, 31),
                                fontSize: Dimensions.fontSizeDefault)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total Referral",
                          style: poppinsBold.copyWith(
                              fontSize: Dimensions.fontSizeDefault)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text("0",
                            style: poppinsBold.copyWith(
                                color: Color.fromARGB(255, 29, 97, 31),
                                fontSize: Dimensions.fontSizeDefault)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text("Last Order",
                            style: poppinsBold.copyWith(
                                fontSize: Dimensions.fontSizeDefault)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(formattedLastOrderDate,
                            style: poppinsBold.copyWith(
                                color: Color.fromARGB(255, 29, 97, 31),
                                fontSize: Dimensions.fontSizeDefault)),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Joining Date',
                      style: poppinsRegular.copyWith(
                          fontSize: Dimensions.fontSizeDefault)),
                  Text(joinOrderDate,
                      style: poppinsSemiBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault)),
                  Container(
                    margin: EdgeInsets.only(left: 18, top: 18, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 29, 97, 31)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    child: Text("View More",
                        style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeLarge)),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => OrderDetailsScreenEdit(
            //             orderId: orderList![index].id,
            //             orderModel: orderList![index])));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 177, 231, 179),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                Text(
                  "Total Earnings ₹1530",
                  style: poppinsRegular.copyWith(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container levelCard({bool isTrue = false}) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTrue
              ? Color.fromARGB(255, 29, 97, 31)
              : Color.fromARGB(255, 177, 231, 179)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Text("Level 1",
          style: poppinsRegular.copyWith(
              color: isTrue ? Colors.white : Color.fromARGB(255, 29, 97, 31),
              fontSize: Dimensions.fontSizeLarge)),
    );
  }
}
