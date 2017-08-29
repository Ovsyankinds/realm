//
//  ViewController.swift
//  myRealm
//
//  Created by Ovsyankinds on 8/29/17.
//  Copyright © 2017 Ovsyankinds. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    
    @IBAction func add(){
    
        var myModel = Model()
        myModel.name = text.text!
        
        let realm = try! Realm()

        
        try! realm.write {
            realm.add(myModel)
        }

        
    }
    
    @IBAction func show(){
        let realm = try! Realm()
        let result = realm.objects(Model.self)
        
        for row in result{
            print(row.name)
        }
        //print(result[0].name)
        
    }
    
    //let realm = try! Realm()
    var result: Results<Model>?
    
    
    override func viewDidLoad() {
        
        result = try! Realm().objects(Model.self)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource{
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = result?[indexPath.row].name
        return cell
    }
}









