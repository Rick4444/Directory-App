//
//  RoomsViewModel.swift
//  Directory App
//

import Foundation

class RoomsViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var roomData : Rooms! {
        didSet {
            self.bindRoomsViewModelToController()
        }
    }
    
    var bindRoomsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetRoomsData { (roomData) in
            self.roomData = roomData
        }
    }
}
