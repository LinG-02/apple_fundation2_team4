//
//  InvestigationPage.swift
//  Error Nil
//
//  Created by James Do on 9/6/2023.
//

import SwiftUI

public var investigate1 = ""
public var investigate2 = ""

struct investigationPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    
    @AppStorage("investigation") private var storageInvest1 = ""
    @AppStorage("refinedChallenge") private var storageInvest2 = ""
    
    var body: some View {
        Spacer()
        NavigationView{
            VStack {
                VStack(spacing: 5) {
                    HStack {
                        Button(action: {
                            presentationMode
                            .wrappedValue.dismiss()
                            
                        }) {Image(systemName: "arrow.backward")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                        }
                        
                        Spacer()

                        Text("Investigation")
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
                    Text("Find information from a variety of sources")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 40)
                        .padding(.bottom, 10.0)

                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $storageInvest1)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                    }
                    Text("Using this information form a refined Challenge Statement")                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 80)
                        .padding(.bottom, 10.0)


                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $storageInvest2)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                    }
                    Spacer()
                        .padding(.top, 40)
                    HStack {
                        Spacer()
                        Button(action: {
                            showAlert = true
                            investigate1 = storageInvest1
                            investigate2 = storageInvest2
                            progressState = 4
                        }) {
                            if investigate1.isEmpty && investigate2.isEmpty {
                                Text("Done")
                                    .padding()
                                
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .cornerRadius(10)
                            } else {
                                Text("Update")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .cornerRadius(10)
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
                        investigationPopupView()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            investigate1 = storageInvest1
            investigate2 = storageInvest2
        }
        .navigationBarBackButtonHidden(true)
   }
 }

 struct investigationPopupView: View {
     var body: some View {
         VStack(alignment: .center){
             Image(systemName: "magnifyingglass")
                             .font(.system(size: 60))
                             .padding(.top, 60)
         }
         VStack(alignment: .leading) {
             Text("Domain Investigation")
                 .font(.headline)
                 .padding(.horizontal, 20)
                 .padding(.top, 40)

             Text("This is a more thorough and polished exploration to develop your conceptual understanding and important factors in relation to your domain")
                 .font(.subheadline)
                 .padding(.horizontal, 20)
                 .padding(.top, 4)
                 .padding(.bottom, 4)
             Divider()
             Text("Refined Challenge Statement")
                 .font(.headline)
                 .padding(.horizontal, 20)
                 .padding(.top, 4 )

             Text("Based on your synthesis of ideas from your findings and original Challenge Statement form a refined Challenge Statement")
                 .font(.subheadline)
                 .padding(.horizontal, 20)
                 .padding(.top, 4)

         }
             .padding()
             .background(Color.white)
             .cornerRadius(10)
         
         Spacer()
     }
 }

 struct investigationPage_Previews: PreviewProvider {
     static var previews: some View {
         investigationPage()
     }
 }
