//
//  DicoveryView.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI

struct DicoveryView: View {
    
    @StateObject var viewModel = DiscoveryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        Image("discovery_bg")
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Text("About Business")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("By Admin")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        })
                        .padding(.bottom, 40)
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Details")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Updated date: \(Date().convertDate(format: "MMM d"))")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .padding(.bottom)
                            
                            LazyVStack(alignment: .leading, content: {
                                
                                ForEach(viewModel.signals.prefix(8), id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedSignal = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 8, content: {
                                                
                                                Text(index.resultInstrument)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    HStack(spacing: 6, content: {
                                                        
                                                        Text("S/I")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .medium))
                                                        
                                                        Text("\(index.resultSl)")
                                                            .foregroundColor(.red)
                                                            .font(.system(size: 14, weight: .medium))
                                                    })
                                                    
                                                    HStack(spacing: 6, content: {
                                                        
                                                        Text("T/P")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .medium))
                                                        
                                                        Text("\(index.resultTp)")
                                                            .foregroundColor(.green)
                                                            .font(.system(size: 14, weight: .medium))
                                                    })
                                                }
                                                
                                                Text(index.resultDate)
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .trailing, spacing: 8, content: {
                                                
                                                Text("\(index.resultP)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                Text("Down")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    })
                                }
                            })
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            LibraryChart(pair: viewModel.selectedSignal.resultInstrument)
        })
        .onAppear {
            
            viewModel.getPodcasts()
        }
    }
}

struct DicoveryView_Previews: PreviewProvider {
    static var previews: some View {
        DicoveryView()
    }
}
