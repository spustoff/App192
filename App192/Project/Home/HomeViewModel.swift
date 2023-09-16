//
//  HomeViewModel.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI
import Alamofire

final class HomeViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var podcasts: [HomeItem] = []
    
    @Published var selectedPodcast: HomeItem = HomeItem(id: 0, title: "", image: "https://", audio: "https://", duration: 0)
    @Published var isDetail: Bool = false
    
    @AppStorage("wish_list") var wish_list: [String] = []
    
    func getPodcasts() {
        
        isLoading = true
        
        self.fetchPodcasts() { result in
            
            switch result {
                
            case .success(let success):
                
                self.podcasts = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchPodcasts(completion: @escaping (Result<HomeModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "17e89802-677a-4cdd-ab45-207e6883d85c",
        ]
        
        let request = AF.request("https://remorem.space/api/v2/podcasts", method: .get, parameters: params)
        
        request.responseDecodable(of: HomeModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
