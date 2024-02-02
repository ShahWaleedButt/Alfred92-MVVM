//
//  OpenAIConfigurator.swift
//  A92MVVM
//
//  Created by ShahWaleed  on 1/23/24.
//

import Foundation
import OpenAIKit


struct AppConfig {
    static let openAIKey: String = {
        guard let secretsPath = Bundle.main.path(forResource: "MyAPIKeys", ofType: "plist"),
              let secrets = NSDictionary(contentsOfFile: secretsPath),
              let apiKey = secrets["OpenAI_APIKeys"] as? String else {
            fatalError("Couldn't load OpenAI API key from MyAPIKeys.plist")
        }
        return apiKey
    }()

    static func configureOpenAI() {
        OpenAI.
    }
}
