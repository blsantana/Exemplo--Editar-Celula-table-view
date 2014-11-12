//
//  ItemLista.swift
//  ToDoList
//
//  Created by Bruno Santana on 03/11/14.
//  Copyright (c) 2014 SF. All rights reserved.
//

import Foundation


class ItemLista{
    
    var nome:String
    
    
    init(nome: String){
        
        self.nome = nome
        
        
    }
    
    deinit{
        println("Deinitialization")
    }
    
    
}