//
//  Mission.swift
//  MoonShot
//
//  Created by Akash Sheelavant on 4/21/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let description: String
    let crew: [CrewRole]
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLaunchDateLongFormat: String {
        launchDate?.formatted(date: .complete, time: .shortened) ?? "N/A"
    }
}
