//
//  ViewController.swift
//  sqlite ejemplo
//
//  Created by Josue Durand on 2/4/20.
//  Copyright © 2020 Josue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultadoEquipos = [[String:String]]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Conexion
        //DataBase.checkAndCreateDatabase(withName: "futbbol.db")
        //leer tablas
        resultadoEquipos = DataBase().ejecutarSelect("select * from Jugadores") as! [[String:String]]
        
        let nombre_equipo = resultadoEquipos[0]["nombre_jugador"]
        print(nombre_equipo)
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultadoEquipos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda1", for: indexPath)
        let nombreEquipo = resultadoEquipos[indexPath.row]["nombre_jugador"]
        celda.textLabel?.text = nombreEquipo
        return celda
    }
    
    
}
