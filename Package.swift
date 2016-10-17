//
//  Package.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/10/17.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MyKit",
    dependencies: [
        .Package(url: "https://github.com/anotheren/SwiftyHash.git",
                 majorVersion: 0)
    ]
)
