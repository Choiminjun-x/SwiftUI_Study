//
//  RoomListView.swift
//  SwiftUIStudy
//
//  Created by 최민준 on 4/1/24.
//

import SwiftUI

struct RoomInfo: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: Image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

struct RoomsListView: View {
    private var roomInfos: [RoomInfo]
    
    init(roomInfos: [RoomInfo]) {
        self.roomInfos = roomInfos
    }
    
    var body: some View {
        NavigationStack {
            List(roomInfos) { roomInfo in
                NavigationLink(roomInfo.name, value: roomInfo)
            }
            .navigationTitle("Rooms")
            .navigationDestination(for: RoomInfo.self) { roomInfo in
                RoomDetailView(roomInfo: roomInfo)
            }
        }
    }
}

struct RoomDetailView: View {
    let roomInfo: RoomInfo
    
    var body: some View {
        VStack {
            roomInfo.image
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text(roomInfo.name)
                .font(.system(size: 24))
        }
        .padding()
    }
}
