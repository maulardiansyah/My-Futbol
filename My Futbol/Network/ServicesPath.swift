//
//  ServicesPath.swift
//  My Futbol
//
//  Created by Maul on 19/06/21.
//

extension Services {
    var path: String {
        
        switch self {
        /// Get All Leagues
        case .getAllLeagues:
            return "/leagues"
        
        /// Get All Season League
        case .getSeasonAvalilable(let leagueId):
            return "/leagues/\(leagueId)/seasons"
            
        /// Get Standings League By Season
        case .getStandings(let leagueId, let season):
            return "/leagues/\(leagueId)/standings?season=\(season)"
        
        }
    }
}
