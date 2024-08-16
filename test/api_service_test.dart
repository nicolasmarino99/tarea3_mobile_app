import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarea3_mobile_app/api_service.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('ApiService', () {
    final mockApiService = MockApiService();

    test('fetchProducts returns a list of products', () async {
      when(mockApiService.fetchProducts()).thenAnswer(
        (_) async => [
          {'name': 'Product 1'},
          {'name': 'Product 2'},
        ],
      );

      final products = await mockApiService.fetchProducts();
      expect(products.length, 2);
      expect(products[0]['name'], 'Product 1');
    });

    test('createProduct adds a product', () async {
      when(mockApiService.createProduct(any)).thenAnswer((_) async {});

      await mockApiService.createProduct({'name': 'New Product'});
      verify(mockApiService.createProduct({'name': 'New Product'})).called(1);
    });
  });
}
