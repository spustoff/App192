//
//  LibraryPairs.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct LibraryPairs: View {
    
    @Environment(\.presentationMode) var router
    
    @Binding var pair: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Select Pair")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(["EURUSD", "EURTRY", "EURKZT", "EURRUB", "EURCAD", "USDRUB", "USDCAD", "USDTRY", "USDJPY"], id: \.self) { index in
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                pair = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        }
                    }
                    .padding()
                }
            }
        }
        
    }
}

struct LibraryPairs_Previews: PreviewProvider {
    static var previews: some View {
        LibraryPairs(pair: .constant("s"))
    }
}
