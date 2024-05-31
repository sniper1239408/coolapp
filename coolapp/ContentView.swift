//
//  ContentView.swift
//  coolapp
//
//  Created by sniper1239408 on 29/05/24.
//

import SwiftUI
import AVFoundation
import Foundation

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("some garbage") {
                    fire1()
                }
                NavigationLink("like/dislike GD level") {
                    likeLevel()
                }
                NavigationLink("Comment on gd level (non functional)") {
                    comment()
                }
                NavigationLink("Siri saying Practice") {
                    repeater()
                }
            }
            .navigationTitle("random app")
        }
    }
    }
struct fire1: View {
    @State var othertext = 1
    @State var image = "gd_cringe"
    @State var audioPlayer: AVAudioPlayer?
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
            }
                            .multilineTextAlignment(.center)
                            .padding()
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
struct likeLevel: View {
    @State var dislike = false
    @State var id = ""
    @State var output = ""
    func like() {
        let url = URL(string: "https://www.boomlings.com/database/likeGJItem211.php")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("", forHTTPHeaderField: "User-Agent")
        var currentlike = 0
        if dislike == false {
            currentlike = 1
        }
        else {
            currentlike = 0
        }
        let postString = "secret=Wmfd2893gb7&itemID=\(id)&type=1&like=\(String(currentlike))"
        print(postString)
        request.httpBody = postString.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No data")")
                return
            }
            if let responseText = String(data: data, encoding: .utf8) {
                output = responseText
                print(responseText)
            }
        }
        task.resume()
    }
    var body: some View {
        VStack {
            Text("Like/Dislike GD Level")
                .frame(width: nil)
                .font(.largeTitle)
            .padding()
            HStack {
                        TextField("Enter level ID", text: $id)
                        Button("Send request"){
                            like()
                        }
                        .padding(.all, 8.0)
                        .background(.green)
                        .foregroundColor(.black)
                        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    }
            Toggle(isOn: $dislike) {
                Text("Dislike Level")
            }
            Text(output)
        }
        .padding()
        
    }
}
struct comment: View {
    @State var username = ""
    @State var pswd = ""
    @State var cmt = ""
    @State var per = ""
    @State var lvlid1 = ""
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
            }
            .padding(.all, 8.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}
struct repeater: View {
    @State var word = ""
    @State var times = 1
    @State var speaking = false
    @State var startstop = "Start"
    @State var sscolor = Color(.green)
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
            if speaking == false {
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
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
