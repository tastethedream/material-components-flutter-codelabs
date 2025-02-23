// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//CODE FOR VERTICAL SCROLLING

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import 'model/products_repository.dart';
// import 'model/product.dart';
//
// class HomePage extends StatelessWidget {
//   // TODO: Make a collection of cards (102)
//   // Replace this entire method
//   List<Card> _buildGridCards(BuildContext context) {
//     List<Product> products = ProductsRepository.loadProducts(Category.all);
//
//     if (products == null || products.isEmpty) {
//       return const <Card>[];
//     }
//
//     final ThemeData theme = Theme.of(context);
//     final NumberFormat formatter = NumberFormat.simpleCurrency(
//         locale: Localizations.localeOf(context).toString());
//
//     return products.map((product) {
//       return Card(
//         clipBehavior: Clip.antiAlias,
//         // TODO: Adjust card heights (103)
//         elevation: 0.0,
//         child: Column(
//           // TODO: Center items on the card (103)
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             AspectRatio(
//               aspectRatio: 18 / 11,
//               child: Image.asset(
//                 product.assetName,
//                 package: product.assetPackage,
//                 // TODO: Adjust the box size (102)
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//                 child: Column(
//                   // TODO: Align labels to the bottom and center (103)
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   // TODO: Change innermost Column (103)
//                   children: <Widget>[
//                     // TODO: Handle overflowing labels (103)
//                     Text(
//                       product == null ? '' : product.name,
//                       style: theme.textTheme.button,
//                       softWrap: false,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                     SizedBox(height: 4.0),
//                     Text(
//                       product == null ? '' : formatter.format(product.price),
//                       style: theme.textTheme.caption,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }
//
//   //function to generate cards
//
//   // TODO: Add a variable for Category (104)
//   @override
//   Widget build(BuildContext context) {
//     // TODO: Return an AsymmetricView (104)

//     // TODO: Pass Category variable to AsymmetricView (104)
//     return Scaffold(
//       // TODO: Add app bar (102)
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             semanticLabel: 'menu',
//           ),
//           onPressed: () {
//             print('Menu Button');
//           },
//         ),
//         title: Text('SHRINE'),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.search,
//               semanticLabel: 'search',
//             ),
//             onPressed: () {
//               print('Search Button');
//             },
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.tune,
//               semanticLabel: 'filter',
//             ),
//             onPressed: () {
//               print('Filter button');
//             },
//           ),
//         ],
//       ),
//       // TODO: Add a grid view (102)
//       body: GridView.count(
//           crossAxisCount: 2,
//           padding: EdgeInsets.all(16.0),
//           childAspectRatio: 8.0 / 9.0,
//           // call function to generate cards and specify how many cards
//           children: _buildGridCards(context)),
//       // TODO: Set resizeToAvoidBottomInset (101)
//       //this ensures that they keyboard's appearance does not alter the size of the home page or its widgets.
//       resizeToAvoidBottomInset: false,
//     );
//   }
// }

//CODE FOR HORIZONTAL SCROLLING
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  final Category category;
  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)

    return AsymmetricView(products: ProductsRepository.loadProducts(category));
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: AsymmetricView(
          products: ProductsRepository.loadProducts(Category.all)),
    );
  }
}
