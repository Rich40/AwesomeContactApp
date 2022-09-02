import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:awesome_contact_app/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Rana Joyner",
      "phone": "1-263-608-6126",
      "email": "dolor@outlook.couk",
      "country": "Costa Rica",
      "region": "Ilocos Region"
    },
    {
      "name": "Lee Gonzales",
      "phone": "(216) 569-2877",
      "email": "phasellus.libero@hotmail.com",
      "country": "South Korea",
      "region": "Viken"
    },
    {
      "name": "Ivan Mcfarland",
      "phone": "1-748-175-1104",
      "email": "pellentesque.eget@hotmail.edu",
      "country": "Vietnam",
      "region": "Emilia-Romagna"
    },
    {
      "name": "Connor Freeman",
      "phone": "(385) 126-1643",
      "email": "cubilia@yahoo.net",
      "country": "New Zealand",
      "region": "Manisa"
    },
    {
      "name": "Gillian Kane",
      "phone": "1-695-722-7174",
      "email": "neque.sed@outlook.ca",
      "country": "Ireland",
      "region": "Vestfold og Telemark"
    },
    {
      "name": "Iola Clay",
      "phone": "1-631-433-5921",
      "email": "mauris.sagittis@google.edu",
      "country": "Australia",
      "region": "Central Luzon"
    },
    {
      "name": "Amir Alford",
      "phone": "(521) 628-4137",
      "email": "posuere.cubilia@protonmail.net",
      "country": "Spain",
      "region": "South Jeolla"
    },
    {
      "name": "Arthur Madden",
      "phone": "(847) 417-3383",
      "email": "purus@protonmail.org",
      "country": "Norway",
      "region": "Westmorland"
    },
    {
      "name": "Dara Huber",
      "phone": "1-243-570-5442",
      "email": "arcu.imperdiet@hotmail.com",
      "country": "Ireland",
      "region": "Jönköpings län"
    },
    {
      "name": "Steven Leonard",
      "phone": "1-858-146-7743",
      "email": "lorem.sit@icloud.net",
      "country": "Chile",
      "region": "Maule"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/img.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recents',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'rich@mail.com',
                                name: 'Richard Clottey',
                                phone: '+233 545 450 902',
                                region: 'Accra, Ghana'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/avatar-1.jpg'),
                    ),
                    title: const Text(
                      'Richard Clottey',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 54 54 50 902'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(contact: contact);
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/avatar-1.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    ),
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
