//
//  mStandingsLeague.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

//MARK: - Standings Season
struct mStandingsLeague: Codable {
    let status: Bool?
    let data: mSeasonStandingDetail?
}

struct mSeasonStandingDetail: Codable {
    let name, seasonDisplay: String?
    let season: Int?
    let standings: [mTeamStanding]?
}

// MARK: - Standings Per team
struct mTeamStanding: Codable {
    let team: mTeam?
    let note: mNoteStanding?
    let stats: [mStatsStandings]?
}

struct mTeam: Codable {
    let id, location, name: String?
    let abbreviation, displayName: String?
    let logos: [mLogoTeam]?
}

struct mNoteStanding: Codable {
    let color, description: String?
    let rank: Int?
}

struct mStatsStandings: Codable {
    let name, displayName, shortDisplayName, displayValue: String?
    let value: Int?
}

struct mLogoTeam: Codable {
    let href: String?
}




