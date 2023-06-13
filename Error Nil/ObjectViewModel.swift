//
//  ObjectViewModel.swift
//  Error Nil
//
//  Created by Junling Guan on 11/6/2023.
//

import Foundation
import RealmSwift

class ViewModel: ObservableObject {
    @Published var BigIdea1: String = ""
    @Published var BigIdea2: String = ""
    @Published var Challenge1: String = ""
    @Published var Investigate1: String = ""
    @Published var Investigate2: String = ""
    @Published var Personae1: String = ""
    @Published var Personae2: String = ""
    @Published var Solution1: String = ""
    @Published var Solution2: String = ""
    
    private var realm: Realm?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print("Failed to create Realm instance: \(error)")
        }
    }
    
    func fetchDataFromDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        guard let userInfo = realm.objects(UserInfo.self).first else {
            print("No UserInfo object found in the database")
            return
        }
        
        DispatchQueue.main.async {
            self.BigIdea1 = userInfo.BigIdea1
            self.BigIdea2 = userInfo.BigIdea2
            self.Challenge1 = userInfo.Challenge1
            self.Investigate1 = userInfo.Investigate1
            self.Investigate2 = userInfo.Investigate2
            self.Personae1 = userInfo.Personae1
            self.Personae2 = userInfo.Personae2
            self.Solution1 = userInfo.Solution1
            self.Solution2 = userInfo.Solution2
        }
    }


    
    func saveToDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                if let userInfo = realm.objects(UserInfo.self).first {
                    userInfo.BigIdea1 = BigIdea1
                    userInfo.BigIdea2 = BigIdea2
                    userInfo.Challenge1 = Challenge1
                    userInfo.Investigate1 = Investigate1
                    userInfo.Investigate2 = Investigate2
                    userInfo.Personae1 = Personae1
                    userInfo.Personae2 = Personae2
                    userInfo.Solution1 = Solution1
                    userInfo.Solution2 = Solution2
                } else {
                    let userInfo = UserInfo()
                    userInfo.BigIdea1 = BigIdea1
                    userInfo.BigIdea2 = BigIdea2
                    userInfo.Challenge1 = Challenge1
                    userInfo.Investigate1 = Investigate1
                    userInfo.Investigate2 = Investigate2
                    userInfo.Personae1 = Personae1
                    userInfo.Personae2 = Personae2
                    userInfo.Solution1 = Solution1
                    userInfo.Solution2 = Solution2
                    realm.add(userInfo)
                }
            }
        } catch {
            print("Failed to save to the database: \(error)")
        }
    }


    
    func clearDatabase() {
        guard let realm = realm else {
            print("Realm is not initialized")
            return
        }
        
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Failed to clear the database: \(error)")
        }
    }
    
    func isDataSaved() -> Bool {
        guard let realm = realm else {
            print("Realm is not initialized")
            return false
        }
        
        return realm.objects(UserInfo.self).first != nil
    }
}
    

