//
//  AdicionarNovoItemViewController.swift
//  ToDoList
//
//  Created by Bruno Santana on 27/10/14.
//  Copyright (c) 2014 SF. All rights reserved.
//

import UIKit

class AdicionarNovoItemViewController: UIViewController {
    
    
    var novoItemDaLista: ItemLista?
    
    var itemEditado : ItemLista?

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textField.text = self.itemEditado?.nome
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        
        if let button = sender as? UIBarButtonItem{
            
            if button != doneButton{
                
                return
                
            }
            
        }
        
        if !textField.text.isEmpty{
            
            if var item = self.itemEditado{
               item.nome = textField.text
            }
            
            novoItemDaLista = ItemLista(nome: textField.text)
           
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
    }
    

}
