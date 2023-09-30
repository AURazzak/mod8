import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),

    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: isLandscape
            ? _buildLandscapeLayout()
            : _buildPortraitLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0),
        Center(
          child: CircleAvatar(
            radius: 160,
            backgroundImage: NetworkImage(
                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F009%2F273%2F280%2Fnon_2x%2Fconcept-of-loneliness-and-disappointment-in-love-sad-man-sitting-element-of-the-picture-is-decorated-by-nasa-free-photo.jpg&tbnid=wCRKX8OXxT2N0M&vet=12ahUKEwj8kv_x8NKBAxXp5TgGHalnBbEQMygAegQIARBR..i&imgrefurl=https%3A%2F%2Fwww.vecteezy.com%2Ffree-photos%2Fpicture&docid=wska7sM6RxRdCM&w=1470&h=980&q=picture&ved=2ahUKEwj8kv_x8NKBAxXp5TgGHalnBbEQMygAegQIARBR'),
          ),
        ),
        SizedBox(height: 16.0),
        Center(
          child: Text(
            'Naruto Uzumaki',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'This is the profile app task given to me by the Ostad team, and now I am completing it with flutter.',
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        SizedBox(height: 16.0),
        _buildPhotoGrid(3),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: CircleAvatar(
              radius: 160,
              backgroundImage: NetworkImage(
                  'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2F474x%2F0f%2F4a%2Fba%2F0f4aba8348df3a41b51ae07371088190--i-care-moonlight.jpg&tbnid=yihrwjm8dd7siM&vet=12ahUKEwiGrKz38NKBAxVISWwGHUpUDxsQxiAoAXoECAAQGw..i&imgrefurl=https%3A%2F%2Fin.pinterest.com%2Farunhosur58%2Fcaller-image%2F&docid=ExtCQqqR6MESCM&w=474&h=711&itg=1&q=picture&ved=2ahUKEwiGrKz38NKBAxVISWwGHUpUDxsQxiAoAXoECAAQGw'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Naruto Uzumaki',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'This is the profile app task given to me by the Ostad team, and now I am completing it with flutter.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16.0),
              _buildPhotoGrid(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      children: List.generate(6, (index) {
        final imageUrl =
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2F736x%2Fb3%2F02%2Fd1%2Fb302d1ced0244be8eec910b31b5e125f.jpg&tbnid=cT0zbL-BPk3CnM&vet=12ahUKEwiGrKz38NKBAxVISWwGHUpUDxsQxiAoA3oECAAQFw..i&imgrefurl=https%3A%2F%2Fwww.pinterest.co.uk%2Fpin%2Fthats-one-giant-leap-for-mankind-cleverly-posed-photos-show-man-jumping-over-the-moon-holding-it-and-even-slam-dunking-it--193021534002334108%2F&docid=q-FumkYgGdabjM&w=634&h=859&itg=1&q=picture&ved=2ahUKEwiGrKz38NKBAxVISWwGHUpUDxsQxiAoA3oECAAQFw';
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        );
      }),
    );
  }
}