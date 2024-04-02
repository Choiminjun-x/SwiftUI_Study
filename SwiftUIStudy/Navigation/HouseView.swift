//
//  HouseView.swift
//  SwiftUIStudy
//
//  Created by 최민준 on 4/1/24.
//

import SwiftUI
import Combine

struct HouseView: View {
    @EnvironmentObject var router: HouseRouter

    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text("**Home**")
                .font(.system(size: 24))
            
            Button("**Go to Living room**") {
                router.navigate(to: .livingroom)
            }
            .padding(.top, 12)

        }
        .padding()
    }
}


struct LivingroomView: View {
    @EnvironmentObject var router: HouseRouter
    
    var body: some View {
        VStack {
            Image(systemName: "sofa.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            Text("**Livingroom**")
                .font(.system(size: 24))
                .padding(.top, 12)
            
            Button("**Go to MJ's Bedroom**") {
                router.navigate(to: .bedroom(owner: "MJ"))
            }
            .padding(.top, 12)
            
            Button("**Go to MJ brother's Bedroom**") {
                router.navigate(to: .bedroom(owner: "MJ brother"))
            }
            .padding(.top, 12)
            
            Button {
                router.navigateBack()
            } label: {
                Text("Back")
            }
            .padding(.top, 4)
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}


struct BedroomView: View {
    @EnvironmentObject var router: HouseRouter
    var ownerName: String
    
    var body: some View {
        VStack {
            Text("\(ownerName)'s Bedroom")
                .font(.system(size: 36, weight: .bold))
                .padding(.bottom, 12)
            Image(systemName: "bed.double.fill")
                .font(.system(size: 56))
                .foregroundColor(.accentColor)
            
            Button {
                router.navigateBack()
            } label: {
                Text("Back to **Livingroom**")
            }
            .padding(.top, 12)
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Pop to **Home**")
            }
            .padding(.top, 4)

        }
        .navigationBarBackButtonHidden()
        .padding()
    }
}


#Preview {
    HouseView()
}
