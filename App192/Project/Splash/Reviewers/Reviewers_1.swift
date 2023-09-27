//
//  Reviewers_1.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 8, content: {
                    
                    Text("Stay up to date with podcasts")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("New and up-to-date information")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Image("reviewers_1")
                    .resizable()
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_2()
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

struct Reviewers_1_Previews: PreviewProvider {
    static var previews: some View {
        Reviewers_1()
    }
}
