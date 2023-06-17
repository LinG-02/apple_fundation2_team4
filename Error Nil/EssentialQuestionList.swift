//
//  EssentialQuestionList.swift
//  AppSpark
//
//  Created by Junling Guan on 17/6/2023.
//
//

import SwiftUI

var estext1: String = ""
var estext2: String = ""
var estext3: String = ""
var estext4: String = ""
var finalES: String = ""

struct EssentialQuestionList: View {
    @State private var finalEsBoxIndex: Int?
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    @State private var navigateToSummaryPage = false
    
    @AppStorage("EssentialQuestion1") private var storageEssentialQuestion1 = ""
    @AppStorage("EssentialQuestion2") private var storageEssentialQuestion2 = ""
    @AppStorage("EssentialQuestion3") private var storageEssentialQuestion3 = ""
    @AppStorage("EssentialQuestion4") private var storageEssentialQuestion4 = ""
    
    var text: String // Modified property name
    
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
                
                Text("Essential Question")
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
            
            Text("Write some Essential Questions based on your big idea")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24))
                .padding(.top, 20)
                .padding(20)
            Spacer()
            
            Text("Your Big Idea was: \(text)") // Display the selected text
                .font(.system(size: 20))
                .padding()
            
            TextField("Enter text", text: $storageEssentialQuestion1)
                .background((finalEsBoxIndex == 0 && allTextFieldsFilled()) ? Color.green : Color.white)
                .border(Color.black)
                .padding(10)
                .cornerRadius(5)
                .onTapGesture {
                    if allTextFieldsFilled() {
                        finalEsBoxIndex = 0
                        finalES = estext1 // Set the selected text
                    }
                }
            
            TextField("Enter text", text: $storageEssentialQuestion2)
                .background((finalEsBoxIndex == 1 && allTextFieldsFilled()) ? Color.green : Color.white)
                .border(Color.black)
                .padding(10)
                .cornerRadius(5)
                .onTapGesture {
                    if allTextFieldsFilled() {
                        finalEsBoxIndex = 1
                        finalES = estext2 // Set the selected text
                    }
                }
            
            TextField("Enter text", text: $storageEssentialQuestion3)
                .background((finalEsBoxIndex == 2 && allTextFieldsFilled()) ? Color.green : Color.white)
                .border(Color.black)
                .padding(10)
                .cornerRadius(5)
                .onTapGesture {
                    if allTextFieldsFilled() {
                        finalEsBoxIndex = 2
                        finalES = estext3 // Set the selected text
                    }
                }
            
            TextField("Enter text", text: $storageEssentialQuestion4)
                .background((finalEsBoxIndex == 3 && allTextFieldsFilled()) ? Color.green : Color.white)
                .border(Color.black)
                .padding(10)
                .cornerRadius(5)
                .onTapGesture {
                    if allTextFieldsFilled() {
                        finalEsBoxIndex = 3
                        finalES = estext4 // Set the selected text
                    }
                }
            Spacer()
                .padding(.top, 40)
            HStack {
                Spacer()
                Button(action: {
                    showAlert = true
                    estext1 = storageEssentialQuestion1
                    estext2 = storageEssentialQuestion2
                    estext3 = storageEssentialQuestion3
                    estext4 = storageEssentialQuestion4
                    progressState = 1
                }) {
                    Text("Done")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(10)
                    
                }
                
                
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Congratulations!"),
                      message: Text("Remember you can go back anytime to edit this milestone"),
                      dismissButton: .default(Text("Back to Progress Wheel"), action: {
                    navigateToSummaryPage = true
                }))
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: NavigationLink(
                destination: ProgressWheel(),
                isActive: $navigateToSummaryPage,
                label: {
                    EmptyView()
                }
            ))
            .sheet(isPresented: $showInformation) {
                // Content of the pop-up view
                EssentialQuestionListPopupView()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .onAppear {
                estext1 = storageEssentialQuestion1
                estext2 = storageEssentialQuestion2
                estext3 = storageEssentialQuestion3
                estext4 = storageEssentialQuestion4
            }
        }
        
        
    }
    
    private func allTextFieldsFilled() -> Bool {
        return !estext1.isEmpty && !estext2.isEmpty && !estext3.isEmpty && !estext4.isEmpty
    }
    
    private func finalEs(for index: Int?) -> String {
        switch index {
        case 0:
            return estext1
        case 1:
            return estext2
        case 2:
            return estext3
        case 3:
            return estext4
        default:
            return ""
        }
    }
}
struct EssentialQuestionListPopupView: View {
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "lightbulb.fill")
                .font(.system(size: 60))
                .padding(.top, 60)
        }
        VStack (alignment: .leading, spacing: 5) {
            //Spacer()
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
struct EssentialQuestionList_Previews: PreviewProvider {
    static var previews: some View {
        EssentialQuestionList(text: finalES)
    }
}
