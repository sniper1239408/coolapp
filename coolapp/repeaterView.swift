//
//  repeaterView.swift
//  coolapp
//
//  Created by sniper1239408 on 22/06/24.
//

import SwiftUI
import AVFoundation

struct repeaterView: View {
    @State private var word = ""
    @State private var times = 1
    @State private var speaking = false
    @State private var startstop = "Start"
    @State private var sscolor = Color(.green)
    @State private var isPresented = false
    let synthesizer = AVSpeechSynthesizer()
    func repeat1() {
        var repeater = ""
        for _ in 1...times {
            repeater = repeater + word + " "
        }
        let utterance = AVSpeechUtterance(string: repeater)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
        
    }
    var body: some View {
        VStack {
            Text("Siri saying Practice")
                .frame(width: nil)
            .font(.largeTitle)
            Text("Make siri repeat something as many times as you want!")
                        .font(.subheadline)
        }
        
        VStack {
            Text("Word")
                .alert("Please enter text", isPresented: $isPresented) {
                    Button("OK", role: .cancel) { }
                }
            TextField("Enter word/sentence here", text:$word)
        }
        .padding()
        VStack {
            Text("How many times")
            Stepper(value: $times, in:1...99999) {
                Text(String(times))
            }
        }
        .padding()
        Button(startstop) {
            if word == "" {
                speaking = false
                sscolor = Color(.green)
                startstop = "Start"
                synthesizer.stopSpeaking(at: .immediate)
                isPresented = true
            }
            else if speaking == false {
                speaking = true
                sscolor = Color(.red)
                startstop = "Stop"
                repeat1()
            }
            else {
                speaking = false
                sscolor = Color(.green)
                startstop = "Start"
                synthesizer.stopSpeaking(at: .immediate)
            }
        }
        .padding(.all, 8.0)
        .background(sscolor)
        .foregroundColor(.black)
        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    repeaterView()
}
