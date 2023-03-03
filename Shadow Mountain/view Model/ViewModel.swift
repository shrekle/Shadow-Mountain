//
//  ViewModel.swift
//  CoffeeShop
//
//  Created by adrian garcia on 10/25/22.
//

import Foundation

class ViewModel: ObservableObject {

    @Published var menu = [Menu]()
    @Published var categories = Set<String>()
    @Published var currentCategory = [Menu]()
    @Published var specials = [Menu]()
    @Published var coffees = [Menu]()
    @Published var teasAndLemonades = [Menu]()
    @Published var EnergyDrinks = [Menu]()
    @Published var blendedDrinks = [Menu]()
    @Published var naturalLattes = [Menu]()
    @Published var specialtyDrinks = [Menu]()
    @Published var handmadeLiegeWaffles = [Menu]()
    @Published var biscuitsAndGravy = [Menu]()
    @Published var toasts = [Menu]()
    @Published var bagels = [Menu]()
    @Published var quesadillas = [Menu]()
    @Published var kidsCorners = [Menu]()

    init() {
       
    }
    
    //make this by alphabetical order
  
}
