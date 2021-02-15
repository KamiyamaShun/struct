//
//  ViewController.swift
//  struct
//
//  Created by 神山駿 on 2021/02/11.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SetOkDelogate {

    @IBOutlet weak var tableView: UITableView!
    
    var person = Person()
    var personArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let userNameLabel = cell.contentView.viewWithTag(1)as! UILabel
        userNameLabel.text = personArray[indexPath.row].name
        
        let favorite = cell.contentView.viewWithTag(2)as! UILabel
        favorite.text = personArray[indexPath.row].favorite
        
        let movie = cell.contentView.viewWithTag(3)as! UILabel
        movie.text = personArray[indexPath.row].movie
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }

    @IBAction func favbutton(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    func setOk(check: Person) {
        personArray.append(check)
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.setOkDelogate = self
        }
    }
}

