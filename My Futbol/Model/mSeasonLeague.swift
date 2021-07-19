//
//  mSeasonLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

struct SeasonAvailable: Codable {
    let data: SeasonLeague?
}

struct SeasonLeague: Codable {
    let name: String?
    let seasons: [SeasonDetails]?
}

struct SeasonDetails: Codable {
    let year: Int?
    let startDate, endDate, displayName: String?
}
