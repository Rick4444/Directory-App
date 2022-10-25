//
//  APIService.swift
//  Directory App
//

import Foundation


class APIService :  NSObject {
    
    private let employeesSourcesURL = URL(string: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people")!
    private let roomsSourcesURL = URL(string: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms")!
    
    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
        
        URLSession.shared.dataTask(with: employeesSourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Employees.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
    func apiToGetRoomsData(completion : @escaping (Rooms) -> ()){
        
        URLSession.shared.dataTask(with: roomsSourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Rooms.self, from: data)
            
                    completion(empData)
            }
            
        }.resume()
    }
    
}
