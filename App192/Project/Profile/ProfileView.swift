//
//  ProfileView.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Profile")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack(spacing: 25) {
                            
                            VStack(alignment: .center, spacing: 7, content: {
                                
                                Text("0")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text("Listened\nPodcasts")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            
                            VStack(alignment: .center, spacing: 7, content: {
                                
                                Text("0")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text("Listening\nincome")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                        }
                        .padding(.bottom, 30)
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text("Additional")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Button(action: {
                                
                                guard let url = URL(string: "https://docs.google.com/document/d/1IQTQiZvNCbwmywF4m4uSGetr16QgIYRrqyu8Tw7tQPM/edit?usp=sharing") else { return }
                                
                                UIApplication.shared.open(url)
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "doc.fill")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Text("Usage Policy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13 ,weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                            
                            Button(action: {
                                
                                SKStoreReviewController.requestReview()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Text("Rate Us")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 13 ,weight: .regular))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
