//
//  PersonaePage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 9/6/2023.
//

import SwiftUI

public var personae1 = ""
public var personae2 = ""

struct PersonaePage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    
    @AppStorage("personae1") private var storagePsn1 = ""
    @AppStorage("personae2") private var storagePsn2 = ""
    
    
    var body: some View {
        Spacer()
        NavigationView{
            VStack(spacing: 5) {
                HStack(alignment: .top) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }

                    Text("Personae")
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
                
                Text("Create a Persona of the person you built this app for")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .padding(.top, 40)
                    .padding(.bottom, 10.0)
                
                TextEditor(text: $storagePsn1)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 5)
                    .border(Color.black, width: 1)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100)
                    .lineLimit(5)

                Text("Create an Opportunity Statement")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .padding(.top, 80)
                    .padding(.bottom, 10.0)
                TextEditor(text: $storagePsn2)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 5)
                    .border(Color.black, width: 1)
                    .multilineTextAlignment(.leading)
                    .frame(height: 100)
                    .lineLimit(5)

                HStack {
                    Spacer()
                    Button(action: {
                        showAlert = true
                        personae1 = storagePsn1
                        personae2 = storagePsn2
                        progressState = 4
                    }) {
                        if personae1.isEmpty && personae2.isEmpty {
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
                PersonaePopupView()
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
        .onAppear {
            personae1 = storagePsn1
            personae2 = storagePsn2
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PersonaePopupView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center){
                Image(systemName: "person.fill")
                    .font(.system(size:60))
                    .padding(.top, 60)
            }
            VStack(alignment: .leading) {
             

                Text("Persona requirements")
                    .font(.headline)
                    .padding(.top, 40)
                    .padding(.horizontal, 20)
                Text("Name, Age, Gender, Profession")
                    .font(.subheadline)
                    .padding(.top, 4)
                    .padding(.horizontal, 20)

                Text("Goals & Needs")
                    .font(.subheadline)
                //.bold()
                    .padding(.top, 4)
                    .padding(.horizontal, 20)


                Text("Pain/Problems/Obstacles")
                    .font(.subheadline)
                //  .bold()
                    .padding(.top, 4)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)

                Divider()
               
                Text("Opportunity Statement")
                    .font(.headline)
                //  .bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                
                Text("Create an Opportunity statement that you have discovered from the Persona")
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                
                
                Text("Use the provided format below:")
                    .font(.subheadline)
                    //.bold()
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                
                
                Text("[Persona] [needs/wants/wishes] [because]")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                
                Text("e.g. [New mentors] [needs] a way to gain confidence in their new role [because] they're concerned about running a class for the first time")
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                    .padding(.top, 4)
                    .foregroundColor(.gray)
                
            }
            //                     .frame(maxWidth: .infinity, alignment: .leading) // Set frame alignment to leading edge
            //.padding()
            .background(Color.white)
           // .cornerRadius(10)
            
           // Spacer()
            
        }
    }
    
}

struct PersonaePage_Previews: PreviewProvider {
    static var previews: some View {
        PersonaePage()
    }
}

