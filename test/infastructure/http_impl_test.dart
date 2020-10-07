import 'dart:convert';

import 'package:beep/domain/Interface/local_storage_interface.dart';
import 'package:beep/domain/Interface/network_interface.dart';
import 'package:beep/infrastructure/models/lawyers.dart';
import 'package:beep/infrastructure/repositories/http_api_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements NetworkInterface {}
class MockLocalRepo extends Mock implements LocalStorageInterface {}

void main() {
  HttpApiImpl apiImpl;
  MockHttpClient client;
  MockLocalRepo storage;

  setUp(() {
    client = MockHttpClient();
    storage = MockLocalRepo();
    apiImpl = HttpApiImpl(localStorageRepo: storage, client: client);
  });
  
  group('from Json', () {
    test(
      'Check lawyer response',
      () async {
        // arrange
        final jsonMap = jsonDecode(fixture('lawyers.json'));
        final lawyerMap = jsonMap["response"]["content"]["details"];
        // act
        // final response = apiImpl
        // assert
        // expect(lawyerList[0].firstname, "bane");
      },
    );
  });
}
