// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [PreferredSize].

void main() => runApp(const PreferredSizeExampleApp());

class PreferredSizeExampleApp extends StatelessWidget {
  const PreferredSizeExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PreferredSizeExample(),
    );
  }
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              const Text(
                'PreferredSize Sample',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 50,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PreferredSizeExample extends StatelessWidget {
  const PreferredSizeExample({super.key});

  @override
  Widget build(BuildContext context) {
    var container = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Colors.blue, Colors.pink],
        ),
      ),
      child: const AppBarContent(),
    );
    var preferredSize2 = PreferredSize(
      preferredSize: const Size.fromHeight(180.0),
      child: container,
    );
    return Scaffold(
      appBar: preferredSize2,
      body: const Center(
        child: Text('Content'),
      ),
    );
  }
}
