////
////  InvestigationPage.swift
////  Error Nil
////
////  Created by James Do on 9/6/2023.
////
//
//import SwiftUI
//
//struct investigationPage: View {
//    //     @State private var investigation: String = ""
//    //     @State private var refinedChallenge: String = ""
//    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
//    
//    @Environment(\.presentationMode) var presentationMode
//    @State private var showAlert = false
//    @State private var showInformation = false
//    @StateObject private var viewModel = ViewModel()
//    @AppStorage("investigation") private var investigation = ""
//    @AppStorage("refinedChallenge") private var refinedChallenge = ""
//    
//    var body: some View {
//        Spacer()
//        NavigationView{
//            ZStack {
//            Color(.sRGB, red: 1, green: 1, blue: 1)
//                .edgesIgnoringSafeArea(.all)
//            VStack(spacing: 5) {
//                
//                HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "arrow.backward")
//                            .font(.largeTitle)
//                            .foregroundColor(.black)
//                    }
//                    
//                    Spacer()
//                    
//                    Text("Investigation")
//                        .font(.largeTitle)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                    Spacer()
//                    
//                    Button(action: {
//                        showInformation = true
//                    }) {
//                        Image(systemName: "info.circle")
//                            .font(.largeTitle)
//                            .foregroundColor(.black)
//                    }
//                    
//                    
//                }
//                .padding()
//                
//                VStack {
//                    
//                    Text("Find information from a variety of sources")
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .font(.system(size: 24))
//                        .padding(.top, 40)
//                        .lineLimit(10)
//                }
//
//               
//                ZStack(alignment: .topLeading) {
//                    
//                    
//                    TextEditor(text: $viewModel.Investigate1)
//                        .padding(.vertical, 3)
//                        .padding(.horizontal, 5)
//                        .border(Color.black, width: 1)
//                        .multilineTextAlignment(.leading)
//                        .frame(height: 100)
//                        .lineLimit(5)
//                    
////                    if investigation.isEmpty {
////
////                        Text("Write your investigations here...")
////                            .foregroundColor(.gray)
////                            .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
////                    }
//                }
//                
//                
//                
//                Text("Using this information form a refined Challenge Statement")
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .font(.system(size: 24))
//                    .padding(.top, 40)
//                    .padding(.bottom, 10.0)
//                
//                
//                ZStack(alignment: .topLeading) {
//                    TextEditor(text: $viewModel.Investigate2)
//                        .padding(.vertical, 3)
//                        .padding(.horizontal, 5)
//                        .border(Color.black, width: 1)
//                        .multilineTextAlignment(.leading)
//                        .frame(height: 100)
//                        .lineLimit(5)
//                    
////                    if refinedChallenge.isEmpty {
////
////                        Text("Write your Refined Challenge here...")
////                            .foregroundColor(.gray)
////                            .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
////                    }
//                }
//                
//                
//                Spacer()
//                    .padding(.top, 40)
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        showAlert = true
//                        viewModel.saveToDatabase()
//                        investigation = viewModel.Investigate1
//                        refinedChallenge = viewModel.Investigate2
//                    }) {
//                        if investigation.isEmpty && refinedChallenge.isEmpty {
//                            Text("Done")
//                                .padding()
//                            
//                                .background(Color.green)
//                                .foregroundColor(.white)
//                                .font(.title3)
//                                .cornerRadius(10)
//                        } else {
//                            Text("Update")
//                                .padding()
//                                .background(Color.green)
//                                .foregroundColor(.white)
//                                .font(.title3)
//                                .cornerRadius(10)
//                        }
//                    }
//                }
//                Spacer()
//            }
//            .padding()
//            .alert(isPresented: $showAlert) {
//                Alert(title: Text("Congratulations!"),
//                      message: Text("Remember you can go back anytime to edit this milestone"),
//                      dismissButton: .default(Text("Dismiss")))
//            }
//            .sheet(isPresented: $showInformation) {
//                // Content of the pop-up view
//                investigationPopupView()
//            }
//        }
//        .onTapGesture {
//                hideKeyboard()
//        }
//    }
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
// }
//
// struct investigationPopupView: View {
//     var body: some View {
//         VStack(alignment: .center){
//             Image(systemName: "magnifyingglass")
//                             .font(.system(size: 60))
//                             .padding(.top, 60)
//         }
//         VStack(alignment: .leading) {
//             Text("Domain Investigation")
//                 .font(.headline)
//                 .padding(.horizontal, 20)
//                 .padding(.top, 40)
//
//             Text("This is a more thorough and polished exploration to develop your conceptual understanding and important factors in relation to your domain")
//                 .font(.subheadline)
//                 .padding(.horizontal, 20)
//                 .padding(.top, 4)
//                 .padding(.bottom, 4)
//             Divider()
//             Text("Refined Challenge Statement")
//                 .font(.headline)
//                 .padding(.horizontal, 20)
//                 .padding(.top, 4 )
//
//             Text("Based on your synthesis of ideas from your findings and original Challenge Statement form a refined Challenge Statement")
//                 .font(.subheadline)
//                 .padding(.horizontal, 20)
//                 .padding(.top, 4)
////             Text("Generating Guiding Questions")
////                 .font(.headline)
////                 .padding()
////                 .padding(.top, 60)
////
////             Text("Produce a number of questions related to your challenge and the various aspects you must explore and learn in order to achieve it")
////                 .font(.subheadline)
////                 .padding()
////                 .padding(.top, 10)
////
////             Text("Group, Refine & Prioritise")
////                 .font(.headline)
////                 .padding()
////                 .padding(.top, 60)
////
////             Text("Copy and paste all your questions onto a new page ")
////                 .font(.subheadline)
////                 .padding()
////                 .padding(.top, 10)
////
////             Text("Build Your Investigation Log")
////                 .font(.headline)
////                 .padding()
////
////             Text("Replicate all the cards you have generated, then move them to the activities log column to begin your investigation. Elaborate each card and record your findings inside them")
////                 .font(.subheadline)
////                 .padding()
//
//         }
//             .padding()
//             .background(Color.white)
//             .cornerRadius(10)
//         
//         Spacer()
//     }
// }
//
// struct investigationPage_Previews: PreviewProvider {
//     static var previews: some View {
//         investigationPage()
//     }
// }
