//
//  Secrets.swift
//  CineNow
//
//  Created by NJ Development on 31/01/26.
//

import Foundation

public enum Secrets {

    public static var tmdbApiKey: String {
        guard
            let key = Bundle.main.object(
                forInfoDictionaryKey: "TMDB_API_KEY"
            ) as? String,
            !key.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            fatalError("""
            TMDB_API_KEY not configured correctly.
            Verify:
            1. The key exists in your xcconfig file.
            2. The xcconfig is linked in project.yml.
            3. INFOPLIST_KEY_TMDB_API_KEY is properly set.
            """)
        }

        return key
    }
}
