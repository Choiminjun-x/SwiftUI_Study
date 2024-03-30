//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 최민준 on 3/30/24.
//

import SwiftUI
import Combine


class ObservableList: ObservableObject {
    @Published var list: [String] = []
}

struct ObservableObjectStudyView: View {
    @State private var text: String = ""
    @ObservedObject var observableList = ObservableList()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            
            HStack {
                Text("list에 추가될 텍스트: \(text)")
                Spacer()
            }
            
            HStack {
                TextField("input text", text: $text)
                CreateButtonView(text: $text, observableList: self.observableList)
            }
            
            List(observableList.list, id: \.self) { item in
                Text(item)
            }
        }.padding([.leading, .trailing], 20)
    }
}

struct CreateButtonView: View {
    @Binding var text: String // 다른 뷰에서 참조하기 위해서 @Binding으로 선언 - ObservableStudyView의 text와 연결된 상태
    var observableList: ObservableList
    
    var body: some View {
        Button(action: {
            self.observableList.list.insert(self.text, at: 0) // 리스트의 값이 변하기 떄문에 View를 업데이트 시켜준다.
            self.text = ""
        }, label: {
            Text("Update List")
        })
    }
}

#Preview {
    ObservableObjectStudyView()
}
