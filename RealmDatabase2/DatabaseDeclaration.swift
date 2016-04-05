//
//  DatabaseDeclaration.swift
//  RealmDatabase2
//
//  Created by Dmytro on 4/3/16.
//  Copyright © 2016 Dmytro. All rights reserved.
//

import Foundation
import RealmSwift




class IngredientsDatabase: Object {             //Class of Ingredient
    dynamic var id :String = ""                 //ID - Primary Key
    dynamic var name :String = ""               //Name of Ingredient
    dynamic var image :String = ""              //URL of image
    dynamic var units :String = ""              //Units of Ingredient
    dynamic var minimalPortionAmount :Int = 0   //Minimal units per portion
    dynamic var caloriesPerPortion :Int = 0     //Callories per portion
    dynamic var priceCountable :Bool = true     //If price of produc countable in whole price
    let packagePrices = List<PackagePricing>()  //Different packages and prices array
    
    required init() {                           //Genering of unique ID
    id = NSUUID().UUIDString
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class PackagePricing: Object {                  //Different packages of Ingredient
    dynamic var amountOfPackage :Int = 0        //Amount of units in package
    dynamic var price: Double = 0               //Price of current pacakge
}



class RecipesDatabase: Object {                         //Database of recipes
    dynamic var id :String = ""                         //ID - Primary Key
    dynamic var name :String = ""                       //Name of recipe
    dynamic var image :String = ""                      //URL of image
    dynamic var caloriesPerPortion :Int = 0             //Calories per portion
    dynamic var pricePerPortion :Double = 0             //Price per portion
    dynamic var pricePerCalory :Double = 0              //Price per calory
    let ingredientsList = List<IngredientsList>()   //Array of Ingredients
    let recipeDescription = List<RecipeDescription>()   //Array of Steps
    let recipeTags = List<RecipesTags>()                //Array of Tags
    
    
    required init() {                                   //Genering of unique ID
        id = NSUUID().UUIDString
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class IngredientsList: Object {
    dynamic var ingredient : IngredientsDatabase?
    dynamic var amountOfIngredient :Int = 0
    
}

class RecipeDescription: Object {               //Descriprion of receipe
    dynamic var steps :String = ""              //Text Description in steps
}

enum RecipesTagsEnum :String{                   //Emumeration of Tags
case tag1 = "Первое блюдо"
case tag2 = "Второе блюдо"
case tag3 = "Блюда из курицы"
}

class RecipesTags: Object{ //Tags array
    dynamic var tags: Int = -1
}


