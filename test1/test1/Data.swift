//
//  Data.swift
//  test1
//
//  Created by Офелия Баширова on 21.09.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.
//

import Foundation

struct Response: Decodable {
    let data: [Datas]
}
struct Datas: Decodable {
    let name: String
    let price: String
    let description: String
}
