import 'dart:ffi';
import 'package:ffi/ffi.dart';

class SearchEntries extends Struct {
  Pointer<SearchEntryRaw> ptr;
  @Uint32()
  int len;

  List<SearchEntry> asList() {
    List<SearchEntry> list = List(len);
    for (int i = 0; i < len; i++) {
      final entry = SearchEntry(ptr[i]);
      list[i] = entry;
    }
    return list;
  }
}

class SearchEntry {
  String title;
  String image;

  SearchEntry(SearchEntryRaw raw) {
    title = Utf8.fromUtf8(raw.title);
    image = Utf8.fromUtf8(raw.image);
  }
}

class SearchEntryRaw extends Struct {
  Pointer<Utf8> title;
  Pointer<Utf8> image;
}
