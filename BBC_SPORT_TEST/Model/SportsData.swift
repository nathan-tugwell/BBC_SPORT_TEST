//
//  SportsData.swift
//  BBC_SPORT_TEST
//
//  Created by Nathan Tugwell on 04/02/2019.
//  Copyright © 2019 nathantugwell. All rights reserved.
//

import Foundation

struct SportsData: Decodable {
    var topic: Topic
    var items = [Items]() 
}
