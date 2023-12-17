import 'package:flutter/material.dart';
import 'package:litracker_mobile/reading_history/utils/reading_history_utils.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Bacaan",
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  "Halaman Tersimpan",
                  style: TextStyle(
                    color: Color.fromRGBO(88, 107, 132, 1),
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(80, 166, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: const Text(
                          "60",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SF-Pro',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        child: const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Buku",
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 4, 22, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Nama Penulis",
                                style: TextStyle(
                                  color: Color.fromRGBO(132, 151, 172, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              bool? result = await showDialog<bool?>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Atur Nomor Halaman',
                                      style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -1,
                                        fontSize: 24,
                                        color: Color.fromRGBO(8, 4, 22, 1),
                                      ),
                                    ),
                                    content: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: const Color.fromRGBO(
                                                  246, 247, 249, 1),
                                            ),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelText: 'Nomor Halaman',
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'SF-Pro',
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: -0.8,
                                                  color: Color.fromRGBO(
                                                      51, 59, 68, 1),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color.fromRGBO(
                                                        208,
                                                        201,
                                                        255,
                                                        1), // Change to your desired blue color
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 12),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              const Color.fromRGBO(8, 4, 22, 1),
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 20,
                                          ),
                                        ),
                                        child: const Text(
                                          'Kembali',
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color.fromRGBO(8, 4, 22, 1),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              72, 22, 236, 1),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 24,
                                            vertical: 20,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                          showSuccessNotification(context);
                                        },
                                        child: const Text(
                                          'Simpan',
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (result != null && result) {
                                // Save logic
                              }
                            },
                            child: Image.asset(
                              "assets/history/settings.png",
                              width: 32,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () async {
                              bool? result = await showConfirmationDialog(
                                context,
                                "Apakah Anda yakin ingin menghapus?",
                              );

                              if (result != null && result) {
                                showSuccessNotification(context);
                              }
                            },
                            child: Image.asset(
                              "assets/history/delete.png",
                              width: 32,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: HistoryContent(),
      ),
    ),
  );
}
