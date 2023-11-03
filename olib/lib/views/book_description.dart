import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(BookDescriptionApp());
}

class BookDescriptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define routes for navigation
      routes: {
        "/book": (context) => BookDescriptionScreen(),
      },
      initialRoute: "/book", // Set the initial route
    );
  }
}

class BookDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEEF0F1),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 10),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xFFEEF0F1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  'assets/images/bumi.jpg',
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Bumi",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff14161b),
                          height: 32 / 32,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Tere Liye",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff14161b),
                          height: 32 / 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Gramedia",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff14161b),
                          height: 32 / 20,
                        ),
                        //textAlign: TextAlign center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "ISBN : 123689",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff14161b),
                          height: 32 / 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Book Description",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff14161b),
                          height: 32 / 32,
                        ),
                        //textAlign: TextAlign center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        width: 100,
                        height: 2,
                        color: Color(0xff14161b),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Bumi, merupakan rangkaian awal dari kisah sekelompok anak remaja berkemampuan istimewa. Mereka yang istimewa, mampu pergi ke dunia parallel bumi, bertemu dengan klan lain dan berhadapan dengan Tamus yang memiliki ambisi membebaskan si Tanpa Mahkota dan kemudian, menguasai bumi.",
                        style: const TextStyle(
                          fontFamily: "Roboto Serif",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff14161b),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the PDF viewer widget when the "Read" button is clicked
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PDFViewerWidget(
                            pdfPath: 'assets/books/matahari.pdf',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 138,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(7, 104, 159, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Read",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 138,
                    height: 50,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(7, 104, 159, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Borrow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PDFViewerWidget extends StatelessWidget {
  final String pdfPath;
  final PdfViewerController pdfViewerController =
      PdfViewerController(); // Tambahkan PdfViewerController di sini

  PDFViewerWidget({
    required this.pdfPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.asset(
        pdfPath,
        controller: pdfViewerController, // Tambahkan controller ke SfPdfViewer
        pageSpacing: 4.0,
        pageLayoutMode: PdfPageLayoutMode.single,
        canShowPaginationDialog: true,
      ),
    );
  }
}
