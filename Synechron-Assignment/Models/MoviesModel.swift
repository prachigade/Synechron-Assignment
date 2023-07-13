//
//  MoviesModel.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation

// MARK: - Movies
struct MoviesResponse: Codable {
    let page: Int
    let results: [Movies]
    let total_pages, total_results: Int
}

// MARK: - Result
struct Movies: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title, overview: String
    let popularity: Double
    let release_date: String
    let poster_path: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
