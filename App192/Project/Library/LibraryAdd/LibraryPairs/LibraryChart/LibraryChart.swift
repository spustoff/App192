//
//  LibraryChart.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct LibraryChart: View {
    
    @Environment(\.presentationMode) var router
    
    let pair: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Chart(pair: pair)
                    .disabled(true)
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

struct LibraryChart_Previews: PreviewProvider {
    static var previews: some View {
        LibraryChart(pair: "EURUSD")
    }
}
