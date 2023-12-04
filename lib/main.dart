import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'Book List',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black,fontSize: 28, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent[200],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BookCard(
            'প্যারাডক্সিক্যাল সাজিদ ',
            'আরিফ আজাদ',
            '4.9',
            'https://media.e-valy.com/cms/products/images/078431dc-0dee-47fb-874f-57d2c2c31d4a',
          ),
          BookCard(
            'প্যারাডক্সিক্যাল সাজিদ ২',
            'আরিফ আজাদ',
            '4.5',
            'https://static-01.daraz.com.bd/p/d8f98d980ed9de93bf672b68b830d60e.jpg_750x750.jpg_.webp',
          ),
          BookCard(
            'রিভাইভ ইয়োর হার্ট',
            'নোমান আলী খান',
            '4.6',
            'https://cdn.shopify.com/s/files/1/0027/3776/6509/files/66828855_476547372906089_7058261191121207627_n_large.jpg?v=1575471584',
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;

  const BookCard(this.bookName, this.authorName, this.rating, this.img);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.network(
              img,
              width: 120,
              height: 160,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(bookName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(authorName),
                          Text('Rating: $rating'),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyNowPage(
                              bookName: bookName,
                              imageUrl: img,
                              author: authorName,
                              description: 'Islamic ideals and doctrines novel',
                              price: 9.89,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Buy Now'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String imageUrl;
  final String author;
  final String description;
  final double price;

  const BuyNowPage({
    required this.bookName,
    required this.imageUrl,
    required this.author,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            Text('Book Name: $bookName'),
            const SizedBox(height: 8.0),
            Text('Author: $author'),
            const SizedBox(height: 8.0),
            Text('Description: $description'),
            const SizedBox(height: 8.0),
            Text('Price: \$$price'),
            const SizedBox(height: 16.0),


            DropdownButton<String>(
              items: const [
                DropdownMenuItem(
                  child: Text('Payment Method'),
                  value: 'Payment Method',
                ),
                DropdownMenuItem(
                  child: Text('Nagad'),
                  value: 'Nagad',
                ),
                DropdownMenuItem(
                  child: Text('Bkash'),
                  value: 'Bkash',
                ),
                DropdownMenuItem(
                  child: Text('Rocket'),
                  value: 'Rocket',
                ),
                DropdownMenuItem(
                  child: Text('Cash On Delivery'),
                  value: 'Cash On Delivery',
                ),
              ],
              onChanged: (String? value) {

              },
              value: 'Payment Method',
            ),

            const Spacer(),


            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
