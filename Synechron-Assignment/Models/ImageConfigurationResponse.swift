//
//  ImageConfigurationResponse.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation

// MARK: - ImageConfigurationResponse
struct ImageConfigurationResponse: Codable {
    let images: Images?
    let change_keys: [String]
}

// MARK: - Images
struct Images: Codable {
    let base_url: String
    let secure_base_url: String
    let backdrop_sizes, logo_sizes, poster_sizes, profile_sizes: [String]
    let still_sizes: [String]
}
