//
//  HomeDetail.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct HomeDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: HomeItem
    
    @StateObject var viewModel = PlayerModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true) {
                
                LazyVStack {
                    
                    Image("podcast_bg")
                        .overlay (
                        
                            WebPic(urlString: index.image, width: 180, height: 180, cornerRadius: 10, isPlaceholder: true)
                                .padding(.top, 60)
                        )
                    
                    VStack(alignment: .center, spacing: 20, content: {
                        
                        VStack(alignment: .center, spacing: 7) {
                            
                            Text(index.title)
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("By Admin")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .center, spacing: 7) {
                            
                            Text("Duration: \(index.duration) min.")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ForEach(1...5, id: \.self) { index in
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                }
                            }
                        }
                        
                        Button(action: {
                            
                            viewModel.playPause()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                                
                                Text(viewModel.isPlaying ? "Playing Now" : "Play Now")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            .padding([.horizontal, .top])
                        })
                    })
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .font(.system(size: 21, weight: .medium))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        if viewModel.wish_list.contains(index.title) {
                            
                            if let indexer = viewModel.wish_list.firstIndex(of: index.title) {
                                
                                viewModel.wish_list.remove(at: indexer)
                            }
                            
                        } else {
                            
                            viewModel.wish_list.append(index.title)
                        }
                        
                    }, label: {
                        
                        Image(systemName: viewModel.wish_list.contains(index.title) ? "bookmark.fill" : "bookmark")
                            .foregroundColor(viewModel.wish_list.contains(index.title) ? .blue : .white)
                            .font(.system(size: 21, weight: .medium))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.setupPlayer(podcast: index)
        }
    }
}

struct HomeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetail(index: HomeItem(id: 1, title: "Angelo_ Prop Firm Bubble, The Funded Trader,Future Of Prop Firms _ WOR Podcast - Miami Series EP.13", image: "https://remorem.space/storage/image/oczaYVPA2X0pT2Ch2EXCQTpKd0D8pWzFoXljWUFe.webp", audio: "https://remorem.space/storage/audio/bRKGUV4WsjFck7SjuYZcyyInuv5D3m2btVZanETm.mp3", duration: 3))
    }
}
