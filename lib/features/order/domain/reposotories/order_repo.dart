import 'package:dio/dio.dart';
import 'package:flutter_grocery/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_grocery/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_grocery/common/models/place_order_model.dart';
import 'package:flutter_grocery/features/order/domain/models/review_body_model.dart';
import 'package:flutter_grocery/common/models/api_response_model.dart';
import 'package:flutter_grocery/features/order/providers/image_note_provider.dart';
import 'package:flutter_grocery/helper/date_converter_helper.dart';
import 'package:flutter_grocery/main.dart';
import 'package:flutter_grocery/utill/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class OrderRepo {
  final DioClient? dioClient;
  OrderRepo({required this.dioClient});

  Future<ApiResponseModel> getOrderList() async {
    try {
      final response = await dioClient!.get(AppConstants.orderListUri);

      print("responserrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(response);
      print("responserrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getLevelList() async {
    try {
      final response = await dioClient!.get(AppConstants.levelListUri);

      print(": levlllllllvvvvvvvvvvvvvvvvvvvvvvvvv");
      print(response);
      print("responserrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getOrderDetails(
      String? orderID, String? phoneNumber) async {
    try {
      final response =
          await dioClient!.post(AppConstants.orderDetailsUri, data: {
        // 'order_id': orderID,
        'id': orderID,
        'phone': phoneNumber == 'null' ? null : phoneNumber,
      });

      // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      // print(response);
      // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  getOrderDetailsEdit(
    int? orderID,
  ) async {
    try {
      final response =
          await dioClient!.post(AppConstants.ordereditSubmitUri, data: {
        "id": orderID,
        "user_id": 1,
        "is_guest": 0,
        "order_amount": 480, // this amount Will be Updated in Edited Amount....
        "before_edit_order_amount":
            500, // this column contain Perviews Order Amount....
        "backup_amount": "0.00",
        "order_edit_refund": null,
        "coupon_discount_amount": 0,
        "coupon_discount_title": null,
        "payment_status": "paid",
        "order_status": "delivered",
        "total_tax_amount": 20,

        /// Fill This field with updated price data
        "total_distributed_amount": "100.00",
        "payment_method":
            "cash_on_delivery", // Check Here that Order Delivery Status Online or COD....
        "transaction_reference": null,
        "delivery_address_id": 1,
        "created_at": "2024-04-29T14:55:02.000000Z",
        "updated_at": "2024-05-19T10:28:10.000000Z",
        "checked": 1,
        "editable": 2, // 0 => N/A : 1 => Pending : 2 => response
        "edit_status": "accepted", // 'Null', 'Pending', 'accepted' , 'rejected'
        "delivery_man_id": 1,
        "delivery_charge": 100,
        "order_note": null,
        "coupon_code": null,
        "order_type": "delivery",
        "branch_id": 1,
        "time_slot_id": 3,
        "date": "2024-04-29",
        "delivery_date": "2024-04-28T18:30:00.000000Z",
        "callback": null,
        "extra_discount": "0.00",
        "delivery_address": {
          "id": 1,
          "address_type": "Home",
          "contact_person_number": "+919424567807",
          "address": "Unknown Location Found",
          "latitude": "24.4636883",
          "longitude": "74.886505",
          "created_at": "2024-04-29T14:54:29.000000Z",
          "updated_at": "2024-04-29T14:54:29.000000Z",
          "user_id": 1,
          "is_guest": 0,
          "contact_person_name": "Ashwary Agrawal",
          "road": "56",
          "house": "l-156",
          "floor": null
        },
        "payment_by": null,
        "payment_note": null,
        "free_delivery_amount": 0,
        "total_quantity": 4,
        "deliveryman_review_count": 1,
        "details_count": 0,
        "customer": {
          "id": 1,
          "f_name": "Ashwary",
          "l_name": "Agrawal",
          "email": "lucky.agrawal555@gmail.com",
          "image": null,
          "is_phone_verified": 0,
          "email_verified_at": null,
          "created_at": "2024-04-26T19:45:03.000000Z",
          "updated_at": "2024-06-18T17:31:15.000000Z",
          "email_verification_token": null,
          "phone": "+919424567807",
          "is_block": 0,
          "cm_firebase_token":
              "fsuyYdpNR7-wdJfCBXx2Tr:APA91bHkQe007AUW6NVXFWg8mZE7USyncrnXagcExAfXYL5jiDVzPx4Z4V-DYZ1vwatzHqmIYfPp--ClU_dt7WpS1QE8LEU9RX4cyt9JFI74ZEHNpkXYmcCeSjCAYjDzgr9mlW8vlaqC",
          "temporary_token": null,
          "login_medium": "general",
          "loyalty_point": 498,
          "wallet_balance": 112.2,
          "referral_code": "rBCv0f4pskbSwyJtMfRH",
          "referred_by": "2",
          "login_hit_count": 0,
          "is_temp_blocked": 0,
          "temp_block_time": null,
          "language_code": "en"
        },
        "delivery_man": {
          "id": 1,
          "f_name": "Test",
          "l_name": "Delivery Man",
          "phone": "+918889993220",
          "email": "testdelivery@gmail.com",
          "identity_number": "91515512154111",
          "identity_type": "passport",
          "identity_image": "[\"2024-05-10-663e182ce6d2b.png\"]",
          "image": "2024-05-10-663e182ce4592.png",
          "is_active": 1,
          // "password": "$2y$10$deAwUpsm7JWHU2H5PgNSheEvHbMF/b.QQ9hU7i5HjlMOFu0XDQOLe,
          "created_at": "2024-05-10T12:50:53.000000Z",
          "updated_at": "2024-05-10T12:50:53.000000Z",
          "auth_token": null,
          "fcm_token": null,
          "branch_id": 0,
          "application_status": "approved",
          "login_hit_count": 0,
          "is_temp_blocked": 0,
          "temp_block_time": null,
          "language_code": "en",
          "rating": [
            {"average": "4.0000", "delivery_man_id": 1}
          ]
        },
        "details": [
          {
            "id": 4,
            "product_id": 4,
            "alt_product_id":
                0, // Check here That Alternate product avaliable or not [no need to change]
            "alt_product_qyt": null,
            "alt_product_status":
                null, // change the status according to user response ['Pending', 'accepted' , 'rejected']
            "alt_product_details": null,
            "order_id": 100002,
            "price": 3,
            "product_details": {
              "id": 4,
              "name": "Corn Flakes",
              "description": "Good product",
              "image": ["def.png"],
              "price": 3,
              "variations": [],
              "tax": 0,
              "status": 1,
              "created_at": "2024-05-08T10:30:17.000000Z",
              "updated_at": "2024-05-17T05:36:23.000000Z",
              "attributes": [],
              "category_ids": [
                {"id": "1", "position": 0},
                {"id": "8", "position": 1}
              ],
              "choice_options": [],
              "discount": 1,
              "discount_type": "amount",
              "tax_type": "percent",
              "distributed_type": "percent",
              "distributed_amount": "89.00",
              "unit": "pc",
              "total_stock": 96,
              "capacity": 1,
              "daily_needs": 0,
              "popularity_count": 0,
              "is_featured": 0,
              "view_count": 0,
              "maximum_order_quantity": 10,
              "translations": [],
              "category_discount": null
            },
            "variation": [
              {"type": null}
            ],
            "discount_on_product": 1,
            "discount_type": "discount_on_product",
            "quantity": 1,
            "tax_amount": 0,
            "distributed_amount": 3,
            "created_at": "2024-05-13T09:01:12.000000Z",
            "updated_at": "2024-06-18T17:03:31.000000Z",
            "variant": "null",
            "unit": "pc",
            "is_stock_decreased": 1,
            "time_slot_id": 3,
            "delivery_date": "2024-05-13",
            "vat_status": "included",
            "add_on_ids": null,
            "add_on_qtys": null,
            "formatted_variation": null,
            "review_count": 0,
            "order": {
              "id": 100002,
              "user_id": 1,
              "is_guest": 0,
              "order_amount": 17,
              "before_edit_order_amount": "23.10",
              "backup_amount": "17.00",
              "order_edit_refund": 0,
              "coupon_discount_amount": 0,
              "coupon_discount_title": null,
              "payment_status": "unpaid",
              "order_status": "pending",
              "total_tax_amount": 18,
              "total_distributed_amount": "2.67",
              "payment_method": "cash_on_delivery",
              "transaction_reference": null,
              "delivery_address_id": 0,
              "created_at": "2024-05-13T09:01:12.000000Z",
              "updated_at": "2024-06-18T17:31:31.000000Z",
              "checked": 1,
              "editable": 2,
              "edit_status": "accepted",
              "delivery_man_id": null,
              "delivery_charge": 0,
              "order_note": null,
              "coupon_code": null,
              "order_type": "self_pickup",
              "branch_id": 1,
              "time_slot_id": 3,
              "date": "2024-05-13",
              "delivery_date": "2024-05-12T18:30:00.000000Z",
              "callback": null,
              "extra_discount": "0.00",
              "delivery_address": null,
              "payment_by": null,
              "payment_note": null,
              "free_delivery_amount": 0,
              "partial_payment": [],
              "offline_payment": null
            }
          },
          {
            "id": 2,
            "product_id": 3,
            "alt_product_id":
                0, // Check here That Alternate product avaliable or not
            "alt_product_qyt": null,
            "alt_product_status":
                "accepted", // change the status according to user response
            "alt_product_details": null,
            "order_id": 100002,
            "price": 3,
            "product_details": {
              "id": 3,
              "name": "Orange",
              "description": "Good product",
              "image": ["def.png"],
              "price": 3,
              "variations": [],
              "tax": 0,
              "status": 0,
              "created_at": "2024-05-08T10:30:17.000000Z",
              "updated_at": "2024-05-17T05:36:23.000000Z",
              "attributes": [],
              "category_ids": [
                {"id": "5", "position": 0},
                {"id": "14", "position": 1}
              ],
              "choice_options": [],
              "discount": 0,
              "discount_type": "percent",
              "tax_type": "percent",
              "distributed_type": "amount",
              "distributed_amount": "7.00",
              "unit": "pc",
              "total_stock": 1005,
              "capacity": 1,
              "daily_needs": 0,
              "popularity_count": 1,
              "is_featured": 0,
              "view_count": 2,
              "maximum_order_quantity": 10,
              "translations": [],
              "category_discount": null
            },
            "variation": [
              {"type": "Litre-Large"}
            ],
            "discount_on_product": 0,
            "discount_type": "discount_on_category",
            "quantity": 5,
            "tax_amount": 0,
            "distributed_amount": 0,
            "created_at": "2024-05-13T09:01:12.000000Z",
            "updated_at": "2024-06-18T17:01:57.000000Z",
            "variant": "null",
            "unit": "ltr",
            "is_stock_decreased": 1,
            "time_slot_id": 3,
            "delivery_date": "2024-05-13",
            "vat_status": "included",
            "add_on_ids": null,
            "add_on_qtys": null,
            "formatted_variation": {"type": "Litre-Large"},
            "review_count": 0,
            "order": {
              "id": 100002,
              "user_id": 1,
              "is_guest": 0,
              "order_amount": 17,
              "before_edit_order_amount": "23.10",
              "backup_amount": "17.00",
              "order_edit_refund": 0,
              "coupon_discount_amount": 0,
              "coupon_discount_title": null,
              "payment_status": "unpaid",
              "order_status": "pending",
              "total_tax_amount": 18,
              "total_distributed_amount": "2.67",
              "payment_method": "cash_on_delivery",
              "transaction_reference": null,
              "delivery_address_id": 0,
              "created_at": "2024-05-13T09:01:12.000000Z",
              "updated_at": "2024-06-18T17:31:31.000000Z",
              "checked": 1,
              "editable": 2,
              "edit_status": "accepted",
              "delivery_man_id": null,
              "delivery_charge": 0,
              "order_note": null,
              "coupon_code": null,
              "order_type": "self_pickup",
              "branch_id": 1,
              "time_slot_id": 3,
              "date": "2024-05-13",
              "delivery_date": "2024-05-12T18:30:00.000000Z",
              "callback": null,
              "extra_discount": "0.00",
              "delivery_address": null,
              "payment_by": null,
              "payment_note": null,
              "free_delivery_amount": 0,
              "partial_payment": [],
              "offline_payment": null
            }
          }
        ]
      });

      print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      print(response);
      print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');

      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> cancelOrder(String orderID) async {
    try {
      Map<String, dynamic> data = <String, dynamic>{};
      data['order_id'] = orderID;
      data['_method'] = 'put';
      final response =
          await dioClient!.post(AppConstants.orderCancelUri, data: data);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> trackOrder(
      String? orderID, String? phoneNumber) async {
    try {
      final response = await dioClient!.post(AppConstants.trackUri, data: {
        'order_id': orderID,
        'phone': phoneNumber == 'null' ? null : phoneNumber,
      });
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> submitOrder(
      String? orderID, String? phoneNumber) async {
    try {
      final response =
          await dioClient!.post(AppConstants.ordereditSubmitUri, data: {
        'order_id': orderID,
        'phone': phoneNumber == 'null' ? null : phoneNumber,
      });
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> placeOrder(PlaceOrderModel orderBody,
      {List<XFile?>? imageNote}) async {
    try {
      final response = await dioClient!.postMultipart(
        AppConstants.placeOrderUri,
        files: imageNote ?? [],
        fileKey: 'order_images',
        data: orderBody.toJson(),
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getDeliveryManData(String? orderID) async {
    try {
      final response =
          await dioClient!.get('${AppConstants.lastLocationUri}$orderID');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getTimeSlot() async {
    try {
      final response = await dioClient!.get(AppConstants.timeslotUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  List<String> getDateList() {
    List<String> dates = [];
    dates.add(DateConverterHelper.slotDate(DateTime.now()));
    dates.add(DateConverterHelper.slotDate(
        DateTime.now().add(const Duration(days: 1))));
    dates.add(DateConverterHelper.slotDate(
        DateTime.now().add(const Duration(days: 2))));

    return dates;
  }

  Future<ApiResponseModel> submitReview(ReviewBodyModel reviewBody) async {
    try {
      final response =
          await dioClient!.post(AppConstants.reviewUri, data: reviewBody);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> submitDeliveryManReview(
      ReviewBodyModel reviewBody) async {
    try {
      final response = await dioClient!
          .post(AppConstants.deliveryManReviewUri, data: reviewBody);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getDistanceInMeter(
      LatLng originLatLng, LatLng destinationLatLng) async {
    try {
      Response response = await dioClient!.get(
          '${AppConstants.distanceMatrixUri}'
          '?origin_lat=${originLatLng.latitude}&origin_lng=${originLatLng.longitude}'
          '&destination_lat=${destinationLatLng.latitude}&destination_lng=${destinationLatLng.longitude}');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
