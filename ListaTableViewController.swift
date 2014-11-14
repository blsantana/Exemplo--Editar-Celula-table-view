//
//  ListaTableViewController.swift
//  ToDoList
//
//  Created by Bruno Santana on 27/10/14.
//  Copyright (c) 2014 SF. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource {

    
    // MARK: - Propriedades
    
    var itens: [ItemLista] = []
    
    
    
    // MARK: - Helper Methods
    
    func carregarDadosIniciais(){
        
        var item1 = ItemLista(nome:"Rever o feedback do Fabio :-)")
        
        itens.append(item1)
        
        
        var item2 = ItemLista(nome:"Estudar Inglês")
        
        itens.append(item2)

        
        var item3 = ItemLista(nome:"Desenvolver App")
        
        itens.append(item3)
        
        
        var item4 = ItemLista(nome:"Estudar Swift")
        itens.append(item4)

        
    }
    

    // MARK: - View Controller Lifecyvle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.carregarDadosIniciais()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
       
        return itens.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListaPrototypeCell", forIndexPath: indexPath) as UITableViewCell

        
        //NSIndexPath permite saber aonde está localizada a celula
        // Configure the cell...
        
        var itemDaLista = itens[indexPath.row]
        
        cell.textLabel.text = itemDaLista.nome
        

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
       
        if editingStyle == .Delete {
            
            itens.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
            
        }
        
        
    }
    

    // MARK: - Navigation

    // TODO: Apresentei uma alternativa para prepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditItem" {
            
             if let cell = sender as? UITableViewCell {
            
                
                    var indexPath = tableView.indexPathForCell(cell)
                
                    var adicionarNovoItemVC = segue.destinationViewController as AdicionarNovoItemViewController
                
                    if let ip = indexPath {
                
                        adicionarNovoItemVC.itemEditado = itens[ip.row]
                
                    }
               
                }
            
        }
        
    }
    
    
    
    @IBAction func voltaParaLista(segue:UIStoryboardSegue!){
        
        
        var sourceVC = segue.sourceViewController as AdicionarNovoItemViewController
        
        if let itemEditado = sourceVC.itemEditado{
            
            var itemIndex = self.tableView!.indexPathForSelectedRow()!.row
            
            itens[itemIndex] = itemEditado
            
        }
        else if let item = sourceVC.novoItemDaLista{
            
            itens.append(item)
            
        }
        
        tableView.reloadData()
        
    }

}
