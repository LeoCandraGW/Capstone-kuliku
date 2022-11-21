class ListKuli {
  int id;
  String name;
  String alamat;
  String skill;
  String dailysal;
  String imageAsset;

  ListKuli({
    required this.id,
    required this.name,
    required this.alamat,
    required this.skill,
    required this.dailysal,
    required this.imageAsset,
  });
}

var listKuliku = [
  ListKuli(
      id: 1,
      name: 'Maria',
      alamat: 'Surabaya, Jawa Timur',
      skill: 'Renovate, HomeCare',
      dailysal: 'Rp. 165.000,00',
      imageAsset: 'image/kuliku1.png'),
  ListKuli(
      id: 2,
      name: 'Naruto',
      alamat: 'Bekasi, Jawa Barat',
      skill: 'Interior, Build, Yard',
      dailysal: 'Rp. 155.000,00',
      imageAsset: 'image/kuliku2.png'),
  ListKuli(
      id: 3,
      name: 'Denji',
      alamat: 'Malang, Jawa Timur',
      skill: 'Interior, Room Makeover',
      dailysal: 'Rp. 135.000,00',
      imageAsset: 'image/kuliku3.png'),
  ListKuli(
      id: 4,
      name: 'Emilia',
      alamat: 'Medan, Sumatra Utara',
      skill: 'Interior, HomeCare',
      dailysal: 'Rp. 125.000,00',
      imageAsset: 'image/kuliku4.png'),
  ListKuli(
      id: 5,
      name: 'Hinata',
      alamat: 'Semarang, Jawa Tengah',
      skill: 'Yard, Build',
      dailysal: 'Rp. 145.000,00',
      imageAsset: 'image/kuliku5.png'),
  ListKuli(
      id: 6,
      name: 'Makima',
      alamat: 'Tangerang, Banten',
      skill: 'Renovate, HomeCare',
      dailysal: 'Rp. 165.000,00',
      imageAsset: 'image/kuliku6.png'),
];
