### Kompleksitas:
1. **Kompleksitas Waktu**: <br>
Pada kode ini dilakukan iterasi melalui `string sample` dalam fungsi `isBracketBalanced`. 
Iterasi ini memerlukan waktu sebanyak length/jumlah karakter dari `string sample` yang diberikan, yang akan dilambangkan sebagai `O(n)`,
di mana `n` adalah jumlah karakter dari `string sample`. Selain itu, operasi-operasi pada `stack` seperti `push`, `pop`, dan `peek`
memiliki kompleksitas waktu konstan `O(1)`. Oleh karena itu, kompleksitas waktu total dari kode ini adalah `O(n)`.

2. **Kompleksitas Ruang:** <br>
Pada Kode ini menggunakan stack untuk menyimpan karakter-karakter pembuka `starting.` 
Namun, jumlah elemen dalam stack tidak akan melebihi panjang maksimum dari `starting` atau `ending`, yang dalam kasus ini adalah `3`.
Angka `3` yang disebutkan berasal dari asumsi bahwa setiap tanda kurung pembuka (seperti '(', '{', atau '[') akan memiliki tanda kurung penutup yang sesuai (')', '}', atau ']').
<br><br>Dengan demikian, ruang yang diperlukan untuk `stack` adalah `konstan` atau `O(1)`. Implementasi stack menggunakan `list _list` 
yang juga membutuhkan ruang tambahan proporsional dengan jumlah elemen dalam stack pada titik tertentu. Oleh karena itu, 
kompleksitas ruang untuk stack adalah `O(k)`, di mana `k` adalah jumlah elemen dalam stack pada saat terbesar. 
Total ruang yang dibutuhkan oleh program adalah `O(1 + k)`.

### Kesimpulan:
Dengan kompleksitas waktu `O(n)` dan kompleksitas ruang `O(1 + k)`, di mana n adalah panjang `string input` dan `k` adalah jumlah
elemen maksimum dalam `stack`, kode ini dapat dianggap memiliki kompleksitas yang **baik**. Kompleksitas waktu linier menunjukkan
bahwa kinerja kode ini dapat disebut efisien dalam menangani masukan dengan ukuran yang berbeda dan kompleksitas ruang konstan menunjukkan
bahwa penggunaan memori tambahan tidak meningkat secara signifikan seiring dengan pertumbuhan ukuran input.
