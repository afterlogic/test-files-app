// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$MainStore on _MainStore, Store {
  Computed<String> _$apiUrlComputed;

  @override
  String get apiUrl =>
      (_$apiUrlComputed ??= Computed<String>(() => super.apiUrl)).value;

  final _$hostNameAtom = Atom(name: '_MainStore.hostName');

  @override
  String get hostName {
    _$hostNameAtom.context.enforceReadPolicy(_$hostNameAtom);
    _$hostNameAtom.reportObserved();
    return super.hostName;
  }

  @override
  set hostName(String value) {
    _$hostNameAtom.context.conditionallyRunInAction(() {
      super.hostName = value;
      _$hostNameAtom.reportChanged();
    }, _$hostNameAtom, name: '${_$hostNameAtom.name}_set');
  }

  final _$authTokenAtom = Atom(name: '_MainStore.authToken');

  @override
  String get authToken {
    _$authTokenAtom.context.enforceReadPolicy(_$authTokenAtom);
    _$authTokenAtom.reportObserved();
    return super.authToken;
  }

  @override
  set authToken(String value) {
    _$authTokenAtom.context.conditionallyRunInAction(() {
      super.authToken = value;
      _$authTokenAtom.reportChanged();
    }, _$authTokenAtom, name: '${_$authTokenAtom.name}_set');
  }

  final _$folderPathAtom = Atom(name: '_MainStore.folderPath');

  @override
  String get folderPath {
    _$folderPathAtom.context.enforceReadPolicy(_$folderPathAtom);
    _$folderPathAtom.reportObserved();
    return super.folderPath;
  }

  @override
  set folderPath(String value) {
    _$folderPathAtom.context.conditionallyRunInAction(() {
      super.folderPath = value;
      _$folderPathAtom.reportChanged();
    }, _$folderPathAtom, name: '${_$folderPathAtom.name}_set');
  }

  final _$currentFileUrlAtom = Atom(name: '_MainStore.currentFileUrl');

  @override
  String get currentFileUrl {
    _$currentFileUrlAtom.context.enforceReadPolicy(_$currentFileUrlAtom);
    _$currentFileUrlAtom.reportObserved();
    return super.currentFileUrl;
  }

  @override
  set currentFileUrl(String value) {
    _$currentFileUrlAtom.context.conditionallyRunInAction(() {
      super.currentFileUrl = value;
      _$currentFileUrlAtom.reportChanged();
    }, _$currentFileUrlAtom, name: '${_$currentFileUrlAtom.name}_set');
  }

  final _$currentFileAtom = Atom(name: '_MainStore.currentFile');

  @override
  dynamic get currentFile {
    _$currentFileAtom.context.enforceReadPolicy(_$currentFileAtom);
    _$currentFileAtom.reportObserved();
    return super.currentFile;
  }

  @override
  set currentFile(dynamic value) {
    _$currentFileAtom.context.conditionallyRunInAction(() {
      super.currentFile = value;
      _$currentFileAtom.reportChanged();
    }, _$currentFileAtom, name: '${_$currentFileAtom.name}_set');
  }

  final _$outputAtom = Atom(name: '_MainStore.output');

  @override
  String get output {
    _$outputAtom.context.enforceReadPolicy(_$outputAtom);
    _$outputAtom.reportObserved();
    return super.output;
  }

  @override
  set output(String value) {
    _$outputAtom.context.conditionallyRunInAction(() {
      super.output = value;
      _$outputAtom.reportChanged();
    }, _$outputAtom, name: '${_$outputAtom.name}_set');
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void setAuthToken(dynamic v) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setAuthToken(v);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFolderPath(dynamic v) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setFolderPath(v);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentFileUrl(dynamic v) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setCurrentFileUrl(v);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentFile(dynamic v) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setCurrentFile(v);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOutput(dynamic v) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.setOutput(v);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }
}
