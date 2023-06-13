//
//  SolutionPage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 8/6/2023.
//

import SwiftUI

struct SolutionPage: View {
//     @State private var solution: String = ""
//     @State private var appConcept: String = ""
    @State private var showAlert = false
    @State private var showInformation = false
    @StateObject private var viewModel = ViewModel()
    @AppStorage("solution") private var solution = ""
    @AppStorage("appConcept") private var appConcept = ""
    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
    

    
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
                                         }
                         
                         Spacer()

                         Text("Solution")
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

                     Text("Write your solution concept")
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .font(.system(size: 24))
                         .padding(.top, 40)
                         .padding(.bottom, 10.0)

                     ZStack(alignment: .topLeading) {
                         TextEditor(text: $viewModel.Solution1)
                             .padding(.vertical, 3)
                             .padding(.horizontal, 5)
                             .border(Color.black, width: 1)
                             .multilineTextAlignment(.leading)
                             .frame(height: 100)
                             .lineLimit(5)

//                         if solution.isEmpty {
//
//                             Text("Write your Solution Idea here...")
//                                 .foregroundColor(.gray)
//                                 .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
//                         }
                     }



                     Text("Write your App Concept")
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .font(.system(size: 24))
                         .padding(.top, 80)
                         .padding(.bottom, 10.0)


                     ZStack(alignment: .topLeading) {
                         TextEditor(text: $viewModel.Solution2)
                             .padding(.vertical, 3)
                             .padding(.horizontal, 5)
                             .border(Color.black, width: 1)
                             .multilineTextAlignment(.leading)
                             .frame(height: 100)
                             .lineLimit(5)

                         if appConcept.isEmpty {

                             Text("Write your App Concept here...")
                                 .foregroundColor(.gray)
                                 .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                         }
                     }


                     Spacer()
                         .padding(.top, 40)
                     HStack {
                         Spacer()
                         Button(action: {
                             showAlert = true
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
                     SolutionPagePopupView()
                 }
             }

         }
         .padding()
         .alert(isPresented: $showAlert) {
             Alert(title: Text("Congratulations!"),
                   message: Text("Remeber you can go back anytime to edit this milestone"),
                   dismissButton: .default(Text("Dismiss")))
         }
         .sheet(isPresented: $showInformation) {
             // Content of the pop-up view
             SolutionPagePopupView()
         }
    }
 }

 struct SolutionPagePopupView: View {
     var body: some View {
             ScrollView {
                 VStack {
                     Text("Solution")
                         .font(.title)
                         .bold()
                         .padding()
                     
                     VStack(alignment: .leading) { // Align VStack content to the leading edge (left)
                         Group {
                             Text("Solution Concept")
                                 .font(.system(size: 20))
                                 .bold()

                             
                             Text("In app design, the solution concept refers to the high-level approach and strategy that addresses the problem or need the app is intended to solve. It outlines the goals, features, functionality, and user experience considerations that form the foundation of the app's design and development.")
                                 .font(.system(size: 16))

                             
                             Text("Generating your solution concepts")
                                 .font(.system(size: 17))
                                 .bold()
                             
                             Text("You can use LOTUS BLOSSOM to help generate your solution concepts. \n\nLOTUS BLOSSOM is a technique that facilitates the generation of solution concepts by continuously expanding and refining initial ideas. It enables the generation of a large number of ideas within a short timeframe.")
                                 .font(.system(size: 16))
                                                     
                             Image("lotusBlossomImage")
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)

                             
                             Text("Here's a simplified breakdown of the steps:")
                                 .font(.system(size: 16))

                             
                             Text("STEP 1: Write the Opportunity Statement or Challenge in the center of the table using a grey post-it note.")
                                 .font(.system(size: 16))

                             
                             Text("STEP 2: Conduct the first round of ideation by generating 8 unique Solution Concepts on post-it notes surrounding the grey central note. These ideas can be in the form of written statements, drawings, or a combination. The goal is to generate 8 distinct ideas based on the Problem Statement.")
                                 .font(.system(size: 16))

                             Text("STEP 3: Proceed to the second round of ideation by creating 8 new Solution Concepts. Each new concept should stem from one of the 8 initial Solution Concepts generated in step 2. In this step, you have the freedom to expand upon, adapt, modify, or draw inspiration from the original ideas to create the new concepts.")
                                 .font(.system(size: 16))

                             
                             Text("Now, pick one or two from your listed solution concepts as your final Solution Concept")
                                 .font(.system(size: 16))
                                 .bold()
                             }
                         .padding(.horizontal, 10)
                         .padding(.bottom,20)
                         
                         Divider()
                         Group {
                             Text("App Concept")
                                 .font(.system(size: 20))
                                 .bold()
                             
                             Text("refers to the overall idea and vision for an application, encompassing the app statement, user stories, and sketches.")
                                 .font(.system(size: 16))
                                 
                             
                             Text("App Statement")
                                 .font(.system(size: 16))
                                 .bold()
                                 
                             
                             Text("An app definition statement is a concise, concrete declaration of an app's main purpose and its intended audience.")
                                 .font(.system(size: 16))
                                 
                             
                             Text("Write down your App Statement using the provided format below:")
                                 .font(.system(size: 16))
         
                             
                             Text("An app that helps [specific type of user] who wants to [do what] by [the app’s function]")
                                 .font(.system(size: 16))
                                 .foregroundColor(.secondary)
                                 .padding(.horizontal, 16)
                             
                             Text("An example:\n\nAn app that helps mentors who wants to remember their Learners and teams by providing list and detailed information.")
                                 .font(.system(size: 16))
                             
                         }
                         .padding(.horizontal, 10)
                         .padding(.bottom,20)
                             
                             Group{
                                 Text("User Stories")
                                     .font(.system(size: 16))
                                     .bold()
                                     .padding(.top,25)
         
                                 
                                 Text("In this step makes it more specific.")
                                     .font(.system(size: 16))
                                     
                                 
                                 Text("Write down your App Statement using the provided format below:")
                                     .font(.system(size: 16))
                                 
                                 
                                 Text("As [user] I want to [do what- the functions/features your app can provide]")
                                     .font(.system(size: 16))
                                     .foregroundColor(.secondary)
                                     .padding(.horizontal, 16)
                                     .padding(.bottom, 8)
                                 
                                 Text("Examples:\n\nAs mentor I want to browse the learner list.")
                                     .font(.system(size: 16))
                                     
                                 
                                 Text("As mentor I want to check every learner details info.")
                                     .font(.system(size: 16))

                             }
                             .padding(.horizontal, 10)
                             .padding(.bottom,20)
                         }
                         
                         Spacer()
                     }
                     .frame(maxWidth: .infinity, alignment: .leading) // Set frame alignment to leading edge
                     
                 }
             }
         
 }

 struct SolutionPage_Previews: PreviewProvider {
     static var previews: some View {
         SolutionPage()
     }
 }


