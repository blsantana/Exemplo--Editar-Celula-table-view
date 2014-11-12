//
//  ListaTableViewController.swift
//  ToDoList
//
//  Created by Bruno Santana on 27/10/14.
//  Copyright (c) 2014 SF. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource {

    
    var itens: [ItemLista] = []
    
    
    func carregarDadosIniciais(){
        
        var item1 = ItemLista(nome:"Estudar swift")
        
        itens.append(item1)
        
        var item2 = ItemLista(nome:"Estudar Inglês")
        
        itens.append(item2)

        
        var item3 = ItemLista(nome:"Desenvolver App")
        
        itens.append(item3)

        
    }
    
    @IBAction func voltaParaLista(segue:UIStoryboardSegue!){
        
        
        var sourceVC = segue.sourceViewController as AdicionarNovoItemViewController
        
        if let itemEditado = sourceVC.itemEditado{
            
            var itemIndex = self.tableView!.indexPathForSelectedRow()!.row
            self.itens[itemIndex] = itemEditado
            tableView.reloadData()
            sourceVC.itemEditado = nil
            
        }
        else if let item = sourceVC.novoItemDaLista{
            
            itens.append(item)
            
            tableView.reloadData()
            
            sourceVC.novoItemDaLista = nil
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.carregarDadosIniciais()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            // Delete the row from the data source
            
            itens.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
            
        } /*else if editingStyle == .Insert {
        
            
            
        }   */
        
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "EditItem" {
            var adicionarNovoItemViewController: AdicionarNovoItemViewController = segue.destinationViewController as AdicionarNovoItemViewController
        
            var itemIndex = self.tableView!.indexPathForSelectedRow()!.row
            var itemSelected = self.itens[itemIndex]
        
            adicionarNovoItemViewController.itemEditado = itemSelected
        }
       
        
        
    }

}
