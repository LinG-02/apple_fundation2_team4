//
//  SolutionPage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 8/6/2023.
//

import SwiftUI

struct PrototypePage: View {
    //     @State private var solution: String = ""
    //     @State private var appConcept: String = ""
    @State private var showAlert = false
    @State private var showInformation = false
    @StateObject private var viewModel = ViewModel()
    
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
      
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
                                    .padding(.horizontal, 20)
                            }
                            
                            Text("Prototype")
                                .font(.largeTitle)
                                //.fontWeight(.light)
                                .frame(maxWidth: .infinity, alignment: .center)
                                //.padding(.horizontal, 20)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                           
                        
                            
                        }
                        
                        
                        ScrollView{
                            
                            VStack {
                                Text("Congratulations!")
                                    .font(.system(size: 35))
//                                    .fontWeight(.light)
                                    .bold()
                                    .foregroundStyle(.yellow)

//                                  .shadow(color: Color(UIColor.label.withAlphaComponent(0.3)), /// shadow color
//                                            radius: 3, /// shadow radius
//                                            x: 0, /// x offset
//                                            y: 2 /// y offset
//                                        )
                                    .padding(.bottom)
                                
                                Text("You're almost done!")
                                    .font(.system(size: 25))
                                    .foregroundStyle(.green.gradient)
                                    .bold()
                                    .padding(.bottom)
                                
                                Text("Now, it's time for you to work on your prototype!!!")
                                    .bold()
                                    .padding(.horizontal)
                                
                                
                                VStack {
                                    Text("To prototype your App UI, there are some fantastic tools available that can assist you in the process. Some popular options include Keynote, Figma, and Apple Design Resources. Check them out by clicking the blue text!")
                                        .padding()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Link("Keynote", destination: URL(string: "https://www.apple.com/au/keynote/")!)
                                            .font(.headline)
                                        
                                        Image("keynotelogo")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        
                                        Spacer()
                                    }
                                    
                                    Text("Keynote is a powerful presentation software that allows users to create stunning and dynamic slideshows with rich media, interactive elements, and seamless animations.")
                                        .padding()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Link("Figma", destination: URL(string: "https://www.figma.com/?fuid=")!)
                                            .font(.headline)
                                        
                                        Image("figmalogo")
                                            .resizable()
                                            .frame(width: 22, height: 30)
                                        
                                        Spacer()
                                    }
                                    
                                    Text("Figma is a collaborative design tool that enables designers to create and share interactive prototypes, collaborate in real-time, and iterate on design concepts.")
                                        .padding()
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Link("Apple Design Resources", destination: URL(string: "https://developer.apple.com/design/resources/")!)
                                            .font(.headline)
                                        
                                        Image("Applelogo")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        
                                        Spacer()
                                    }
                                    
                                    Text("Design apps quickly and accurately by using Sketch, Photoshop, XD templates, guides, and other resources.")
                                        .padding()
                                    
                                    Text("After you've finished your prototype, come back and press the button below to complete your first App design journey")
                                        .bold()
                                        .padding()
                                    
                                    
                                    
                                    
//                                    HStack {
//                                        Spacer()
//
//                                        Button(action: {
//                                            showAlert = true
//                                        }) {
//                                            Text("Done")
//                                                .padding()
//                                                .background(Color.green)
//                                                .foregroundColor(.white)
//                                                .font(.title)
//                                                .cornerRadius(10)
//                                        }
                                    
                                }

                            }
                            
                        }
                                
                                
                              
                                    .padding(.top, 40)
                        

                                HStack {
                                    Spacer()

                                    Button(action: {
                                        showAlert = true
                                    }) {
                                        Text("Done")
                                            .padding()
                                            .background(Color.green.opacity(0.7))
                                            .foregroundColor(.white)
                                            .font(.title3)
                                            .cornerRadius(10)
                                    }
                                    .padding(.trailing)
                                }
                                
                            
                        }
                        
                        

                    }

                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Congratulations!🎉"),
                              message: Text("Congratulations on completing the app design! You've successfully crafted a visually appealing and user-friendly interface. Fantastic work!"),
                              dismissButton: .default(Text("Well Done!")))
                    }
                    
                }
            .navigationBarBackButtonHidden(true)
            
//            .padding()


        }
        
        
        
    }
    
    struct PrototypePage_Previews: PreviewProvider {
        static var previews: some View {
            PrototypePage()
        }
    }
    
    
    
    


