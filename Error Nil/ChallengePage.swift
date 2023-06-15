//
//  ChallengePage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 14/6/2023.
//

import SwiftUI

struct ChallengePage: View {
    @State private var showAlert = false
    @State private var showInformation = false
    @StateObject private var viewModel = ViewModel()
    
    @AppStorage("Challenge1") private var essentialQ = ""
    @AppStorage("Challenge2") private var challengesList = ""
    @AppStorage("Challenge3") private var challengeStatement = ""
    
//    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrow.backward")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("Challenge")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                    
                    Button(action: { showInformation = true }) {
                        Image(systemName: "info.circle")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                ScrollView {
                    VStack{
//                        Text("Welcome to the Challenge stage! In this stage, you will transform your essential question from the previous stage into a powerful call to action statement.")
//                            .padding(.bottom)
                        
                        Text("Do you still remember your essential question? Retrieve it from the \"Big Idea\" stage and write it down below.")
                            .padding(.bottom)
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $viewModel.Challenge1)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 5)
                                .border(Color.gray, width: 1)
                                .frame(height: 70)
                                .lineLimit(5)
                        }
                        
                        Text("Now, using your essential question as a starting point, let's generate some challenge statements. Please list them below.")
                            .padding(.top)
                        
                        Text("(*You may find the tips in the \"info\" tab helpful.)")
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                            .padding(.top, 2)
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $viewModel.Challenge2)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 5)
                                .border(Color.gray, width: 1)
                                .frame(height: 100)
                                .lineLimit(5)
                        }
                        
                        Group {
                            Text("Read through the challenge statements and select your favorite one write it down in the box below.")
                                .padding(.top)
                            
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $viewModel.Challenge3)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 5)
                                    .border(Color.gray, width: 1)
                                    .frame(height: 70)
                                    .lineLimit(5)
                            }
                            
                            Text("Great job! Click the \"Done\" button to save your progress and unlock the next stage.")
                                .bold()
                                .padding(.top)
                        }
                    }
                    .padding()
                }
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showAlert = true
                        viewModel.saveToDatabase()
                        essentialQ = viewModel.Challenge1
                        challengesList = viewModel.Challenge2
                        challengeStatement = viewModel.Challenge3
                    }) {
                        Text("Done")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(10)
                    }
                    
                    .padding(.trailing)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("Remember you can go back anytime to edit this milestone"),
                    dismissButton: .default(Text("Dismiss"))
                )
            }
            .sheet(isPresented: $showInformation) {
                ChallengePopupView()
            }
            .onAppear {
//                if !didPerformInitialization {
//                    viewModel.clearDatabase()
//                    didPerformInitialization = true
//                }
                viewModel.fetchDataFromDatabase()
            }
//            .navigationBarBackButtonHidden(true)
            
        
            
            
//                        .background(
//                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1.0), Color.yellow.opacity(0.1), .white, Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
//                        )
//
            
            
            
            
            
            
            
        } // navigationview close
        
        .navigationBarBackButtonHidden(true)
   
    } //  var body some view close
    
} // challengepage view close


struct ChallengePopupView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Challenge")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                
                VStack(alignment: .leading) {
                    Group {
                        Text("Challenge Mindmapping")
                            .font(.system(size: 20))
                            .bold()
                        
                        Text("You can utilize the Challenge Mindmapping technique to efficiently generate challenge statements around your essential question. This technique will assist you in the process of brainstorming and exploring various possibilities.")
                            .font(.system(size: 16))
                        
                        Text("STEP 1")
                            .font(.system(size: 17))
                            .bold()
                        
                        Text("Write the Essential Question at the center of the mind map, and then generate Challenge Statements around it.")
                            .font(.system(size: 16))
                        
                        Image("challengemindmap1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("STEP 2")
                            .font(.system(size: 17))
                            .bold()
                        
                        Text("If you are in a team, you can vote for your favorite Challenge Statement with your team to determine your team's challenge statement. If you are working individually, carefully review your listed challenge statements and choose your favorite one.")
                            .font(.system(size: 16))
                        
                        Image("challengemindmap2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Image("challengemindmap3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct ChallengePage_Previews: PreviewProvider {
    static var previews: some View {
        ChallengePage()
    }
}
