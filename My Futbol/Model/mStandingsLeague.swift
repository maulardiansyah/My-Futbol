//
//  mStandingsLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

//MARK: - Standings Season
struct StandingsLeague: Codable {
    let status: Bool?
    let data: SeasonStandingDetail?
}

struct SeasonStandingDetail: Codable {
    let name, seasonDisplay: String?
    let season: Int?
    let standings: [TeamStanding]?
}

// MARK: - Standings Per team
struct TeamStanding: Codable {
    let team: Team?
    let note: NoteStanding?
    let stats: [StatsStandings]?
}

struct Team: Codable {
    let id, location, name: String?
    let abbreviation, displayName: String?
    let logos: [LogoTeam]?
}

struct NoteStanding: Codable {
    let color, description: String?
    let rank: Int?
}

struct StatsStandings: Codable {
    let name, displayName, shortDisplayName, displayValue: String?
    let value: Int?
}

struct LogoTeam: Codable {
    let href: String?
}
