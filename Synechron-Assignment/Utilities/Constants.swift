//
//  Constants.swift
//  Synechron-Assignment
//
//  Created by Prachi Gade on 13/07/23.
//

import Foundation
struct Constants {
    
    //Base URL
    static let baseUrl = "https://api.themoviedb.org/3/"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let language = "language"
        static let page = "page"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case bearerToken = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYThkOWNhZGZhNDE3MzRmMzEyMzk3YmIxZjdjYzBjNyIsInN1YiI6IjY0YWU5N2U4ZTI0YjkzNWIyZTVhMzdiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2pjm-ZPzfWxIULCXuOkLrEtcj5G7bmE48NbaYcy0vZc"
    }
}
