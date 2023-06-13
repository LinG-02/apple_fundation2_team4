//
//  ChallengePage.swift
//  Error Nil
//
//  Created by James Do on 8/6/2023.
//

import SwiftUI

struct ChallengePage: View {
    @State private var challenge: String = ""
    @State private var challengeCreation: String = ""
    @State private var showAlert = false
    @State private var showInformation = false
    
    var body: some View {
        ZStack {
            Color(.sRGB, red: 1, green: 1, blue: 1)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 5) {

                HStack {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()

                    Text("Challenge")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()

                    Button(action: {
                        showInformation = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }


                }
                    .padding()

                Text("The Challenge turns the Essential Question into a call to action statement")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .padding(.top, 40)
                    .padding(.bottom, 10.0)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $challengeCreation)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 5)
                        .border(Color.black, width: 1)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100)
                        .lineLimit(5)

                    if challengeCreation.isEmpty {

                        Text("Write your Challenge Statement here...")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                    }
                }



                Text("Challenge Statement")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .padding(.top, 80)
                    .padding(.bottom, 10.0)


                ZStack(alignment: .topLeading) {
                    TextEditor(text: $challengeCreation)
                        .padding(.vertical, 3)
                        .padding(.horizontal, 5)
                        .border(Color.black, width: 1)
                        .multilineTextAlignment(.leading)
                        .frame(height: 100)
                        .lineLimit(5)

                    if challengeCreation.isEmpty {

                        Text("Write your Challenge Statement here...")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                    }
                }


                Spacer()
                    .padding(.top, 40)
                HStack {
                    Spacer()
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Done")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .font(.title)
                            .cornerRadius(10)
                    }
                }

                Spacer()
            }
                .padding()
                .alert(isPresented: $showAlert) {
                Alert(title: Text("Congratulations!"),
                    message: Text("Remeber you can go back anytime to edit this milestone"),
                    dismissButton: .default(Text("Dismiss")))
            }
                .sheet(isPresented: $showInformation) {
                // Content of the pop-up view
                BigIdeaPopupView()
            }
        }

    }


}

struct ChallengeCreationPopupView: View {
    var body: some View {
        VStack {
            Text("Challenge Statement Information")
                .font(.headline)
                .padding()

            Text("Information about Challenge Statement goes here")
                .font(.subheadline)
                .padding()

        }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct ChallengeCreationPage_Previews: PreviewProvider {
    static var previews: some View {
        ChallengePage()
    }
}
