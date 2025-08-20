import 'package:flutter/material.dart';
import 'package:real_estate/constans/image_url.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> houses = List.generate(6, (index) => {
    'image': AppImageAsset.onboarding1,
    'title': 'فيلا',
    'location': 'دمشق/برامكة',
    'rating': 4.9,
    'status': index % 2 == 0 ? 'للبيع' : 'إيجار',
  });

  String selectedFilter = 'الكل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(), // يسحب من اليمين
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 16, right: 16),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(14),
                    child: Icon(Icons.person, color: Colors.blue, size: 28),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحبا !',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'اسم المستخدم',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: Builder(
                builder: (context) => InkWell(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Icon(Icons.menu, color: Colors.blue, size: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مربع البحث
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'بحث',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            // عنوان عروض اليوم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.star, color: Colors.blue, size: 20),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'عروض اليوم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // بطاقات العقارات
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return houseCard(houses[index]);
                },
              ),
            ),

            SizedBox(height: 20),

            // Tabs (الكل، بيع، إيجار)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'الأحدث',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Spacer(),
                  filterButton('الكل'),
                  SizedBox(width: 8),
                  filterButton('بيع'),
                  SizedBox(width: 8),
                  filterButton('إيجار'),
                ],
              ),
            ),

            SizedBox(height: 10),

            // شبكة العقارات
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: houses.length,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                return houseCard(houses[index]);
              },
            ),
          ],
        ),
      ),

      // شريط التنقل السفلي
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
            SizedBox(width: 48),
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
          ],
        ),
      ),

      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // زر الفلاتر (الكل / بيع / إيجار)
  Widget filterButton(String label) {
    bool isSelected = selectedFilter == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  // بطاقة العقار
  Widget houseCard(Map<String, dynamic> data) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  data['image'],
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // حالة العقار (للبيع / إيجار)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    data['status'],
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              // زر المفضلة أعلى اليسار
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      // حدث عند الضغط على المفضلة
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        data['location'],
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    SizedBox(width: 3),
                    Text('${data['rating']}', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
