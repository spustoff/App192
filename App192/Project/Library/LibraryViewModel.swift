//
//  LibraryViewModel.swift
//  App192
//
//  Created by Вячеслав on 9/15/23.
//

import SwiftUI
import CoreData

final class LibraryViewModel: ObservableObject {
    
    @Published var current_category: LibraryTypes = .wish
    
    @Published var isAdd: Bool = false
    @Published var isPairs: Bool = false
    @Published var isChart: Bool = false
    
    @AppStorage("wish_list") var wish_list: [String] = []
    @Published var podcasts: [LibraryModel] = []
    
    @Published var name: String = ""
    @Published var author: String = ""
    @Published var income: String = ""
    @Published var pair: String = ""
    
    @Published var pairs: [String] = ["EURUSD", "EURTRY", "EURRUB", "EURJPY", "EURCAD"]
    
    func addPodcast(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "LibraryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "LibraryModel", into: context) as! LibraryModel
        
        trans.name = name
        trans.author = author
        trans.income = Int16(income) ?? 0
        trans.pair = pair
        trans.date = Date()
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchPodcasts() {
        
        CoreDataStack.shared.modelName = "LibraryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<LibraryModel>(entityName: "LibraryModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.podcasts = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.podcasts = []
        }
    }
}

enum LibraryTypes: CaseIterable {
    
    case wish, my_podcasts
    
    var text: String {
        
        switch self {
            
        case .wish:
            return "Wish List"
            
        case .my_podcasts:
            return "My Podcasts"
        }
    }
}
