//
//  Users_5.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct Users_5: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 8, content: {
                    
                    Text("Don't miss anything important")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("The most up-to-date information especially for you")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                .padding(.horizontal, 30)
                
                Image("users_5")
                    .resizable()
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    })
                }
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                })
            }
            .padding()
        }
    }
}

struct Users_5_Previews: PreviewProvider {
    static var previews: some View {
        Users_5()
    }
}
