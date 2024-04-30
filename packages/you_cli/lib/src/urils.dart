
Paths paths=Paths();
class Paths{
  String pathPartToVar(String pathPart){
    return pathPart
    // ignore: unnecessary_string_escapes
        .replaceAll(RegExp("^\\d+\."), "") // 1.z.about -> note_note-self
        .replaceAll(".", "_")
        .replaceAll("-", "_")
        .replaceAll("&", "_")
        .replaceAll("*", "_")
        .replaceAll("*", "_")
        .replaceAll("@", "_");
  }
}