import 'package:flutter/material.dart';
import 'package:responsi2024_5210411110/screens/account_screen.dart';
import 'package:responsi2024_5210411110/screens/home_screen.dart';
import 'package:responsi2024_5210411110/screens/login_screen.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
          child: Column(
            children: [
              // Profil Container
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  color: Color(0xFFECE6F0), // Warna background profil
                  borderRadius: BorderRadius.circular(16), // Sudut melengkung
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Profile.png'), // Ganti dengan path gambar profil
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Nama Lengkap', // Ganti dengan nama pengguna
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Asal Universitas', // Ganti dengan asal universitas pengguna
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Form Input untuk Mengubah Akun
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    _buildInputField(
                      label: 'Email',
                      hintText: 'Masukkan email Anda',
                      obscureText: false,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Nama',
                      hintText: 'Masukkan nama lengkap Anda',
                      obscureText: false,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'No. Telepon',
                      hintText: 'Masukkan nomor telepon Anda',
                      obscureText: false,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Password',
                      hintText: 'Masukkan password baru',
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Ubah Profil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Atur radius sesuai kebutuhan
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Logout',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (index == 2) {
            // TODO: Implement logout
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          }
        },
      ),
    );
  }

  // Widget untuk input field
  Widget _buildInputField({
    required String label,
    required String hintText,
    required bool obscureText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
        ),
      ],
    );
  }
}
