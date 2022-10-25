//
//  Employee.swift
//  MVVM_New
//

import Foundation

// MARK: - Employee
struct EmployeeData: Decodable {
    var createdAt, firstName: String?
    var avatar: String?
    var lastName, email, jobtitle, favouriteColor: String?
    var id: String?
    var data: DataClass?
    var to, fromName: String?
}

// MARK: - DataClass
struct DataClass: Decodable {
    var title, body, id, toID: String?
    var fromID, meetingid: String?

    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

typealias Employees = [EmployeeData]

