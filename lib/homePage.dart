import 'package:flutter/material.dart';
import 'package:p5_navigasi/detailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> makanan = [
      {
        'nama': 'Burger Special',
        'harga': 35000,
        'deskripsi': 'Burger lezat dengan daging sapi dan keju',
        'gambar': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
      },
      {
        'nama': 'Pizza Cheese',
        'harga': 65000,
        'deskripsi': 'Pizza hangat dengan topping keju melimpah',
        'gambar': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500',
      },
      {
        'nama': 'Chicken Steak',
        'harga': 45000,
        'deskripsi': 'Ayam panggang dengan saus spesial',
        'gambar': 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=500',
      },
      {
        'nama': 'Spaghetti',
        'harga': 30000,
        'deskripsi': 'Spaghetti lezat dengan saus bolognese',
        'gambar': 'https://images.unsplash.com/photo- pasta',
      },
      {
        'nama': 'French Fries',
        'harga': 18000,
        'deskripsi': 'Kentang goreng renyah dan gurih',
        'gambar': 'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=500',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        title: const Text(
          'Food Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.restaurant_menu),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Temukan makanan favoritmu hari ini 🍔',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Daftar Menu Makanan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: makanan.length,

                itemBuilder: (context, index) {
                  final p = makanan[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 15),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),

                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          p['gambar'],
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 85,
                              height: 85,
                              color: Colors.orange.shade100,
                              child: const Icon(
                                Icons.fastfood,
                                color: Colors.deepOrange,
                                size: 35,
                              ),
                            );
                          },
                        ),
                      ),

                      title: Text(
                        p['nama'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),

                          Text(
                            p['deskripsi'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 7),

                          Text(
                            formatRupiah(p['harga']),
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.deepOrange,
                        size: 18,
                      ),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              nama: p['nama'],
                              harga: formatRupiah(p['harga']),
                              deskripsi: p['deskripsi'],
                              gambar: p['gambar'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
