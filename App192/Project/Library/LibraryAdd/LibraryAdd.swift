//
//  LibraryAdd.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct LibraryAdd: View {
    
    @StateObject var viewModel: LibraryViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add Podcast")
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
                    
                    LazyVStack(spacing: 35) {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Author")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Author Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.author.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.author)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text(Date().convertDate(format: "MMM d"))
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Your Income")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            HStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Enter income")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.income.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.income)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                        .keyboardType(.decimalPad)
                                })
                                
                                Button(action: {
                                    
                                    viewModel.isPairs = true
                                    
                                }, label: {
                                    
                                    Text(viewModel.pair.isEmpty ? "PAIR" : viewModel.pair)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                        .padding(6)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                })
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addPodcast {
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.fetchPodcasts()
                    }
                    
                }, label: {
                    
                    Text("Add Podcast")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.income.isEmpty || viewModel.pair.isEmpty || viewModel.author.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.income.isEmpty || viewModel.pair.isEmpty || viewModel.author.isEmpty ? true : false)
            }
        }
        .sheet(isPresented: $viewModel.isPairs, content: {
            
            LibraryPairs(pair: $viewModel.pair)
        })
        .sheet(isPresented: $viewModel.isChart, content: {
            
            LibraryChart(pair: viewModel.pair)
        })
        .onChange(of: viewModel.pair, perform: { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                viewModel.isChart = true
            }
        })
    }
}

struct LibraryAdd_Previews: PreviewProvider {
    static var previews: some View {
        LibraryAdd(viewModel: LibraryViewModel())
    }
}
