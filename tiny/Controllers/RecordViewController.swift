//
//  RecordViewController.swift
//  tiny
//
//  Created by Carlos Cardona on 16/02/21.
//

import UIKit

class RecordViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    var totalSavedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.999961555, green: 0.7817113996, blue: 0.3707734346, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    var totalGastadoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Total gastado:"
        label.textAlignment = .left
        label.font = label.font.withSize(31)
        return label
    }()
    
    var totalAhorradoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Total ahorrado:"
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        return label
    }()
    
    var gastadoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "$169,372"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 52)
//        label.font = label.font.withSize(58)
        return label
    }()
    
    var ahorradoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "$5,081.16"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 52)
//        label.font = label.font.withSize(58)
        return label
    }()
    
    var datosLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Datos"
        label.textAlignment = .left
//        label.font = label.font.withSize(25)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    var datosTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "datosCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        datosTableView.delegate = self
        datosTableView.dataSource = self
        
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.heigth)
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth + 200)
        
        totalSavedView.frame = CGRect(x: 10, y: 40, width: view.width - 20, height: 336)
        
        totalGastadoLabel.frame = CGRect(x: 10, y: 20, width: view.width - 20, height: 43)
        gastadoLabel.frame = CGRect(x: 10, y: totalGastadoLabel.bottom, width: view.width - 20, height: 59)
        
        totalAhorradoLabel.frame = CGRect(x: 10, y: gastadoLabel.bottom + 50, width: view.width - 20, height: 43)
        ahorradoLabel.frame = CGRect(x: 10, y: totalAhorradoLabel.bottom, width: view.width - 20, height: 59)
        
        datosLabel.frame = CGRect(x: 10, y: totalSavedView.bottom + 40, width: view.width - 20, height: 41)
        
        datosTableView.frame = CGRect(x: 0, y: datosLabel.bottom + 20, width: view.width, height: 240)
        
    }
    
    func addSubviews() {
        
        // Default View
        view.addSubview(scrollView)
        
        // ScrollView
        scrollView.addSubview(totalSavedView)
        scrollView.addSubview(datosLabel)
        scrollView.addSubview(datosTableView)
        
        // Total Saved View
        totalSavedView.addSubview(totalGastadoLabel)
        totalSavedView.addSubview(gastadoLabel)
        
        totalSavedView.addSubview(totalAhorradoLabel)
        totalSavedView.addSubview(ahorradoLabel)
    }
}

extension RecordViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "datosCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "datosCell")
        
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "$1,668.00"
        label.textAlignment = .right
        label.textColor = .secondaryLabel
        
        cell.textLabel?.text = "Junio 2020"
        cell.detailTextLabel?.text = "$55,600"
        
        cell.accessoryView = label
        return cell
    }
    
    
}
