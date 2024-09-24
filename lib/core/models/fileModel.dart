class FileModel {
   String title;
   String author;
   String description;
   String fileType;
   String fileUrl;
   bool isFavorite;

  FileModel({
    required this.title,
    required this.author,
    required this.description,
    required this.fileType,
    required this.fileUrl,
    this.isFavorite = false,
  });
}
