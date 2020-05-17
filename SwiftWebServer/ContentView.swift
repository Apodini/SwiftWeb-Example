//
//  ContentView.swift
//  SwiftWebServer
//
//  Created by Quirin Schweigert on 03.01.20.
//  Copyright © 2020 Quirin Schweigert. All rights reserved.
//

import Foundation
import SwiftWeb

struct ContentView: View {
//    @State var sliderValueA: Double = 0.2
//    @State var sliderValueB: Double = 0.5

    var body: some View {
        TabView(selection: 1) {
            AllAccountsView()
                .tabItem {
                    Text("Accounts")
                    Image("rectangle.stack.png")
            }

            AllTransactionsView()
            .tabItem {
                Text("Transactions")
                Image("list.dash.png")
            }
        }



//        VStack(spacing: 20) {
//            Text(String(sliderValueA))
//            Text(String(sliderValueB))
//            Slider(value: $sliderValueA)
//            Slider(value: $sliderValueB)
//        }
//            .padding()
    }
}

//struct ContentView: View {
//    var body: some View {
////        HStack(spacing: 20) {
////            Image("quirin.jpeg")
////                .resizable()
////                .frame(width: 100, height: 100)
////                .cornerRadius(100)
////
////            VStack(alignment: .leading, spacing: 5) {
////                Text("Quirin Schweigert")
////                    .font(.title)
////
////                Text("Author of the SwiftWeb Framework")
////                    .font(.subheadline)
////            }
////        }
////            .padding(20)
////            .background(Color(white: 0.95))
////            .cornerRadius(10)
////            .shadow(radius: 10)
////            .padding(50)
//        
//
////            NestedStateView()
////                .padding(60)
//
//        StackTest()
//    }
//}

struct StackTest: View { // set of growing axes at each level:
    var body: some View {
        HStack {                             // [vertical, horizontal]
            VStack {                         // [vertical, horizontal]
                Text("Hello, World!")        // []
                Spacer()                     // [undetermined]
                    .padding()               // [undetermined]
                    .border(Color.red)       // [undetermined]
                    .padding()               // [undetermined]
                    .border(Color.blue)      // [undetermined]
                
                HStack {                     // [horizontal]
                    Spacer()             // [undetermined]
                        .padding()           // [undetermined]
                        .border(Color.green) // [undetermined]
                }
            }
                .border(Color.gray)              // [vertical, horizontal]
        }
    }
}

struct CircleImage: View {
    var body: some View {
        Image("turtlerock.jpg")
        .resizable()
        .frame(width: 250, height: 250)
        .cornerRadius(125)
        .border(.white, width: 4)
        .shadow(radius: 20)
    }
}

struct NestedStateView: View {
    @State var isDarkModeEnabled = false
    
    var body: some View {
        VStack {
            Counter()
            
            Button("Toggle Dark Mode") {
                self.isDarkModeEnabled = !self.isDarkModeEnabled
            }
        }
            .background(isDarkModeEnabled ? Color.black : Color.white)
    }
}

struct Counter: View {
    @State var counter = 0

    func action() {
        counter += 1
    }

    var body: some View {
        Button(action: action, label: {
            Text(String(describing: counter))
        })
    }
}


//struct Main: View {
//    @State var counter = 0
//
//    var body: some View {
//        VStack {
//            Text("🥑🍞 #\(counter)")
//                .padding(.all)
//                .background(.green, cornerRadius: 12)
//                .foregroundColor(.white)
//                .onTapGesture {
//                    counter += 1
//            }
//        }
//    }
//}
