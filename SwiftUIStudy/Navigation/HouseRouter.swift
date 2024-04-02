//
//  HouseRouter.swift
//  SwiftUIStudy
//
//  Created by 최민준 on 4/1/24.
//

import Foundation
import SwiftUI


final class HouseRouter: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case livingroom
        case bedroom(owner: String)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
