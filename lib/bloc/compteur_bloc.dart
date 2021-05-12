import 'dart:async';

class CompteurBloc {
  final _streamCtrl = StreamController<int>();

  dispose() {
    _streamCtrl.close();
  }

  Sink<int> get sink {
    return _streamCtrl.sink;
  }

  Stream<int> get stream {
    return _streamCtrl.stream;
  }

  /// LOGIQUE

  int _compteur = 0;

  CompteurBloc() {
    sink.add(_compteur);
  }

  incrementCompteur() {
    _compteur++;
    sink.add(_compteur);
  }
}
