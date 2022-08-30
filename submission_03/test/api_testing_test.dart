import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:submission_03/data/services/api_service.dart';

import 'api_testing_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group(
    'Fetch Api Restaurant',
    () {
      test(
        'returns an Restaurant if the http call completes successfully',
        () async {
          final client = MockDio();
          when(client.get('https://restaurant-api.dicoding.dev/list'))
              .thenAnswer(
            (_) async => Future.value(
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(
                  path: 'https://restaurant-api.dicoding.dev/list',
                ),
                data: {"count": 20},
              ),
            ),
          );
          final result = await ApiService(client).getRestaurantList();
          expect(result.count, equals(20));
        },
      );
    },
  );
}
