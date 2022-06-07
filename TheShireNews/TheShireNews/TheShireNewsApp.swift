//
//  TheShireNewsApp.swift
//  TheShireNews
//
//  Created by student on 06/06/22.
//

import SwiftUI

@main
struct TheShireNewsApp: App {
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
