//
//  ProgressWheel.swift
//  Error Nil
//
//  Created by Junling Guan on 11/6/2023.
//

import SwiftUI

struct ProgressWheel: View {
    var body: some View {
            VStack {
                Text("Progress Wheel")
                    .font(.title)
                
                Button(action: {
                    // Action for Button BigIdeaPage
                }) {
                    NavigationLink(destination: BigIdeaPage()) {
                        Text("BigIdeaPage")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
//                Button(action: {
//                    // Action for Button ChallengePage
//                }) {
//                    NavigationLink(destination: ChallengePage()) {
//                        Text("Challenge")
//                            .font(.headline)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                }
                
                Button(action: {
                    // Action for Button investigationPage
                }) {
                    NavigationLink(destination: investigationPage()) {
                        Text("investigationPage")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                Button(action: {
                    // Action for Button PersonaePage
                }) {
                    NavigationLink(destination: PersonaePage()) {
                        Text("PersonaePage")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                Button(action: {
                    // Action for Button SolutionPage
                }) {
                    NavigationLink(destination: SolutionPage()) {
                        Text("SolutionPage")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
//                Button(action: {
//                    // Action for Button Prototype
//                }) {
//                    NavigationLink(destination: investigationPage()) {
//                        Text("prototype")
//                            .font(.headline)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                }
            }
        
        }
}

struct ProgressWheel_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Wrap the Welcome view with NavigationView
            ProgressWheel()
                .navigationBarBackButtonHidden(true) 
        }
        .previewDevice("iPhone 14 Pro")
    }
}
