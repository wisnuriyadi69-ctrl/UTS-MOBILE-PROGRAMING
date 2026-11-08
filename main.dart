import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const RestoranApp());
}

class ItemMenu {
  final int id;
  final String nama;
  final String deskripsi;
  final int harga;
  final String kategori;
  final IconData ikon;
  final MaterialColor warna;

  const ItemMenu({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.kategori,
    required this.ikon,
    required this.warna,
  });
}

final List<String> kategoriMenu = [
  'Main Course',
  'Appetizer',
  'Dessert',
  'Beverage',
  'Paket Spesial',
];

final Map<String, IconData> ikonKategori = {
  'Main Course': Icons.dinner_dining,
  'Appetizer': Icons.tapas,
  'Dessert': Icons.icecream,
  'Beverage': Icons.local_cafe,
  'Paket Spesial': Icons.card_giftcard,
};

final List<ItemMenu> daftarMenu = [
  ItemMenu(id: 1, nama: 'Nasi Goreng Spesial', deskripsi: 'Nasi goreng dengan telur, ayam suwir, dan acar.', harga: 35000, kategori: 'Main Course', ikon: Icons.rice_bowl, warna: Colors.orange),
  ItemMenu(id: 2, nama: 'Ayam Bakar Madu', deskripsi: 'Ayam bakar bumbu madu dengan lalapan dan sambal.', harga: 42000, kategori: 'Main Course', ikon: Icons.dinner_dining, warna: Colors.deepOrange),
  ItemMenu(id: 3, nama: 'Rendang Daging', deskripsi: 'Daging sapi empuk dimasak dengan bumbu rendang khas.', harga: 55000, kategori: 'Main Course', ikon: Icons.lunch_dining, warna: Colors.brown),
  ItemMenu(id: 4, nama: 'Sate Ayam (10 tusuk)', deskripsi: 'Sate ayam bumbu kacang dengan lontong.', harga: 38000, kategori: 'Main Course', ikon: Icons.kebab_dining, warna: Colors.red),
  ItemMenu(id: 5, nama: 'Gurame Asam Manis', deskripsi: 'Ikan gurame goreng dengan saus asam manis.', harga: 65000, kategori: 'Main Course', ikon: Icons.set_meal, warna: Colors.blue),
  ItemMenu(id: 6, nama: 'Lumpia Semarang', deskripsi: 'Lumpia isi rebung dan ayam, disajikan dengan saus.', harga: 22000, kategori: 'Appetizer', ikon: Icons.tapas, warna: Colors.amber),
  ItemMenu(id: 7, nama: 'Tahu Crispy', deskripsi: 'Tahu goreng renyah dengan sambal kecap.', harga: 18000, kategori: 'Appetizer', ikon: Icons.egg_alt, warna: Colors.orange),
  ItemMenu(id: 8, nama: 'Sop Jagung', deskripsi: 'Sop hangat jagung manis dengan telur.', harga: 20000, kategori: 'Appetizer', ikon: Icons.soup_kitchen, warna: Colors.green),
  ItemMenu(id: 9, nama: 'Es Teler', deskripsi: 'Alpukat, kelapa muda, dan nangka dengan susu.', harga: 20000, kategori: 'Dessert', ikon: Icons.icecream, warna: Colors.pink),
  ItemMenu(id: 10, nama: 'Pudding Coklat', deskripsi: 'Pudding coklat lembut dengan vla vanila.', harga: 18000, kategori: 'Dessert', ikon: Icons.cake, warna: Colors.brown),
  ItemMenu(id: 11, nama: 'Pisang Goreng Keju', deskripsi: 'Pisang goreng krispi dengan topping keju dan coklat.', harga: 17000, kategori: 'Dessert', ikon: Icons.bakery_dining, warna: Colors.amber),
  ItemMenu(id: 12, nama: 'Es Teh Manis', deskripsi: 'Teh segar dengan es batu.', harga: 8000, kategori: 'Beverage', ikon: Icons.local_drink, warna: Colors.teal),
  ItemMenu(id: 13, nama: 'Jeruk Peras', deskripsi: 'Jeruk segar diperas langsung.', harga: 12000, kategori: 'Beverage', ikon: Icons.local_bar, warna: Colors.orange),
  ItemMenu(id: 14, nama: 'Kopi Susu Gula Aren', deskripsi: 'Espresso, susu segar, dan gula aren.', harga: 20000, kategori: 'Beverage', ikon: Icons.coffee, warna: Colors.brown),
  ItemMenu(id: 15, nama: 'Wedang Jahe', deskripsi: 'Minuman jahe hangat dengan gula batu.', harga: 10000, kategori: 'Beverage', ikon: Icons.free_breakfast, warna: Colors.deepOrange),
  ItemMenu(id: 16, nama: 'Paket Berdua', deskripsi: '2 Main Course + 2 Beverage + 1 Dessert.', harga: 99000, kategori: 'Paket Spesial', ikon: Icons.favorite, warna: Colors.red),
  ItemMenu(id: 17, nama: 'Paket Keluarga', deskripsi: '4 Main Course + 4 Beverage + 2 Appetizer.', harga: 189000, kategori: 'Paket Spesial', ikon: Icons.groups, warna: Colors.indigo),
];

