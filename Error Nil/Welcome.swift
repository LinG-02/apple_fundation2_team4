//
//  Welcome.swift
//  Error Nil
//
//  Created by Junling Guan on 7/6/2023.
//
import SwiftUI

struct Welcome: View {
    @State var isTapped: Bool = false
    
    var body: some View {
        VStack {
            Image("logo3")
                .resizable()
                .frame(width: 260, height: 260, alignment: .center)
            Text("Touch anywhere to start")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            isTapped = true
        }
        .background(
            NavigationLink(destination: ProgressWheel(), isActive: $isTapped) {
                EmptyView()
            }
            .hidden()
        )
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Wrap the Welcome view with NavigationView
            Welcome()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
