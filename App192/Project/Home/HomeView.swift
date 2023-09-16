//
//  HomeView.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Plus Path")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 40) {
                        
                        VStack(alignment: .leading, content: {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("Popular Podcast")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Simply tap the play button to play easily")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(Array(viewModel.podcasts.prefix(4)).shuffled(), id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        HomeDetail(index: index)
                                            .navigationBarHidden(true)
                                        
                                    }, label: {
                                        
                                        WebPic(urlString: index.image, width: .infinity, height: 200, cornerRadius: 10, isPlaceholder: true)
                                            .overlay(
                                            
                                                VStack(alignment: .leading, spacing: 15) {
                                                    
                                                    Text(index.title)
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 16, weight: .medium))
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(2)
                                                    
                                                    HStack {
                                                        
                                                        Image(systemName: "play.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17, weight: .bold))
                                                        
                                                        Text("Duration: \(index.duration) min.")
                                                            .foregroundColor(.white.opacity(0.7))
                                                            .font(.system(size: 13, weight: .regular))
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                    .padding()
                                                    .background(Color.black.opacity(0.5))
                                                    .frame(maxHeight: .infinity, alignment: .bottom)
                                            )
                                    })
                                }
                            })
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, content: {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text("All Podcasts")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Simply tap the play button to play easily")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.podcasts, id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        HomeDetail(index: index)
                                            .navigationBarHidden(true)
                                        
                                    }, label: {
                                        
                                        WebPic(urlString: index.image, width: .infinity, height: 200, cornerRadius: 10, isPlaceholder: true)
                                            .overlay(
                                            
                                                VStack(alignment: .leading, spacing: 15) {
                                                    
                                                    Text(index.title)
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 16, weight: .medium))
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(2)
                                                    
                                                    HStack {
                                                        
                                                        Image(systemName: "play.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17, weight: .bold))
                                                        
                                                        Text("Duration: \(index.duration) min.")
                                                            .foregroundColor(.white.opacity(0.7))
                                                            .font(.system(size: 13, weight: .regular))
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                    .padding()
                                                    .background(Color.black.opacity(0.5))
                                                    .frame(maxHeight: .infinity, alignment: .bottom)
                                            )
                                    })
                                }
                            })
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            
            viewModel.getPodcasts()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
