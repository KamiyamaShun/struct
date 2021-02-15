//
//  NextViewController.swift
//  struct
//
//  Created by 神山駿 on 2021/02/11.
//

import UIKit

protocol SetOkDelogate {
    func setOk(check: Person)
}

class NextViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var favoriteTextField: UITextField!
    
    @IBOutlet weak var movieTextField: UITextField!
    
    var person = Person()
    
    var setOkDelogate:SetOkDelogate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func submit(_ sender: Any) {
        person.name = nameTextField.text!
        person.favorite = favoriteTextField.text!
        person.movie = movieTextField.text!
        
        setOkDelogate?.setOk(check: person)
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
