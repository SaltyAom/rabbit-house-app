//
//  RabbitHouseView.swift
//  rehello
//
//  Created by saltyaom on 26/2/2565 BE.
//

import SwiftUI

struct RabbitHouseView: View {
    @EnvironmentObject
    var language: Language

    @State
    private var rabbitHouse: RabbitHouse? = nil

    @State
    private var menuTypes: [String] = []
    
    @State
    private var success: Bool? = nil

    func loadRabbitHouse() async {
        if(rabbitHouse != nil) {
            return
        }

        success = nil

        do {
            let url = URL(string: "https://is-the-order-a-rabbit-api.onrender.com")!

            let (data, _) = try await URLSession.shared.data(from: url)

            let rabbitHouseData = try JSONDecoder().decode(RabbitHouse.self, from: data)

            rabbitHouse = rabbitHouseData

            menuTypes = Mirror(reflecting: rabbitHouseData)
                .children.map { v in rabbitHouseData.formatKey(v.label.unsafelyUnwrapped)
                }

            success = true
        } catch {
            success = false
        }
    }


    var body: some View {
        NavigationView {
            VStack {
                if success == nil {
                    ZStack {
                        List {
                            Section(header: Text("Table of Content")) {
                                HStack {
                                    Spacer()
                                    ProgressView()
                                    Spacer()
                                }
                                .frame(height: 224)
                            }
                        }
                    }
                } else if(!success.unsafelyUnwrapped) {
                    Text("Can't connect to Rabbit House")
                        .font(.system(size: 21))
                    Spacer()
                        .frame(height: 12)
                    Text("Check your internet connection and try again")
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                    Spacer()
                        .frame(height: 36)
                    Button("Reload") {
                        Task {
                            await loadRabbitHouse()
                        }
                    }
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 36)
                    .background(.blue)
                    .cornerRadius(8)
                } else {
                    List {
                        Section(header: Text("Table of Content")) {
                            ForEach(menuTypes, id: \.self) { type in
                                NavigationLink(destination: MenuView(title: type.capitalized, menus: rabbitHouse!.byKey(type))) {
                                    Text(type.capitalized)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        
                        ForEach(menuTypes, id: \.self) { type in
                            Section(header: Text(type.capitalized)) {
                                ForEach(rabbitHouse!.byKey(type), id: \.name.en) { menu in
                                    MenuItem(menu)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Rabbit House"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Picker("Hi", selection: $language.value) {
                        ForEach(languages, id: \.self) { lang in
                            Text(lang)
                        }
                    }
                }
            }
        }
        .task {
            await loadRabbitHouse()
        }
    }
}

struct RabbitHouseView_Previews: PreviewProvider {
    static var previews: some View {
        RabbitHouseView()
    }
}
