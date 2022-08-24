//
//  ViewController.swift
//  0823-CoreData-ToDoListApp
//
//  Created by minsson on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getAllItems() {
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest())
        } catch {
            print(error)
        }
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

