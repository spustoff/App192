//
//  LibraryView.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct LibraryView: View {
    
    @StateObject var viewModel = LibraryViewModel()
    @StateObject var homeModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Library")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        if viewModel.current_category == .my_podcasts {
                            
                            Button(action: {
                                
                                viewModel.isAdd = true
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            })
                        }
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(alignment: .bottom) {
                        
                        ForEach(LibraryTypes.allCases, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.current_category = index
                                
                            }, label: {
                                
                                Text(index.text)
                                    .foregroundColor(viewModel.current_category == index ? .white : .gray)
                                    .font(.system(size: viewModel.current_category == index ? 20 : 16, weight: .medium))
                            })
                        }
                    }
                    .padding(.horizontal)
                }
                
                switch viewModel.current_category {
                    
                case .my_podcasts:
                    
                    if viewModel.podcasts.isEmpty {
                        
                        VStack(spacing: 8, content: {
                            
                            Image("empty")
                            
                            Text("No podcasts added")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("Add your listened podcast to fix your balance")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.podcasts, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 7) {
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text(index.author ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 7) {
                                            
                                            Text("+$\(index.income)")
                                                .foregroundColor(.green)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text((index.date ?? Date()).convertDate(format: "MMM d"))
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                }
                            }
                            .padding()
                        }
                    }
                    
                case .wish:
                    if viewModel.wish_list.isEmpty {
                        
                        VStack(spacing: 8, content: {
                            
                            Image("empty")
                            
                            Text("No podcasts in Wish List")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("Add soon-to-be-released podcasts to listen to it after release")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .padding(.horizontal)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(homeModel.podcasts.filter{viewModel.wish_list.contains($0.title)}, id: \.self) { index in
                                    
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
                            .padding()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            
            homeModel.getPodcasts()
        }
        .onChange(of: viewModel.current_category, perform: { category in
            
            switch category {
                
            case .my_podcasts:
                viewModel.fetchPodcasts()
                
            case .wish:
                homeModel.getPodcasts()
            }
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            LibraryAdd(viewModel: viewModel)
        })
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
