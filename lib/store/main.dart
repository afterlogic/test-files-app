import 'package:mobx/mobx.dart';

// This is our generated file (we'll see this soon!)
part 'main.g.dart';

class SingletonStore {

  // SingletonStore._privateConstructor();

  static final MainStore instance = new MainStore();
}

// We expose this to be used throughout our project
class MainStore = _MainStore with _$MainStore;

// Our store class
abstract class _MainStore with Store {
  bool dev = false;

  @observable
  String hostName = 'http://test.afterlogic.com';

  @observable
  String authToken = '';

  @observable
  String folderPath = '/';

  @computed
  String get apiUrl => '$hostName/?Api/';

  @observable
  String currentFileUrl = '';

  @observable
  dynamic currentFile = {};

  @observable
  String output = '';

  @action
  void setAuthToken(v) {
    authToken = v;
  }

  @action
  void setFolderPath(v) {
    folderPath = v;
  }

  @action
  void setCurrentFileUrl(v) {
    currentFileUrl = v;
  }

  @action
  void setCurrentFile(v) {
    currentFile = v;
  }

  @action
  void setOutput(v) {
    output = v;
  }
}