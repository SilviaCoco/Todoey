//
//  ViewController.swift
//  Todoey
//
//  Created by Silvia Susini on 27/12/2018.
//  Copyright © 2018 Silvia Susini. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike","Buy Eggs","Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
   
//MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
//        print(itemArray[indexPath.row])

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



