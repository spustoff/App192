//
//  Users_1.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isContacts: Bool
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 8, content: {
                    
                    Text("Unique opportunity to be successful")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Your usual trading view")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Image("users_1")
                    .resizable()
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Users_2(telegram: telegram, isContacts: isContacts, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 24/255, green: 103/255, blue: 221/225)))
                        .padding()
                })
            }
        }
    }
}

struct Users_1_Previews: PreviewProvider {
    static var previews: some View {
        Users_1(telegram: URL(string: "h")!, isContacts: false, isTelegram: false)
    }
}
