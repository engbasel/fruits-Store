// ignore_for_file: file_names

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

/// Base class for handling failures across the application.
/// Stores an error message that can be displayed to the user.
abstract class Failure {
  final String message;

  Failure(this.message);
}

/// Handles various server-related failures, including API errors from Dio and HTTP.
class ServerFailure extends Failure {
  ServerFailure(super.message);

  /// Handles errors that occur while using Dio for API requests.
  /// It maps Dio-specific exceptions to user-friendly messages.
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the API server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the API server.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from API server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 500, e.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled.');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection.');
      case DioExceptionType.unknown:
        return ServerFailure(
            'Oops! An unexpected error occurred. Please try again.');
    }
  }

  /// Handles errors that occur while using the http package for API requests.
  /// It extracts and maps the response status codes to meaningful error messages.
  factory ServerFailure.fromHttpResponse(http.Response response) {
    return ServerFailure.fromResponse(response.statusCode, response.body);
  }

  /// Maps API response status codes to user-friendly error messages.
  /// Provides specific messages for common HTTP error codes.
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          extractErrorMessage(response) ?? 'Unauthorized request.');
    } else if (statusCode == 404) {
      return ServerFailure(
          'Requested resource was not found. Please try again later.');
    } else if (statusCode == 500 || statusCode == 503) {
      return ServerFailure(
          'Server is currently unavailable. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  /// Extracts meaningful error messages from API responses if available.
  /// This method ensures that user-facing messages are clear and informative.
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
