//
//  commentView.swift
//  coolapp
//
//  Created by sniper1239408 on 22/06/24.
//

import SwiftUI
import AVFoundation

struct commentView: View {
    @State private var username = ""
    @State private var pswd = ""
    @State private var cmt = ""
    @State private var per = ""
    @State private var lvlid1 = ""
    @State private var alrt = false
    let synthesizer = AVSpeechSynthesizer()
    var body: some View {
        Text("Comment on GD level (dosent work)")
            .frame(width: nil)
            .font(.largeTitle)
            .padding()
        Text("i gave up on this cause its way too hard but here are the remnants")
        
        VStack {
            Text("Login")
            TextField("Username", text: $username)
            SecureField("Password", text: $pswd)
        }
        .padding()
        VStack {
            Text("Comment")
            TextField("Level ID", text: $lvlid1)
            TextField("Type your comment here", text: $cmt)
            TextField("Set percentage (leave blank for 0%)", text: $per)
            Button("Send comment"){
                let utterance = AVSpeechUtterance(string: "You know that i'm not working, so why did you click me?")
                utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                synthesizer.speak(utterance)
                alrt = true
            }
            .padding(.all, 8.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            .alert("You know that i'm not working, so why did you click me?", isPresented:$alrt) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
}
#Preview {
    commentView()
}
