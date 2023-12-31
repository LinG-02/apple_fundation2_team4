//
//  ChallengePage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 14/6/2023.
//

import SwiftUI

public var challenge1 = ""
public var challenge2 = ""
public var challenge3 = ""

struct ChallengePage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    
    @AppStorage("Challenge1") private var storageChallenge1 = ""
    @AppStorage("Challenge2") private var storageChallenge2 = ""
    @AppStorage("Challenge3") private var storageChallenge3 = ""
    
    
    
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
                        
                        Text("Do you still remember your Essential Question? Retrieve it from the \"Big Idea\" stage and write it down below.")
                            .padding(.bottom)
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $storageChallenge1)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 5)
                                .border(Color.gray, width: 1)
                                .frame(height: 70)
                                .lineLimit(5)
                        }
                        
                        Text("Now, using your Essential Question as a starting point, let's generate some Challenge Statements. Please list them below.")
                            .padding(.top)
                        
                        Text("(*You may find the tips in the \"info\" tab helpful.)")
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                            .padding(.top, 2)
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $storageChallenge2)
                                .padding(.vertical, 3)
                                .padding(.horizontal, 5)
                                .border(Color.gray, width: 1)
                                .frame(height: 100)
                                .lineLimit(5)
                        }
                        
                        Group {
                            Text("Read through the Challenge Statements and select your favourite one write it down in the box below.")
                                .padding(.top)
                            
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $storageChallenge3)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 5)
                                    .border(Color.gray, width: 1)
                                    .frame(height: 70)
                                    .lineLimit(5)
                            }
                            
                        }
                    }
                    .padding()
                }
                HStack {
                    Spacer()
                    
                    Button(action: {
                        showAlert = true
                        challenge1 = storageChallenge1
                        challenge2 = storageChallenge2
                        challenge3 = storageChallenge3
                        progressState = 2
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
            .onTapGesture {
                hideKeyboard()
            }
            //to preserve the text in the text box
            .onAppear {
                challenge1 = storageChallenge1
                challenge2 = storageChallenge2
                challenge3 = storageChallenge3
            }
        } // navigationview close
        
        .navigationBarBackButtonHidden(true)
   
    } //  var body some view close
    
} // challengepage view close


struct ChallengePopupView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                Image(systemName: "mountain.2.fill")
                                .font(.system(size: 60))
                                .padding(.top, 60)
            }
            VStack {
                
                
                VStack(alignment: .leading) {
                    Group {
                        Text("Challenge Mindmapping")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.top, 20)
                        
                        Text("You can utilise the Challenge Mindmapping technique to efficiently generate Challenge Statements around your Essential Question. This technique will assist you in the process of brainstorming and exploring various possibilities.")
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
                        
                        Text("If you are in a team, you can vote for your favorite Challenge Statement with your team to determine your team's Challenge Statement. If you are working individually, carefully review your listed Challenge Statements and choose your favourite one.")
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
