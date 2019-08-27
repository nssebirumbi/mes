import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter/services.dart';



import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

class Semester extends StatefulWidget {
  _SemesterState createState() => _SemesterState();
}

class _SemesterState extends State<Semester>  {
  String assetPDFPath = "";
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset("PDFs/Example.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });

    getFileFromUrl("http://www.pdf995.com/samples/pdf.pdf").then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

 
  @override
  Widget build(BuildContext context) {
    List content;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xff3f51b5),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4.0,
              tabs: [
                Tab(
                  child: Text("Handouts"),
                ),
                Tab(
                  child: Text("Past Papers"),
                ),
                Tab(
                  child: Text("Text Books"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              new Card(
                  child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index)=>Divider(),
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text("Example.pdf"),
                      //isThreeLine: true,
                      leading: CircleAvatar(
                        child: Icon(Icons.picture_as_pdf),
                      ),
                      onTap: () {
                        if (assetPDFPath != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                PdfViewPage(path: assetPDFPath)));
                        }
                      },
                    );
                  },
                ),
                //color: Colors.white,
              ),
              new Card(
                  child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index)=>Divider(),
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text("Example.pdf"),
                      //isThreeLine: true,
                      leading: CircleAvatar(
                        child: Icon(Icons.picture_as_pdf),
                      ),
                      onTap: () {
                        if (assetPDFPath != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                PdfViewPage(path: assetPDFPath)));
                        }
                      },
                    );
                  },
                ),
                //color: Colors.white,
              ),
              new Card(
                  child: ListView.separated(
                  itemCount: 1,
                  separatorBuilder: (context, index)=>Divider(),
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text("Example.pdf"),
                      //isThreeLine: true,
                      leading: CircleAvatar(
                        child: Icon(Icons.picture_as_pdf),
                      ),
                      onTap: () {
                        if (assetPDFPath != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                PdfViewPage(path: assetPDFPath)));
                        }
                      },
                    );
                  },
                ),
                //color: Colors.white,
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  
}



class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage+1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}
