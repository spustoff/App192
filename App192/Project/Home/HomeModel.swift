//
//  HomeModel.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct HomeModel: Codable, Hashable {
    
    var errors: Bool
    var rows: [HomeItem]
}

struct HomeItem: Codable, Hashable {
    
    var id: Int
    
    var title: String
    var image: String
    var audio: String
    var duration: Int
}
