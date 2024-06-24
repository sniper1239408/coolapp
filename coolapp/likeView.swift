//
//  likeView.swift
//  coolapp
//
//  Created by sniper1239408 on 22/06/24.
//

import SwiftUI

struct likeView: View {
    @State private var dislike = false
    @State private var id = ""
    @State private var output = ""
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

#Preview {
    likeView()
}
