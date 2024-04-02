//
//  SwiftUIStudyApp.swift
//  SwiftUIStudy
//
//  Created by 최민준 on 3/30/24.
//

import SwiftUI
import Combine 

@main
struct SwiftUIStudyApp: App {
    @ObservedObject var router = HouseRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HouseView()
                    .navigationDestination(for: HouseRouter.Destination.self) { destination in
                        switch destination {
                        case .livingroom:
                            LivingroomView()
                        case .bedroom(let owner):
                            BedroomView(ownerName: owner)
                        }
                    }
            }
            .environmentObject(router)
        }
    }
}
