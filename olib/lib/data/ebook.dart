class Ebook {
  String cover;
  String filePdf;
  String author;
  String isbn;

  Ebook(
      {required this.cover,
      required this.filePdf,
      required this.author,
      required this.isbn});
}

void main() {
  Ebook ebook1 = Ebook(
    cover: 'bintang.jpg',
    filePdf: 'ebook1.pdf',
    author: 'Author 1',
    isbn: '978-1234567891',
  );

  Ebook ebook2 = Ebook(
    cover: 'bumi.jpg',
    filePdf: 'ebook2.pdf',
    author: 'Author 2',
    isbn: '978-1234567892',
  );

  Ebook ebook3 = Ebook(
    cover: 'matahari.jpg',
    filePdf: 'ebook3.pdf',
    author: 'Author 3',
    isbn: '978-1234567893',
  );

  Ebook ebook4 = Ebook(
    cover: 'selena.jpg',
    filePdf: 'ebook4.pdf',
    author: 'Author 4',
    isbn: '978-1234567894',
  );

  print('Ebook Information:');
  print('Ebook 1:');
  print('Cover: ${ebook1.cover}');
  print('PDF File: ${ebook1.filePdf}');
  print('Author: ${ebook1.author}');
  print('ISBN: ${ebook1.isbn}');

  print('Ebook 2:');
  print('Cover: ${ebook2.cover}');
  print('PDF File: ${ebook2.filePdf}');
  print('Author: ${ebook2.author}');
  print('ISBN: ${ebook2.isbn}');

  print('Ebook 3:');
  print('Cover: ${ebook3.cover}');
  print('PDF File: ${ebook3.filePdf}');
  print('Author: ${ebook3.author}');
  print('ISBN: ${ebook3.isbn}');

  print('Ebook 4:');
  print('Cover: ${ebook4.cover}');
  print('PDF File: ${ebook4.filePdf}');
  print('Author: ${ebook4.author}');
  print('ISBN: ${ebook4.isbn}');
}