String formatRupiah(int number) {
  final s = number.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]}.',
      );
  return 'Rp $s';
}

class IkonKotak extends StatelessWidget {
  final IconData ikon;
  final MaterialColor warna;
  final double ukuran;
  final double radius;

  const IkonKotak({
    super.key,
    required this.ikon,
    required this.warna,
    required this.ukuran,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ukuran,
      height: ukuran,
      decoration: BoxDecoration(
        color: warna.shade50,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: warna.shade100),
      ),
      alignment: Alignment.center,
      child: Icon(ikon, size: ukuran * 0.55, color: warna.shade400),
    );
  }
}

class RestoranApp extends StatelessWidget {
  const RestoranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasa Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F7F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String namaResto = 'Cita Nusantara Resto';
  static const String alamat =
      'Jl. Pemuda No. 123, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah';
  static const String telepon = '0812-3456-7890';
  static const String whatsapp = '0812-3456-7890';
  static const String email = 'halo@citanusantara.id';
  static const String jamBuka = 'Setiap hari, 10.00 - 22.00 WIB';

  void _salin(BuildContext context, String teks, String label) {
    Clipboard.setData(ClipboardData(text: teks));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$label disalin: $teks')),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepOrange.shade300, Colors.deepOrange.shade700],
        ),
      ),
      child: Stack(
        children: const [
          Positioned(left: 24, top: 20, child: Icon(Icons.ramen_dining, size: 44, color: Colors.white24)),
          Positioned(left: 110, bottom: 50, child: Icon(Icons.icecream, size: 34, color: Colors.white24)),
          Positioned(right: 30, top: 24, child: Icon(Icons.local_cafe, size: 40, color: Colors.white24)),
          Positioned(right: 100, bottom: 56, child: Icon(Icons.kebab_dining, size: 36, color: Colors.white24)),
          Positioned(left: 220, top: 10, child: Icon(Icons.bakery_dining, size: 30, color: Colors.white24)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.restaurant_menu, size: 64, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Cita Nusantara Resto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cita Nusantara Resto')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _banner(),
                Positioned(
                  left: 20,
                  bottom: -45,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3)),
                      ],
                    ),
                    child: ClipOval(
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.deepOrange.shade50,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.restaurant,
                          size: 44,
                          color: Colors.deepOrange.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          namaResto,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.circle, size: 10, color: Colors.green),
                            SizedBox(width: 6),
                            Text('Buka', style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber.shade700, size: 18),
                      const SizedBox(width: 4),
                      const Text('4.8  (320 ulasan)', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Restoran keluarga dengan sajian masakan Nusantara pilihan. '
                    'Nikmati main course, appetizer, dessert, dan minuman segar '
                    'dengan cita rasa autentik dan suasana yang nyaman.',
                    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(namaResto: namaResto),
                          ),
                        );
                      },
                      icon: const Icon(Icons.restaurant_menu),
                      label: const Text(
                        'Lihat Menu & Pesan',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),


                  const _JudulSeksi(icon: Icons.contact_phone, judul: 'Kontak'),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.phone, color: Colors.blue),
                          title: const Text('Telepon'),
                          subtitle: const Text(telepon),
                          trailing: const Icon(Icons.copy, size: 18),
                          onTap: () => _salin(context, telepon, 'Nomor telepon'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.chat, color: Colors.green),
                          title: const Text('WhatsApp'),
                          subtitle: const Text(whatsapp),
                          trailing: const Icon(Icons.copy, size: 18),
                          onTap: () => _salin(context, whatsapp, 'Nomor WhatsApp'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.email, color: Colors.red),
                          title: const Text('Email'),
                          subtitle: const Text(email),
                          trailing: const Icon(Icons.copy, size: 18),
                          onTap: () => _salin(context, email, 'Email'),
                        ),
                        const Divider(height: 1),
                        const ListTile(
                          leading: Icon(Icons.access_time, color: Colors.orange),
                          title: Text('Jam Operasional'),
                          subtitle: Text(jamBuka),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  const _JudulSeksi(icon: Icons.location_on, judul: 'Lokasi'),
                  const SizedBox(height: 8),
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          color: Colors.blue.shade50,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, size: 48, color: Colors.red.shade400),
                              const SizedBox(height: 4),
                              const Text('Peta Lokasi', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                namaResto,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 6),
                              const Text(alamat, style: TextStyle(height: 1.4)),
                              const SizedBox(height: 12),
                              OutlinedButton.icon(
                                onPressed: () => _salin(context, alamat, 'Alamat'),
                                icon: const Icon(Icons.copy),
                                label: const Text('Salin Alamat'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JudulSeksi extends StatelessWidget {
  final IconData icon;
  final String judul;

  const _JudulSeksi({required this.icon, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepOrange),
        const SizedBox(width: 8),
        Text(judul, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class MenuPage extends StatefulWidget {
  final String namaResto;

  const MenuPage({super.key, required this.namaResto});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final Map<int, int> keranjang = {};

  int get totalItem => keranjang.values.fold(0, (a, b) => a + b);

  int get totalHarga {
    int total = 0;
    keranjang.forEach((id, qty) {
      final item = daftarMenu.firstWhere((m) => m.id == id);
      total += item.harga * qty;
    });
    return total;
  }

  void _tambah(int id) {
    setState(() => keranjang[id] = (keranjang[id] ?? 0) + 1);
  }

  void _kurang(int id) {
    setState(() {
      final qty = (keranjang[id] ?? 0) - 1;
      if (qty <= 0) {
        keranjang.remove(id);
      } else {
        keranjang[id] = qty;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kategoriMenu.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.namaResto),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: kategoriMenu
                .map((k) => Tab(icon: Icon(ikonKategori[k]), text: k))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: kategoriMenu.map((kategori) {
            final items = daftarMenu.where((m) => m.kategori == kategori).toList();
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
                    child: Text(
                      kategori.toUpperCase(),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                final item = items[index - 1];
                return _KartuMenu(
                  item: item,
                  qty: keranjang[item.id] ?? 0,
                  onTambah: () => _tambah(item.id),
                  onKurang: () => _kurang(item.id),
                );
              },
            );
          }).toList(),
        ),
        bottomNavigationBar: totalItem == 0
            ? null
            : SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -4)),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KeranjangPage(
                            keranjang: keranjang,
                            onChanged: () => setState(() {}),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.shopping_cart),
                        const SizedBox(width: 10),
                        Text(
                          '$totalItem item',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Text(
                          formatRupiah(totalHarga),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class _KartuMenu extends StatelessWidget {
  final ItemMenu item;
  final int qty;
  final VoidCallback onTambah;
  final VoidCallback onKurang;

  const _KartuMenu({
    required this.item,
    required this.qty,
    required this.onTambah,
    required this.onKurang,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nama,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatRupiah(item.harga),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  qty == 0
                      ? OutlinedButton.icon(
                          onPressed: onTambah,
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text('Tambah'),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton.filledTonal(
                              onPressed: onKurang,
                              icon: const Icon(Icons.remove),
                              visualDensity: VisualDensity.compact,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                '$qty',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton.filled(
                              onPressed: onTambah,
                              icon: const Icon(Icons.add),
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            IkonKotak(ikon: item.ikon, warna: item.warna, ukuran: 100),
          ],
        ),
      ),
    );
  }
}

class KeranjangPage extends StatefulWidget {
  final Map<int, int> keranjang;
  final VoidCallback onChanged;

  const KeranjangPage({
    super.key,
    required this.keranjang,
    required this.onChanged,
  });

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final TextEditingController _catatanCtrl = TextEditingController();
  final TextEditingController _mejaCtrl = TextEditingController();

  @override
  void dispose() {
    _catatanCtrl.dispose();
    _mejaCtrl.dispose();
    super.dispose();
  }

  int get subtotal {
    int total = 0;
    widget.keranjang.forEach((id, qty) {
      total += daftarMenu.firstWhere((m) => m.id == id).harga * qty;
    });
    return total;
  }

  int get pajak => (subtotal * 0.1).round();
  int get total => subtotal + pajak;

  void _ubah(int id, int delta) {
    setState(() {
      final qty = (widget.keranjang[id] ?? 0) + delta;
      if (qty <= 0) {
        widget.keranjang.remove(id);
      } else {
        widget.keranjang[id] = qty;
      }
    });
    widget.onChanged();
  }

  Future<void> _pesan() async {
    final meja = _mejaCtrl.text.trim();
    if (meja.isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi nomor meja terlebih dahulu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final totalBayar = total;
    widget.keranjang.clear();
    widget.onChanged();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 56),
        title: const Text('Pesanan Diterima'),
        content: Text(
          'Pesanan untuk meja $meja sedang disiapkan.\n'
          'Total pembayaran: ${formatRupiah(totalBayar)}',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    Navigator.pop(context); // kembali ke halaman menu
  }

  @override
  Widget build(BuildContext context) {
    final ids = widget.keranjang.keys.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Pesanan Anda')),
      body: ids.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text('Keranjang kosong', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kembali ke Menu'),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...ids.map((id) {
                  final item = daftarMenu.firstWhere((m) => m.id == id);
                  final qty = widget.keranjang[id] ?? 0;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: IkonKotak(
                        ikon: item.ikon,
                        warna: item.warna,
                        ukuran: 56,
                        radius: 8,
                      ),
                      title: Text(
                        item.nama,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(formatRupiah(item.harga * qty)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => _ubah(id, -1),
                          ),
                          Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () => _ubah(id, 1),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 8),
                TextField(
                  controller: _mejaCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Nomor Meja',
                    prefixIcon: Icon(Icons.table_restaurant),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _catatanCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Catatan (opsional)',
                    prefixIcon: Icon(Icons.edit_note),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _barisHarga('Subtotal', formatRupiah(subtotal)),
                _barisHarga('Pajak (10%)', formatRupiah(pajak)),
                const Divider(),
                _barisHarga('Total', formatRupiah(total), tebal: true),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Tambah Menu'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _pesan,
                        icon: const Icon(Icons.check),
                        label: const Text('Pesan Sekarang'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _barisHarga(String label, String nilai, {bool tebal = false}) {
    final style = TextStyle(
      fontSize: tebal ? 18 : 14,
      fontWeight: tebal ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(nilai, style: style)],
      ),
    );
  }
}