//
//  Rooms.swift
//  Directory App
//

import Foundation

// MARK: - Room
struct RoomData: Codable {
    var createdAt: String?
    var isOccupied: Bool?
    var maxOccupancy: Int?
    var id: String?
}

typealias Rooms = [RoomData]
