//
//  LeagueViewModels.swift
//  My Futbol
//
//  Created by Maul on 04/07/21.
//

import ImageSlideshow

class LeagueViewModels {
    
    let imgCarousel = [
        "https://images.daznservices.com/di/library/GOAL/9c/d9/marco-verratti-italy-kevin-de-bruyne-belgium-euro-2020_4tog0oastsy81axw0qrfavh9c.jpg?t=1849119754&amp;quality=60&amp;w=1000",
        "https://images.daznservices.com/di/library/GOAL/6/16/rodrigo-de-paul-argentina-ecuador-copa-america-03072021_rxucdpsayopj1dpotxexif0ou.jpg?t=1872578362&amp;quality=60&amp;w=1000",
        "https://images.daznservices.com/di/library/GOAL/fb/92/wayne-rooney-derby-2020-21_ayqm68eooslb13r92f7vt5nri.jpg?t=1324765593&amp;quality=60&amp;w=600"
    ]
    
    private var league: mLeague
    
    init(league: mLeague) {
        self.league = league
    }
    
    var leagueName: String {
        return league.name ?? ""
    }
    
    var imgLeague: String {
        return league.logos?.light ?? ""
    }
}
