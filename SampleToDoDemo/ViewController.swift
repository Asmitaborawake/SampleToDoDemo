//
//  ViewController.swift
//  SampleToDoDemo
//
//  Created by asmita.borawake on 06/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit

var todoItem : [ToDoItemModelView] = []
class ViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todoItem = [ToDoItemModelView(id: "1", image: "child-selected", title: "Meet Friends", date: dateFromString(date: "2018-07-19")!),ToDoItemModelView(id: "2", image: "shopping-cart-selected", title: "Go To Shoping", date: dateFromString(date: "2018-08-10")!),ToDoItemModelView(id: "3", image: "phone-selected", title: "Call Friends", date: dateFromString(date: "2018-10-19")!),ToDoItemModelView(id: "4", image: "travel-selected", title: "Go To Road Trip", date: dateFromString(date: "2018-11-09")!)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        toDoTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTodo"{
            let vc = segue.destination as! DetailViewController
            let indexPath = toDoTableView.indexPathForSelectedRow
            if let indexPath = indexPath {
                vc.todo = todoItem[(indexPath as NSIndexPath).row]
            }
            
        }
    }


}
extension ViewController: UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todoItem.count != 0{
            return todoItem.count
        }else {
            let msgLbl = UILabel()
            messageLbl(messageLbl: msgLbl, frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), text: "No data currently avilable", textColor: .black, numberOfLines: 0, textAlignment: .center, font: UIFont(name:"Palatino-Italic", size: 20)!)
            self.toDoTableView.backgroundView = msgLbl
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoCell
        
        let toDodataObject = todoItem[indexPath.row]
        cell.toDoImage.image = UIImage(named: toDodataObject.image)
        cell.toDoTitle.text = toDodataObject.title
        cell.toDoDate.text = stringFromDate(date: toDodataObject.date)
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    //edit mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        toDoTableView.setEditing(editing, animated: true)
    }
    
    //delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todoItem.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    //move cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todoItem.remove(at: (sourceIndexPath as NSIndexPath).row)
        todoItem.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
        
    }
    
   
    

}

