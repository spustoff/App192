//
//  DiscoveryModel.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct DiscoveryModel: Codable, Hashable {
    
    var results: [DiscoveryItem]
}

struct DiscoveryItem: Codable, Hashable {
    
    var resultHash, resultInstrument, resultPeriod: String
    
    var resultTp, resultSl, resultP: Double
    
    var resultSignal, resultDate: String
}
