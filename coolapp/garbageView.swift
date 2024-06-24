//
//  garbageView.swift
//  coolapp
//
//  Created by sniper1229408 on 22/06/24.
//

import SwiftUI
import AVFoundation

struct garbageView: View {
    @State private var othertext = 1
    @State private var image = "gd_cringe"
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPresented = false
    let synthesizer = AVSpeechSynthesizer()
    func speak(text:String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
        func changeimage() {
            if image == "gd_cringe" {
                image = "normal-difficulty-geometry-dash"
            }
            else {
                image = "gd_cringe"
            }
            if let path = Bundle.main.path(forResource: "fireinthehole", ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                } catch {
                    print("Couldn't load file")
                }
            } else {
                print("cannot find file")
            }
        }
    var body: some View {
        Text("My first SwiftUI App")
                            .frame(width: nil)
                            .font(.largeTitle)
                            .padding()
                            
                        Menu("Click to Select Options") {
                            Text("the 1st item")
                            Text("Menu Item 2")
                            Text("Menu Item 3")
                        }
                        .padding()
                        Button("Click to advance number by 1") {
                            othertext = othertext + 1
                            speak(text:String(othertext))
                        }
                        .padding(.all, 8.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                        Text("some random text to please your day. thank you and fire in DA hole!!! \(String(othertext))")
            .onTapGesture {
                speak(text:"you click here so i say fire in da haul")
                    isPresented = true
            }
                            .multilineTextAlignment(.center)
                            .padding()
                            .alert("you click here so i say fire in the hole", isPresented: $isPresented){
                                Button("OK", role: .cancel) { }
                            }
                        Image(image)
                            .resizable(capInsets: EdgeInsets(top: 10.0, leading: 10.0, bottom: 10, trailing: 0.0))
                            .frame(width: 500, height: 150)
                            .onTapGesture{
                                changeimage()
                            }
                            .padding()
                        Text("Click to change image")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
    }
}

#Preview {
    garbageView()
}
