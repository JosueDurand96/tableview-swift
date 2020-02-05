//
//  ViewController.swift
//  Tableview ejemplo
//
//  Created by Josue Durand on 2/4/20.
//  Copyright © 2020 Josue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var title_label: UILabel!
    var miview2 = UIView()
    @IBOutlet weak var miview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title_label.text = "Josue Durand"
        let miframe = CGRect(x: 0, y: 0, width: 360, height: 54)
        miview2 = UIView(frame: miframe)
        miview2.backgroundColor = UIColor.blue
    }
    


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let seccion = indexPath.section
        print("row: ",row,"seccion: ",seccion)
        
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda1", for: indexPath)
        celda.textLabel?.text = "Titulo \(row) - \(seccion) "
        return celda
    }
    
  //  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->String? {
  //      return "titulo"
  //  }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)->UIView? {
        
        
        
        return miview2
    }
}
