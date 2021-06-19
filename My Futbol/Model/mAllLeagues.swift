//
//  mAllLeagues.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

struct mAllLeagues: Codable {
    let data: [mLeague]?
    let status: Bool?
}

struct mLeague: Codable {
    let id, name, abbr: String?
    let logos: mLogoLeague?
}

struct mLogoLeague: Codable {
    let light, dark: String?
}
