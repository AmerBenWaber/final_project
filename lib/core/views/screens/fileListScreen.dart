import 'package:final_project/core/models/fileModel.dart';
import 'package:final_project/core/view_models/fileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FileListScreen extends StatelessWidget {
  const FileListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fileViewModel = Provider.of<FileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _pickAndUploadFile(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                fileViewModel.searchFiles(query);
              },
              decoration: const InputDecoration(
                labelText: 'Search Files',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: fileViewModel.filteredFiles.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final file = fileViewModel.filteredFiles[index];
                return _buildFileItem(context, file, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem(BuildContext context, FileModel file, int index) {
    final fileViewModel = Provider.of<FileViewModel>(context, listen: false);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Icon(
                _getFileIcon(file.fileType),
                size: 60,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              file.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              file.author,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      file.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: file.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      fileViewModel.toggleFavorite(index);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      fileViewModel.shareFile(file);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      fileViewModel.downloadFile(file);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndUploadFile(BuildContext context) async {
    final fileViewModel = Provider.of<FileViewModel>(context, listen: false);
    FileModel? pickedFile = await fileViewModel.pickFile();

    if (pickedFile != null) {
      _showUploadDialog(context, pickedFile);
    }
  }

  void _showUploadDialog(BuildContext context, FileModel pickedFile) {
    TextEditingController authorController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload File'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('File: ${pickedFile.title}'),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Author'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                pickedFile = FileModel(
                  title: pickedFile.title,
                  author: authorController.text.isNotEmpty
                      ? authorController.text
                      : "Unknown",
                  description: descriptionController.text.isNotEmpty
                      ? descriptionController.text
                      : "No description",
                  fileType: pickedFile.fileType,
                  fileUrl: pickedFile.fileUrl,
                );

                Provider.of<FileViewModel>(context, listen: false)
                    .addFile(pickedFile);
                Navigator.of(context).pop();
              },
              child: const Text('Upload'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  IconData _getFileIcon(String fileType) {
    switch (fileType) {
      case 'book':
        return Icons.book;
      case 'video':
        return Icons.video_library;
      case 'audio':
        return Icons.audiotrack;
      default:
        return Icons.insert_drive_file;
    }
  }
}
