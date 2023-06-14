//
//  BigIdeaPage.swift
//  Error Nil
//
//  Created by Antonio Perez on 7/6/2023.
//

import SwiftUI

struct BigIdeaPage: View {
    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    @StateObject private var viewModel = ViewModel()
    
    // 11/6 Ling's update
    @AppStorage("BigIdea1") private var storageBigIdea1 = ""
    @AppStorage("BigIdea2") private var storageBigIdea2 = ""


    var body: some View {
        Spacer()
        NavigationView{
            ZStack {
                Color(.sRGB, red: 1, green: 1, blue: 1)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 5) {
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
                    
                    ZStack(alignment: .topLeading) {
                        
                        TextEditor(text: $viewModel.BigIdea1)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
//                        if storageBigIdea1.isEmpty {
//                            Text("Write your Big Idea here...")
//                                .foregroundColor(.gray)
//                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
//                        }
                    }
                    
   
                    Text("Essential Question")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 80)
                        .padding(.bottom, 10.0)
                    
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $viewModel.BigIdea2)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
//                        if storageBigIdea1.isEmpty {
//
//                            Text("Write your Essential Question here...")
//                                .foregroundColor(.gray)
//                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
//                        }
                    
                    }
                    
                        .padding(.top, 40)
                    HStack {
                        Spacer()
                        Button(action: {
                            showAlert = true
                            viewModel.saveToDatabase()
                            storageBigIdea1 = viewModel.BigIdea1
                            storageBigIdea2 = viewModel.BigIdea2
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
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            print("didPerformInitialization value: \(didPerformInitialization)")
            if !didPerformInitialization {
                viewModel.clearDatabase()
            didPerformInitialization = true
            }
            viewModel.fetchDataFromDatabase()
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct BigIdeaPopupView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("What is a Big Idea?")
                .font(.headline)
                .padding()
            
            Text("A Big Idea is a significant concept that can be approached from various angles and holds relevance and interest for the learner")
                .font(.system(size: 16))
            
            Text("Note down a number of big ideas and connect them to 3 - 4 keywords each. Make connections between the different elements")
                .font(.system(size: 16))
            
            Text("Essential Questioning")
                .font(.headline)
                .padding()
            
            Text("Write down at least two Essential Questions and consider: Why do you care about this? What specifically do you care about? What do you want to focus on?")
                .font(.system(size: 16))
            
            Text("Brainstorming Tips:")
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding()
            
            Text("- Create stick-it notes and arrange into categories of 'how', 'what', 'who', 'why'")
                .multilineTextAlignment(.leading)
                .font(.system(size: 16))
            
            Text("- Create a mindmap with all relevant ideas. By organising concepts into groups, it allows for the fluid movement of ideas across various topics")
                .font(.system(size: 16))

            Image("challengeimage")
                .resizable()
                .frame(width: 360, height: 200, alignment: .center)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        
        Spacer()
    }
}

struct BigIdeaPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BigIdeaPage()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
public func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
