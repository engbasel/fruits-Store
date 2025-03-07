import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

/// Base class for handling failures across the application.
/// Stores an error message that can be displayed to the user.
abstract class Failure {
  final String message;

  Failure(this.message);
}

/// Handles various server-related failures, including API errors from Dio, HTTP, and Firebase Authentication.
class ServerFailure extends Failure {
  ServerFailure(super.message);

  /// Handles errors from Firebase Authentication API.
  /// Maps Firebase-specific exceptions to user-friendly messages.
  factory ServerFailure.fromFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return ServerFailure('البريد الإلكتروني غير صالح.');
      case 'user-disabled':
        return ServerFailure('تم تعطيل هذا الحساب من قبل المسؤول.');
      case 'user-not-found':
        return ServerFailure('المستخدم غير موجود. تحقق من البريد الإلكتروني.');
      case 'wrong-password':
        return ServerFailure('كلمة المرور غير صحيحة. حاول مرة أخرى.');
      case 'email-already-in-use':
        return ServerFailure(
            'البريد الإلكتروني مستخدم بالفعل. جرب تسجيل الدخول.');
      case 'weak-password':
        return ServerFailure(
            'كلمة المرور ضعيفة جدًا. يرجى اختيار كلمة مرور أقوى.');
      case 'too-many-requests':
        return ServerFailure('محاولات كثيرة جدًا. حاول لاحقًا.');
      case 'network-request-failed':
        return ServerFailure('تحقق من اتصال الإنترنت الخاص بك.');
      case 'operation-not-allowed':
        return ServerFailure('عملية تسجيل الدخول غير مسموح بها.');
      default:
        return ServerFailure('حدث خطأ غير متوقع أثناء المصادقة.');
    }
  }

  /// Handles errors from Dio API requests.
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهت مهلة الاتصال بالخادم.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت مهلة إرسال البيانات.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت مهلة استلام البيانات.');
      case DioExceptionType.badCertificate:
        return ServerFailure('شهادة غير صالحة من الخادم.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 500, e.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب.');
      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد اتصال بالإنترنت.');
      case DioExceptionType.unknown:
        return ServerFailure('حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.');
    }
  }

  /// Handles errors from the HTTP package.
  factory ServerFailure.fromHttpResponse(http.Response response) {
    return ServerFailure.fromResponse(response.statusCode, response.body);
  }

  /// Maps API response status codes to user-friendly error messages.
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(extractErrorMessage(response) ?? 'طلب غير مصرح به.');
    } else if (statusCode == 404) {
      return ServerFailure('المورد المطلوب غير موجود.');
    } else if (statusCode == 500 || statusCode == 503) {
      return ServerFailure('الخادم غير متوفر حاليًا. حاول لاحقًا.');
    } else {
      return ServerFailure('حدث خطأ غير متوقع.');
    }
  }

  /// Extracts meaningful error messages from API responses if available.
  static String? extractErrorMessage(dynamic response) {
    try {
      if (response is Map<String, dynamic>) {
        return response['error']?['message'] ??
            response['message'] ??
            response.toString();
      } else if (response is String) {
        return response;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
