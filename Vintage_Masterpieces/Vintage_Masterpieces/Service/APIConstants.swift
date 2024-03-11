//
//  APIConstants.swift
//  Vintage_Masterpieces
//
//  Created by Hoang Linh Nguyen on 11/3/2024.
//

import Foundation

enum APIConstants {
    static let apiHost = "api.spotify.com"
    static let authHost = "accounts.spotify.com"
    static let clientId = "ca09a48bcdfd460b986cacad620d317b"
    static let clientSecret = "f7511b1377684280b168a74b006eeee3"
    static let redirectUri = "https://www.google.com"
    static let responseType = "token"
    static let scopes = "user-read-private"

    static var authParams = [
        "response_type": responseType,
        "client_id": clientId,
        "redirect_uri": redirectUri,
        "scope": scopes
    ]
}
