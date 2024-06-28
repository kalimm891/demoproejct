import 'package:flutter/material.dart';
import 'package:flutter_grocery/common/models/cart_model.dart';
import 'package:flutter_grocery/common/widgets/custom_button_widget.dart';
import 'package:flutter_grocery/features/order/domain/models/order_model.dart';
import 'package:flutter_grocery/helper/date_converter_helper.dart';
import 'package:flutter_grocery/helper/order_helper.dart';
import 'package:flutter_grocery/helper/responsive_helper.dart';
import 'package:flutter_grocery/helper/route_helper.dart';
import 'package:flutter_grocery/localization/app_localization.dart';
import 'package:flutter_grocery/localization/language_constraints.dart';
import 'package:flutter_grocery/main.dart';
import 'package:flutter_grocery/features/order/providers/order_provider.dart';
import 'package:flutter_grocery/common/providers/product_provider.dart';
import 'package:flutter_grocery/common/providers/theme_provider.dart';
import 'package:flutter_grocery/utill/color_resources.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:flutter_grocery/common/widgets/custom_loader_widget.dart';
import 'package:flutter_grocery/features/order/screens/order_details_screen.dart';
import 'package:flutter_grocery/features/order/widgets/re_order_dialog_widget.dart';
import 'package:provider/provider.dart';

import '../screens/edit_order_details.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget(
      {Key? key, required this.orderList, required this.index})
      : super(key: key);

  final List<OrderModel>? orderList;
  final int index;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  void initState() {
    // Provider.of<OrderProvider>(context, listen: false).getOrderDetailsEdit(
    //     orderID: widget.orderList![widget.index].id.toString());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteHelper.getOrderDetailsRoute(
              '${widget.orderList?[widget.index].id}'),
          arguments: OrderDetailsScreen(
              orderId: widget.orderList![widget.index].id,
              orderModel: widget.orderList![widget.index]),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context)
                ? 30
                : Dimensions.paddingSizeSmall),
            decoration: BoxDecoration(
              // color: Theme.of(context).cardColor,
              color: widget.orderList![widget.index].editable == 1
                  ? Color.fromARGB(255, 235, 172, 167)
                  : Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeTen),
            ),
            child: ResponsiveHelper.isDesktop(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                          child: Row(children: [
                            Text('${getTranslated('order_id', context)} #',
                                style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.fontSizeDefault)),
                            Text(widget.orderList![widget.index].id.toString(),
                                style: poppinsSemiBold.copyWith(
                                    fontSize: Dimensions.fontSizeDefault)),
                          ]),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                                '${'date'.tr}: ${DateConverterHelper.isoStringToLocalDateOnly(widget.orderList![widget.index].updatedAt!)}',
                                style: poppinsMedium),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${widget.orderList![widget.index].totalQuantity} ${getTranslated(widget.orderList![widget.index].totalQuantity == 1 ? 'item' : 'items', context)}',
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context).disabledColor),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _OrderStatusCard(
                                orderList: widget.orderList,
                                index: widget.index),
                          ],
                        )),
                        widget.orderList![widget.index].orderType != 'pos'
                            ? Consumer<ProductProvider>(
                                builder: (context, productProvider, _) =>
                                    Consumer<OrderProvider>(
                                        builder: (context, orderProvider, _) {
                                      bool isReOrderAvailable = orderProvider
                                                  .getReOrderIndex ==
                                              null ||
                                          (orderProvider.getReOrderIndex !=
                                                  null &&
                                              productProvider.product != null);

                                      return (orderProvider.isLoading ||
                                                  productProvider.product ==
                                                      null) &&
                                              widget.index ==
                                                  orderProvider
                                                      .getReOrderIndex &&
                                              !orderProvider.isActiveOrder
                                          ? Expanded(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                  CustomLoaderWidget(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ]))
                                          : Expanded(
                                              child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                _TrackOrderView(
                                                    orderList: widget.orderList,
                                                    index: widget.index,
                                                    isReOrderAvailable:
                                                        isReOrderAvailable),
                                              ],
                                            ));
                                    }))
                            : const Expanded(child: SizedBox()),
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(children: [
                          Text(
                              '${getTranslated('order_id', context)} #${widget.orderList![widget.index].id.toString()}',
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeDefault)),
                          const Expanded(child: SizedBox.shrink()),
                          Text(
                            DateConverterHelper.isoStringToLocalDateOnly(
                                widget.orderList![widget.index].updatedAt!),
                            style: poppinsMedium.copyWith(
                                color: Theme.of(context).disabledColor),
                          ),
                        ]),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Text(
                          '${widget.orderList![widget.index].totalQuantity} ${getTranslated(widget.orderList![widget.index].totalQuantity == 1 ? 'item' : 'items', context)}',
                          style: poppinsRegular.copyWith(
                              color: Theme.of(context).disabledColor),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: _OrderStatusCard(
                                    orderList: widget.orderList,
                                    index: widget.index),
                              ),
                              widget.orderList![widget.index].orderType != 'pos'
                                  ? Consumer<ProductProvider>(
                                      builder: (context, productProvider, _) =>
                                          Consumer<OrderProvider>(builder:
                                              (context, orderProvider, _) {
                                            bool isReOrderAvailable = orderProvider
                                                        .getReOrderIndex ==
                                                    null ||
                                                (orderProvider
                                                            .getReOrderIndex !=
                                                        null &&
                                                    productProvider.product !=
                                                        null);

                                            return (orderProvider.isLoading ||
                                                        productProvider
                                                                .product ==
                                                            null) &&
                                                    widget.index ==
                                                        orderProvider
                                                            .getReOrderIndex &&
                                                    !orderProvider.isActiveOrder
                                                ? CustomLoaderWidget(
                                                    color: Theme.of(context)
                                                        .primaryColor)
                                                : _TrackOrderView(
                                                    orderList: widget.orderList,
                                                    index: widget.index,
                                                    isReOrderAvailable:
                                                        isReOrderAvailable);
                                          }))
                                  : const SizedBox.shrink(),
                            ]),
                      ]),
          ),
          if (widget.orderList![widget.index].editable == 1)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OrderDetailsScreenEdit(
                            orderId: widget.orderList![widget.index].id,
                            orderModel: widget.orderList![widget.index])));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  // color: Theme.of(context).cardColor,
                  color: Colors.red,
                  // // boxShadow: [
                  // //   BoxShadow(
                  // //     color: Theme.of(context).shadowColor.withOpacity(0.5),
                  // //     spreadRadius: 1,
                  // //     blurRadius: 5,
                  // //   )
                  // ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Text(
                      "Order is edited and pending to approve",
                      style: poppinsRegular.copyWith(
                        color: Theme.of(context).cardColor,
                        fontSize: Dimensions.fontSizeDefault,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Click to review",
                      style: poppinsRegular.copyWith(
                        color: Theme.of(context).cardColor,
                        fontSize: Dimensions.fontSizeDefault,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TrackOrderView extends StatelessWidget {
  const _TrackOrderView(
      {Key? key,
      required this.orderList,
      required this.index,
      required this.isReOrderAvailable})
      : super(key: key);

  final List<OrderModel>? orderList;
  final int index;
  final bool isReOrderAvailable;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, orderProvider, child) {
      return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault),
            )),
        onPressed: () async {
          if (orderProvider.isActiveOrder) {
            Navigator.of(context).pushNamed(
                RouteHelper.getOrderTrackingRoute(orderList![index].id, null));
          } else {
            if (!orderProvider.isLoading && isReOrderAvailable) {
              orderProvider.setReorderIndex = index;
              List<CartModel>? cartList =
                  await orderProvider.reorderProduct('${orderList![index].id}');
              if (cartList != null && cartList.isNotEmpty) {
                showDialog(
                    context: Get.context!,
                    builder: (context) => const ReOrderDialogWidget());
              }
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Text(
            getTranslated(
                orderProvider.isActiveOrder ? 'track_order' : 're_order',
                context),
            style: poppinsRegular.copyWith(
              color: Theme.of(context).cardColor,
              fontSize: Dimensions.fontSizeDefault,
            ),
          ),
        ),
      );
    });
  }
}

