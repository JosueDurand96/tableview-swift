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
        //resultadoEquipos = DataBase().ejecutarSelect("select * from Jugadores") as! [[String:String]]
        resultadoEquipos = DataBase().ejecutarSelect("select a.*, b.* from Jugadores a, Equipos b where a.id_equipo") as! [[String:String]]
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
        let nombreJugador = resultadoEquipos[indexPath.row]["nombre_jugador"]
        celda.textLabel?.text = nombreJugador
        
        let nombreArchivo = resultadoEquipos[indexPath.row]["foto_jugador"] ?? "avatar"
        celda.imageView?.image = UIImage(named: nombreArchivo)
        
        let nombreEquipo = resultadoEquipos[indexPath.row]["nombre_equipo"]
        celda.detailTextLabel?.text = nombreEquipo
        return celda
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nombreJugadorSeleccionado = resultadoEquipos[indexPath.row]["nombre_jugador"]
        print(nombreJugadorSeleccionado)
        
    }
    
}
