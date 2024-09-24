import 'dart:io';
import 'package:final_project/core/models/fileModel.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class FileViewModel extends ChangeNotifier {
  List<FileModel> _files = [];
  List<FileModel> filteredFiles = [];
  List<FileModel> get files => _files;

  FileViewModel() {
    filteredFiles = files;
  }

  void addFile(FileModel file) {
    _files.add(file);
    notifyListeners();
  }

  void removeFile(int index) {
    _files.removeAt(index);
    notifyListeners();
  }

  void updateFile(int index, FileModel updatedFile) {
    _files[index] = updatedFile;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _files[index].isFavorite = !_files[index].isFavorite;
    notifyListeners();
  }

  Future<void> shareFile(FileModel file) async {
    Share.share('Check out this file: ${file.title} by ${file.author}.\n${file.fileUrl}');
  }

  Future<void> downloadFile(FileModel file) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${file.title}';
    print('Downloaded file to $path');
  }

  Future<FileModel?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;
      String fileType = _getFileType(result.files.single.extension!);
      return FileModel(
        title: fileName,
        author: "Unknown",
        description: "No description",
        fileType: fileType,
        fileUrl: file.path,
      );
    }
    return null;
  }

  String _getFileType(String extension) {
    if (['pdf', 'epub', 'doc', 'ppt', 'XLS ', 'xls', 'EPUB', 'MOBI', 'mobi'].contains(extension)) {
      return 'book';
    } else if (['mp4', 'avi','mkv', 'MPEG', '3GP', 'WEBM', 'FLV', 'WMV', 'MOV', 'MP4', 'AVI','MKV'].contains(extension)) {
      return 'video';
    } else if (['mp3', 'wav', 'AMR', 'amr', 'M4A', 'm4a', 'AIFF', 'aiff', 'OGG', 'ogg', 'FLAC', 'flac', 'AAC', 'aac','WAV', 'MP3'].contains(extension)) {
      return 'audio';
    }
    return 'unknown';
  }

  void searchFiles(String query) {
    if (query.isEmpty) {
      filteredFiles = files;
    } else {
      filteredFiles = files
          .where((file) =>
      file.title.toLowerCase().contains(query.toLowerCase()) ||
          file.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

}
