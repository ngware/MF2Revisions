//
//  HomeView.swift
//  MF2Revisions
//
//  Created by Nicolas Guyot on 15/07/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack {
                    Header()
    //                    .border(.green)
                    CategoriesBrowser()
    //                    .border(.red)
                    
                    Spacer()
                }
            }
            .background(Color(hex: "f8f9fb"))
        }
        }
        
}



struct CategoriesBrowser: View {
    
    var body: some View {
        Text("Choisir une catégorie")
            .font(.custom("Arial Rounded MT Bold", fixedSize: 30))
        HStack {
            CategoryCard(color: "ffffff", categoryName: "Réglementation", image: "book.pages")
            CategoryCard(color: "ffffff", categoryName: "Décompression", image: "rectangle.compress.vertical") // lungs
        }
        HStack {
            CategoryCard(color: "ffffff", categoryName: "Anatomie  Physiologie", image: "lungs")
            CategoryCard(color: "ffffff", categoryName: "Aspects Théoriques", image: "books.vertical")
        }
    }
}

struct Header: View {
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Text("Révisions Théoriques")
                        .font(.custom(
                                "Arial Rounded MT Bold",
                                fixedSize: 24))
                        
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                HStack {
                    Text("MF2")
                        .font(.custom(
                                "Arial Rounded MT Bold",
                                fixedSize: 36))
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                }
                
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    NavigationLink(destination: QuestionsView()) {
                        ScrollCard(color: "fe6f5f", headline: "Aléatoires", title: "Questions")
                        }
                    
                        
                    ScrollCard(color: "3f98fc", headline: "Inédites", title: "Questions")
                     
                    ScrollCard(color: "5ad560", headline: "Difficiles", title: "Questions")
                        
                }.padding()
            }
//            .padding()
            
        }
    }
}

struct CategoryCard: View {
    
    var color: String
    var categoryName: String
    var image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: color))
            
            
            VStack {
                Spacer()
                Image(systemName: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    Text(categoryName)
                        .font(.custom(
                                "Arial Rounded MT Bold",
                                fixedSize: 18))
                        .foregroundStyle(.black)
                }
            }
            .padding()
        }
        .frame(width: 170, height: 200)
    }
}

struct ScrollCard: View {
    
    var color: String
    var headline : String
    var title : String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: color))
            
                
            VStack {
                HStack {
                    Text(title)
                        .font(.custom(
                                "Arial Rounded MT Bold",
                                fixedSize: 26))
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                }
                HStack {
                    Text(headline)
                        .font(.custom(
                                "Arial Rounded MT Bold",
                                fixedSize: 24))
                        .foregroundStyle(.white)
                        Spacer()
                }
                
            }
            .padding()
        }
        .frame(width: 170, height: 200)
    }
}

#Preview {
    HomeView()
}
