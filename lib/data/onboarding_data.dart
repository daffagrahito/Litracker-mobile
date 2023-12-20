// ignore_for_file: camel_case_types

class kontenOnboarding {
  String title;
  String bg;
  String desc;
  kontenOnboarding({
    required this.title,
    required this.bg,
    required this.desc,
  });
}

List<kontenOnboarding> listKonten = [
  kontenOnboarding(
      title: "Jelajahi Buku",
      bg: 'assets/images/onboarding-1.png',
      desc: "Kamu bisa mencari berbagai buku dari berbagai genre"),
  kontenOnboarding(
      title: "Tambah ke Favorit",
      bg: 'assets/images/onboarding-2.png',
      desc: "Simpan buku untuk baca kapan saja"),
  kontenOnboarding(
      title: "Tandai Halaman",
      bg: 'assets/images/onboarding-3.png',
      desc: "Baca lagi pada halaman yang kamu tandai"),
];
