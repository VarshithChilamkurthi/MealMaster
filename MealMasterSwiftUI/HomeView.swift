//
//  ContentView.swift
//  MealMasterSwiftUI
//
//  Created by Varshith Chilamkurthi on 11/07/24.
//

import SwiftUI

struct HomeView: View {
    @State private var categoryUrl = ""
    @State private var searchText = ""
    @State private var categoryButtonValue = "Dessert"
    @State var categories: [FoodCategory] = []
    @State var desserts: [Dessert] = []
    
    let categoryViewModelObj = CategoryViewModel()
    let dessertsViewModelObj = DessertsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: Categories H-Scroll
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(categories.indices, id: \.self) { i in
                            VStack {
                                Button {
                                    categoryButtonValue = (categories[i].strCategory ?? "N/A")
                                    categoryUrl = Constants.emptyListUrl.rawValue + categoryButtonValue
                                    print(categoryUrl)
                                    Task {
                                        await fetchData(url: categoryUrl)
                                        if let desserts = dessertsViewModelObj.desserts {
                                            self.desserts = desserts
                                        }
                                    }
                                } label: {
                                    VStack {
                                        Image(categoryViewModelObj.categoryImages[i])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle()
                                                    .stroke(Color.black, lineWidth: 0.1)
                                                    .frame(width: 80)
                                            }
                                            .shadow(radius: 5)
                                        
                                        Text(categories[i].strCategory ?? "")
                                            .fontWeight(.semibold)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .frame(width: 80, height: 110)
                        }
                    }
                }.padding()
                // MARK: Selected title
                HStack {
                    Text(categoryButtonValue)
                        .font(.title)
                        .bold()
                    Spacer()
                }.padding(.top, 0).padding(.leading, 20).padding(.bottom, 20)
                // MARK: Desserts list
                VStack {
                    ForEach(desserts.indices, id: \.self) { i in
                        Button(action: {}, label: {
                            HStack {
                                AsyncImage(url: URL(string: desserts[i].strMealThumb ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 130, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 1)
                                        }
                                        .shadow(radius: 10)
                                        .padding(.leading, 20)
                                } placeholder: {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 130, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 1)
                                        }
                                        .shadow(radius: 10)
                                        .padding(.leading, 20)
                                }

                                Text(desserts[i].strMeal ?? "N/A")
                                    .bold()
                                    .font(.system(size: 22))
                                    .padding(.leading, 20)
                                    .lineLimit(2)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                        })
                    }
                }
                .onAppear {
                    Task {
                        await fetchCategoryNames()
                        if let categories = categoryViewModelObj.categories {
                            self.categories = categories
                        }
                        
                        await fetchData(url: Constants.defaultCategoryUrl.rawValue)
                        if let desserts = dessertsViewModelObj.desserts {
                            self.desserts = desserts
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText)
    }
}

extension HomeView {
    func fetchCategoryNames() async {
        do {
            try await categoryViewModelObj.fetchData(url: Constants.categoryListUrl.rawValue)
        } catch {
            print("fetch data error")
        }
    }
    
    func fetchData(url: String) async {
        do {
            try await dessertsViewModelObj.fetchData(url: url)
        } catch {
            print("fetch data error")
        }
    }
}

#Preview {
    HomeView()
}
