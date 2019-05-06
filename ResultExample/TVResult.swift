//
// Created by Alan Casas on 2019-05-06.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct TVResult: Codable {
    let id: Int
    let name: String
    let numberOfSeasons: Int
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case numberOfSeasons = "number_of_seasons"
        case imageUrl = "image_url"
    }
}