//
//  BigIdeaListFinal.swift
//  AppSpark
//
//  Created by Junling Guan on 17/6/2023.
//

import SwiftUI

var bigtext1: String = ""
var bigtext2: String = ""
var bigtext3: String = ""
var bigtext4: String = ""
var finalBig: String = ""

struct BigIdeaListFinal: View {
    @State private var selectedTextBoxIndex: Int?
    @State private var selectedTextField: Int?
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    @State private var navigateToEssentialQuestionList = false
    
    @AppStorage("BigIdea1") private var storageBigIdea1 = ""
    @AppStorage("BigIdea2") private var storageBigIdea2 = ""
    @AppStorage("BigIdea3") private var storageBigIdea3 = ""
    @AppStorage("BigIdea4") private var storageBigIdea4 = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                Spacer()
                
                Text("Big Idea")
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
            
            Text("A Big Idea is a broad concept that can be explored in multiple ways")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24))
                .padding(.top, 40)
                .padding(.bottom, 10.0)
            Spacer()

            Text("List your Big Ideas and select one to continue")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24))
                .padding(.top, 10)
                .padding(.bottom, 10.0)
            Spacer()
            
            VStack {
                HStack {
                    TextField("Enter text", text: $storageBigIdea1)
                        .background(selectedTextBoxIndex == 0 ? Color.green : Color.white)
                        .border(Color.black)
                        .padding(10)
                        .cornerRadius(5)
                        .onTapGesture {
                            selectedTextBoxIndex = 0
                            finalBig = storageBigIdea1
                        }
                }
                
                HStack {

                    TextField("Enter text", text: $storageBigIdea2)
                        .background(selectedTextBoxIndex == 1 ? Color.green : Color.white)
                        .border(Color.black)
                        .padding(10)
                        .cornerRadius(5)
                        .onTapGesture {
                            selectedTextBoxIndex = 1
                            finalBig = storageBigIdea2
                        }
                }
                
                HStack {
                    TextField("Enter text", text: $storageBigIdea3)
                        .background(selectedTextBoxIndex == 2 ? Color.green : Color.white)
                        .border(Color.black)
                        .padding(10)
                        .cornerRadius(5)
                        .onTapGesture {
                            selectedTextBoxIndex = 2
                            finalBig = storageBigIdea3
                        }
                }
                
                HStack {
                    TextField("Enter text", text: $storageBigIdea4)
                        .background(selectedTextBoxIndex == 3 ? Color.green : Color.white)
                        .border(Color.black)
                        .padding(10)
                        .cornerRadius(5)
                        .onTapGesture {
                            selectedTextBoxIndex = 3
                            finalBig = storageBigIdea4
                        }
                }
            }
            
            Spacer()
                .padding(.top, 40)
            HStack {
                Spacer()
                Button(action: {
                    navigateToEssentialQuestionList = true
                    bigtext1 = storageBigIdea1
                    bigtext2 = storageBigIdea2
                    bigtext3 = storageBigIdea3
                    bigtext4 = storageBigIdea4
                }) {
                    Text("Next")
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: NavigationLink(
            destination: EssentialQuestionList(text: finalBig),
            isActive: $navigateToEssentialQuestionList,
            label: {
                EmptyView()
            }
        ))
        .sheet(isPresented: $showInformation) {
            BigIdeaListPopupView()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            bigtext1 = storageBigIdea1
            bigtext2 = storageBigIdea2
            bigtext3 = storageBigIdea3
            bigtext4 = storageBigIdea4
        }
    }
}

struct BigIdeaListPopupView: View {
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "lightbulb.fill")
                .font(.system(size: 60))
                .padding(.top, 60)
        }
        VStack (alignment: .leading, spacing: 5) {
            //Spacer()
            
            Text("What is a Big Idea?")
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Text("A Big Idea is a significant concept that can be approached from various angles and holds relevance and interest for the learner")
                .font(.subheadline)
                .padding(.horizontal, 20)
                .padding(.top, 4)
            
            Text("e.g. Lifestyle, Fitness, Connection, Mental Health")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.horizontal, 20)
                .padding(.top, 4)
                .padding(.bottom, 4)
            Divider()
            Text("Brainstorming Tip")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.top, 4)
                .padding(.horizontal, 20)
            
            Text("Create a mindmap with all relevant ideas. Organise 'Big Ideas' into groups, it allows for the fluid movement of ideas across various topics")
                .font(.system(size: 16))
                .padding(.horizontal, 20)
                .padding(.top, 4)
                .padding(.bottom, 4)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        
        Spacer()
    }
}

struct BigIdeaListFinal_Previews: PreviewProvider {
    static var previews: some View {
        BigIdeaListFinal()
    }
}
