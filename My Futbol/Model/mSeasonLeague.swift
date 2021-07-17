//
//  mSeasonLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

struct mSeasonAvailable: Codable {
    let data: mSeasonLeague?
}

struct mSeasonLeague: Codable {
    let name: String?
    let seasons: [mSeasonDetails]?
}

struct mSeasonDetails: Codable {
    let year: Int?
    let startDate, endDate, displayName: String?
}
