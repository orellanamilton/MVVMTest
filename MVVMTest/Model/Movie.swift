//
//  movie.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import Foundation


struct Movie: Codable {
    let results : [ResultItem]
}

struct ResultItem: Codable {
    let release_date: String?
    let title: String?
    let poster_path: String
    let vote_average: Double
}