class _OrderStatusCard extends StatelessWidget {
  const _OrderStatusCard(
      {Key? key, required this.orderList, required this.index})
      : super(key: key);

  final List<OrderModel>? orderList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
          vertical: Dimensions.paddingSizeExtraSmall),
      decoration: BoxDecoration(
        color: OrderStatus.pending.name == orderList![index].orderStatus
            ? ColorResources.colorBlue.withOpacity(0.08)
            : OrderStatus.out_for_delivery.name == orderList![index].orderStatus
                ? ColorResources.ratingColor.withOpacity(0.08)
                : OrderStatus.canceled.name == orderList![index].orderStatus
                    ? ColorResources.redColor.withOpacity(0.08)
                    : ColorResources.colorGreen.withOpacity(0.08),
        borderRadius: BorderRadius.circular(Dimensions.radiusSizeTen),
      ),
      child: Text(
        getTranslated(orderList![index].orderStatus, context),
        style: poppinsRegular.copyWith(
            color: OrderStatus.pending.name == orderList![index].orderStatus
                ? ColorResources.colorBlue
                : OrderStatus.out_for_delivery.name ==
                        orderList![index].orderStatus
                    ? ColorResources.ratingColor
                    : OrderStatus.canceled.name == orderList![index].orderStatus
                        ? ColorResources.redColor
                        : ColorResources.colorGreen),
      ),
    );
  }
}
