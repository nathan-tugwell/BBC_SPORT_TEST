//
//  Items.swift
//  BBC_SPORT_TEST
//
//  Created by Nathan Tugwell on 04/02/2019.
//  Copyright © 2019 nathantugwell. All rights reserved.
//

import Foundation

struct Items: Decodable {
    var type: String
    var title: String
    var url: String
    var sectionLabel: String
    var isLive: Bool
    var lastUpdatedText: String
    var lastUpdatedTimestamp: Int
    var image: Image
}

struct Image: Decodable {
    var small: String
    var medium: String
    var large: String
    var altText: String
    var copyrightHolder: String
}
