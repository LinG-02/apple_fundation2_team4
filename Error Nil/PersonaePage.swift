////
////  PersonaePage.swift
////  Error Nil
////
////  Created by Mingpeng Wang on 9/6/2023.
////
//
//import SwiftUI
//
//struct PersonaePage: View {
//    @State private var showAlert = false
//    @State private var showInformation = false
//    @StateObject private var viewModel = ViewModel()
//    
//    @AppStorage("personae1") private var personae = ""
//    @AppStorage("personae2") private var opportunityStatement = ""
//    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
//    
//    @Environment(\.presentationMode) var presentationMode
//    
//    
//    var body: some View {
//        Spacer()
//        NavigationView{
//            ZStack {
//                Color(.sRGB, red: 1, green: 1, blue: 1)
//                    .edgesIgnoringSafeArea(.all)
//                VStack(spacing: 5) {
//                    
//                    HStack {
//                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                            Image(systemName: "arrow.backward")
//                                .font(.largeTitle)
//                                .foregroundColor(.black)
//                        }
//                        
//                        Spacer()
//                        
//                        Text("Personae")
//                            .font(.largeTitle)
//                            .frame(maxWidth: .infinity, alignment: .center)
//                        Spacer()
//                        
//                        Button(action: {
//                            showInformation = true
//                        }) {
//                            Image(systemName: "info.circle")
//                                .font(.largeTitle)
//                                .foregroundColor(.black)
//                        }
//                        
//                        
//                    }
//                    .padding()
//                    
//                    Text("Create a Persona of the person you built this app for")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.system(size: 24))
//                        .padding(.top, 40)
//                        .padding(.bottom, 10.0)
//                    
//                    ZStack(alignment: .topLeading) {
//                        TextEditor(text: $viewModel.Personae1)
//                            .padding(.vertical, 3)
//                            .padding(.horizontal, 5)
//                            .border(Color.black, width: 1)
//                            .multilineTextAlignment(.leading)
//                            .frame(height: 100)
//                            .lineLimit(5)
//                        
//                        //                         if personae.isEmpty {
//                        //
//                        //                             Text("Describe the persona here... \n\nHint: Don't be afraid to be specific ")
//                        //                                 .foregroundColor(.gray)
//                        //                                 .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
//                        //                         }
//                    }
//                    
//                    
//                    
//                    Text("Create an Opportunity Statement")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.system(size: 24))
//                        .padding(.top, 80)
//                        .padding(.bottom, 10.0)
//                    
//                    
//                    ZStack(alignment: .topLeading) {
//                        TextEditor(text: $viewModel.Personae2)
//                            .padding(.vertical, 3)
//                            .padding(.horizontal, 5)
//                            .border(Color.black, width: 1)
//                            .multilineTextAlignment(.leading)
//                            .frame(height: 100)
//                            .lineLimit(5)
//                        
//                        //                         if opportunityStatement.isEmpty {
//                        //
//                        //                             Text("Write down the Opportunity Statement here... ")
//                        //                                 .foregroundColor(.gray)
//                        //                                 .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
//                        //                         }
//                    }
//                    
//                    
//                    Spacer()
//                        .padding(.top, 40)
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            showAlert = true
//                            viewModel.saveToDatabase()
//                            personae = viewModel.Personae1
//                            opportunityStatement = viewModel.Personae2
//                        }) {
//                            if personae.isEmpty && opportunityStatement.isEmpty {
//                                Text("Done")
//                                    .padding()
//                                
//                                    .background(Color.green)
//                                    .foregroundColor(.white)
//                                    .font(.title3)
//                                    .cornerRadius(10)
//                            } else {
//                                Text("Update")
//                                    .padding()
//                                    .background(Color.green)
//                                    .foregroundColor(.white)
//                                    .font(.title3)
//                                    .cornerRadius(10)
//                            }
//                        }
//                    }
//                    
//                    Spacer()
//                }
//                .padding()
//                .alert(isPresented: $showAlert) {
//                    Alert(title: Text("Congratulations!"),
//                          message: Text("Remeber you can go back anytime to edit this milestone"),
//                          dismissButton: .default(Text("Dismiss")))
//                }
//                .sheet(isPresented: $showInformation) {
//                    // Content of the pop-up view
//                    PersonaePopupView()
//                }
//            }
//            .onTapGesture {
//                hideKeyboard()
//            }
//        }
//        .onAppear {
//            print("didPerformInitialization value: \(didPerformInitialization)")
//            if !didPerformInitialization {
//                viewModel.clearDatabase()
//                didPerformInitialization = true
//            }
//            viewModel.fetchDataFromDatabase()
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct PersonaePopupView: View {
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .center){
//                Image(systemName: "person.fill")
//                    .font(.system(size:60))
//                    .padding(.top, 60)
//            }
//            VStack(alignment: .leading) {
//             
////                Text("Domain Personae")
////                    .font(.headline)
////                    .padding(.horizontal, 20)
////                    .padding(.top, 44)
////
////                Text("Create a persona of the person you built this app for.")
////                    .font(.subheadline)
////                    .padding(.top, 4)
////                    .padding(.horizontal, 20)
////
////
////                Text("Demographics")
////                    .font(.headline)
////                // .bold()
////                    .padding(.top, 44)
////                    .padding(.horizontal, 20)
//
//                Text("Persona requirements")
//                    .font(.headline)
//                    .padding(.top, 40)
//                    .padding(.horizontal, 20)
//                Text("Name, Age, Gender, Profession")
//                    .font(.subheadline)
//                    .padding(.top, 4)
//                    .padding(.horizontal, 20)
//
//                Text("Goals & Needs")
//                    .font(.subheadline)
//                //.bold()
//                    .padding(.top, 4)
//                    .padding(.horizontal, 20)
//
//
//                Text("Pain/Problems/Obstacles")
//                    .font(.subheadline)
//                //  .bold()
//                    .padding(.top, 4)
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 4)
//
//                Divider()
//               
//                Text("Opportunity Statement")
//                    .font(.headline)
//                //  .bold()
//                    .padding(.horizontal, 20)
//                    .padding(.top, 4)
//                
//                Text("Create an Opportunity statement that you have discovered from the Persona")
//                    .font(.subheadline)
//                    .padding(.horizontal, 20)
//                    .padding(.top, 4)
//                
//                
//                Text("Use the provided format below:")
//                    .font(.subheadline)
//                    //.bold()
//                    .padding(.horizontal, 20)
//                    .padding(.top, 4)
//                
//                
//                Text("[Persona] [needs/wants/wishes] [because]")
//                    .font(.subheadline)
//                    .bold()
//                    .foregroundColor(.black)
//                    .padding(.horizontal, 20)
//                    .padding(.top, 4)
//                
//                Text("e.g. [New mentors] [needs] a way to gain confidence in their new role [because] they're concerned about running a class for the first time")
//                    .font(.subheadline)
//                    .padding(.horizontal, 20)
//                    .padding(.top, 4)
//                    .foregroundColor(.gray)
//                
//            }
//            //                     .frame(maxWidth: .infinity, alignment: .leading) // Set frame alignment to leading edge
//            //.padding()
//            .background(Color.white)
//           // .cornerRadius(10)
//            
//           // Spacer()
//            
//        }
//    }
//    
//}
//
//struct PersonaePage_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonaePage()
//    }
//}
//
