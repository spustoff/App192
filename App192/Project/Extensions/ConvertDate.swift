//
//  ConvertDate.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
