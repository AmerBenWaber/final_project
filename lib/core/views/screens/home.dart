import 'package:flutter/material.dart';

void main() {
  runApp(ElectronicLibraryApp());
}

class ElectronicLibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مكتبة دينية إلكترونية',
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
            padding: WidgetStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // عدد التبويبات
      child: Scaffold(
        appBar: AppBar(
          title: Text('مكتبة دينية إلكترونية'),
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade300,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "الإيمان"),
              Tab(text: "الحديث"),
              Tab(text: "الفقه"),
              Tab(text: "السيرة"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SectionGridPage(data: _getSectionData('الإيمان')),
            SectionGridPage(data: _getSectionData('الحديث')),
            SectionGridPage(data: _getSectionData('الفقه')),
            SectionGridPage(data: _getSectionData('السيرة النبوية')),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getSectionData(String sectionTitle) {
    return List.generate(4, (index) {
      return {
        'title': '$sectionTitle $index',
        'description': 'هذا هو الوصف الخاص بـ $sectionTitle $index',
        'icon': Icons.book, // استخدم رمز مختلف لكل قسم إذا رغبت
      };
    });
  }
}

class SectionGridPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final List<Map<String, dynamic>> items = [
    {'title': 'الكتب', 'icon': Icons.book},
    {'title': 'الفيديوهات', 'icon': Icons.videocam},
    {'title': 'الصوتيات', 'icon': Icons.audiotrack},
    {'title': 'مقالات', 'icon': Icons.article},
  ];

  SectionGridPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // عدد العناصر في كل صف
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
         // childAspectRatio: 3 / 4,
        ),
        itemCount: 1,
        //data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContainerDetailsPage(
                    data: data[index],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عرض الأيقونات هنا
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: items.map((item) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item['icon'], color: Colors.green, size: 40),
                            SizedBox(height: 4),
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data[index]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerDetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;

  ContainerDetailsPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title']),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                data['description'],
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // تنفيذ الإجراء بناءً على نوع المحتوى (صوت، فيديو، كتاب)
                  // يمكنك إضافة الشيفرة هنا للتنقل إلى صفحة تشغيل المحتوى
                },
                child: Text('فتح المحتوى'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
