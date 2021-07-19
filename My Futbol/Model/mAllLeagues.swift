//
//  mAllLeagues.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

struct AllLeagues: Codable {
    let data: [League]?
    let status: Bool?
}

struct League: Codable {
    let id, name, abbr: String?
    let logos: LogoLeague?
}

struct LogoLeague: Codable {
    let light, dark: String?
}
