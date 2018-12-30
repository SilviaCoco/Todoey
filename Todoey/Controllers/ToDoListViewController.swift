//
//  ViewController.swift
//  Todoey
//
//  Created by Silvia Susini on 27/12/2018.
//  Copyright © 2018 Silvia Susini. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadItems()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//MARK - Tableview Datasource Methods
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
//
//        cell.messageBody.text = messageArray[indexPath.row].messageBody
//        cell.senderUsername.text = messageArray[indexPath.row].sender
//        cell.avatarImageView.image = UIImage(named : "egg")
//
//        if cell.senderUsername.text == Auth.auth().currentUser?.email as String!
//        {
//            cell.avatarImageView.backgroundColor = UIColor.flatMint()
//            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
//        }
//        else{
//            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
//            cell.messageBackground.backgroundColor = UIColor.flatGray()
//        }
//        return cell
//    }
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
   
//MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
  
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
       
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
        //what will happen once the user clicks the Add Item button on our UIAlert
        let newItem = Item()
        newItem.title = textField.text!
        
        self.itemArray.append(newItem)
            
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
       
        alert.addAction(action)
       
        present(alert,animated: true, completion: nil)
    }
    
//MARK - Model Manipulation Method
    func saveItems(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch{
            print("Error encoding item array, \(error)")
        }
        self.tableView.reloadData()
    }
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!){
        let decoder = PropertyListDecoder()
        do{		
            itemArray = try decoder.decode([Item].self, from: data)
        }catch{
            print("Error decoding data \(error)")
            }
        }
    }
    
}



