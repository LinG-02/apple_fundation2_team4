// logo floating and glowing and fading transition
//  Welcome.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 13/6/2023.
//
import SwiftUI

struct Welcome: View {
    @State var isTapped: Bool = false
    @State var yOffset: CGFloat = 0
    @State var isGlowing: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1.0), Color.yellow.opacity(0.2), .white, Color.yellow.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("AppSpark")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .shadow(color: isGlowing ? .yellow : .clear, radius: 10)
                    .onDisappear {
                        isGlowing = false
                    }
                
                Spacer()
                
                Text("\"Create an innovative app-concept using a challenge-based learning framework\"")
                    .italic()
                    .fontWeight(.regular)
                
                Spacer()
                
                Image("logo3")
                    .resizable()
                    .frame(width: 260, height: 260)
                    .shadow(color: isGlowing ? .green : .clear, radius: 10)
                    .offset(y: yOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                            isGlowing = true
                        }
                    }
                    .onDisappear {
                        isGlowing = false
                    }
                
                Spacer()
                
                Text("Touch me to start")
                    .font(.system(size: 30, weight: .bold))
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Spacer()
                Spacer()
            }
        }
        .onTapGesture {
            isTapped = true
        }
        .background(
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isTapped = true
                }
            }) {
                EmptyView()
            }
            .hidden()
        )
        .opacity(isTapped ? 0 : 1)
        .animation(.easeInOut(duration: 1.0), value: isTapped)
        .overlay(
            ProgressWheel()
                .opacity(isTapped ? 1 : 0)
                .animation(.easeInOut(duration: 1.0), value: isTapped)
        )
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                yOffset = -10 // Adjust the bouncing height as needed
            }
        }
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




