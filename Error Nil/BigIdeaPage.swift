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
                    
                    Text("Write some Big Ideas in the box below and choose one to pursue")
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
                    
                    
                    Text("Write some Essential Questions in the box below and choose the main one to pursue")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 40)
                        .padding(.bottom, 10.0)
                    
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $viewModel.BigIdea2)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 3)
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
                    
                    //.padding(.top, 40)
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                showAlert = true
                                viewModel.saveToDatabase()
                                storageBigIdea1 = viewModel.BigIdea1
                                storageBigIdea2 = viewModel.BigIdea2
                            }) {
                                //                            Text("Done")
                                //                                .padding()
                                //                                .background(Color.green)
                                //                                .foregroundColor(.white)
                                //                                .font(.title)
                                //                                .cornerRadius(10)
                                //.padding(.top, 20)
                                if storageBigIdea1.isEmpty && storageBigIdea2.isEmpty {
                                    Text("Done")
                                        .padding()
                                    
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .cornerRadius(10)
                                } else {
                                    Text("Update")
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .cornerRadius(10)
                                }
                            }
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
            Divider()
            Text("Essential Questioning")
                .font(.headline)
                //.padding()
                .padding(.horizontal, 20)
                .padding(.top, 4)
            
            Text("Write down at least two Essential Questions and consider: Why do you care about this? What specifically do you care about? What do you want to focus on?")
                .font(.system(size: 16))
                .padding(.horizontal, 20)
                .padding(.top, 4)
            
            Text("e.g. How to improve...? Who wants to achieve...? Why... matters? How can...?")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.horizontal, 20)
                .padding(.top, 4)
      
            
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
