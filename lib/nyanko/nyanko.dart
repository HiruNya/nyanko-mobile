import 'dart:ffi';
import 'package:ffi/ffi.dart';
import './search.dart';

typedef init_raw = Pointer<Void> Function();
typedef free_init_raw = Void Function(Pointer<Void>);
typedef freeInitRaw = void Function(Pointer<Void>);
typedef search_raw = Pointer<SearchEntries> Function(Pointer<Void>, Pointer<Utf8>);
typedef searchRaw = Pointer<SearchEntries> Function(Pointer<Void>, Pointer<Utf8>);
typedef free_search_raw = Void Function(Pointer<SearchEntries>);
typedef freeSearchRaw = void Function(Pointer<SearchEntries>);

class Nyanko {
  Pointer<Void> initPointer;
  freeInitRaw freeInitFunction;
  searchRaw searchFunction;
  freeSearchRaw freeSearchFunction;

  Nyanko() {
    final library = DynamicLibrary.open("libnyanko_c.so");
    final init_raw initFunction = library.lookup<NativeFunction<init_raw>>("init").asFunction();
    freeInitFunction = library.lookup<NativeFunction<free_init_raw>>("free_init").asFunction();
    searchFunction = library.lookup<NativeFunction<search_raw>>("search").asFunction();
    freeSearchFunction = library.lookup<NativeFunction<free_search_raw>>("free_search").asFunction();

    initPointer = initFunction();
  }

  void shutdown() {
    freeInitFunction(initPointer);
  }
  
  List<SearchEntry> search(String query) {
    final buffer = Utf8.toUtf8(query);
    final entries = searchFunction(initPointer, buffer);
    final list = entries.ref.asList();
    freeSearchFunction(entries);
    free(buffer);
    return list;
  }
}
