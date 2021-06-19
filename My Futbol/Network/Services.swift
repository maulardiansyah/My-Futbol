//
//  Services.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

enum Services {
    /// Get All League
    case getAllLeagues
    
    /// Get Season Avalilabel Data by League
    case getSeasonAvalilable (_ leagueId: String)
    
    /// Get Standings League by Season
    case getStandings(_ leagueId: String, _ seasons: String)
}
