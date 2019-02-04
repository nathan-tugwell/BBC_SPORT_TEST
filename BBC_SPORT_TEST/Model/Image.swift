//
//  Image.swift
//  BBC_SPORT_TEST
//
//  Created by Nathan Tugwell on 04/02/2019.
//  Copyright © 2019 nathantugwell. All rights reserved.
//

import Foundation

struct Image: Decodable {
    var small: URL
    var medium: URL
    var large: URL
}
