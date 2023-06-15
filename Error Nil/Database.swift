//
//  Database.swift
//  Error Nil
//
//  Created by Junling Guan on 11/6/2023.
//

import Foundation
import RealmSwift

class UserInfo: Object {
    //@Persisted var ID: String = ""
    @Persisted var BigIdea1: String = ""
    @Persisted var BigIdea2: String = ""
    @Persisted var Challenge1: String = ""
    @Persisted var Investigate1: String = ""
    @Persisted var Investigate2: String = ""
    @Persisted var Personae1: String = ""
    @Persisted var Personae2: String = ""
    @Persisted var Solution1: String = ""
    @Persisted var Solution2: String = ""
}
