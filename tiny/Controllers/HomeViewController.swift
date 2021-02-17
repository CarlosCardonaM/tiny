//
//  HomeViewController.swift
//  tiny
//
//  Created by Carlos Cardona on 16/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    var totalSavedView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5187298059, green: 0.3666914701, blue: 0.7601551414, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    var totalAhorradoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Total ahorrado hoy:"
        label.textAlignment = .left
        label.font = label.font.withSize(25)
        return label
    }()
    
    var ahorradoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "$133.47"
        label.textAlignment = .left
        label.font = label.font.withSize(58)
        return label
    }()
    
    var gastosTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Gastos"
        label.textAlignment = .left
//        label.font = label.font.withSize(25)
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    var gastosTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "gastosCell")
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        gastosTableView.delegate = self
        gastosTableView.dataSource = self
        addSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.heigth)
        scrollView.contentSize = CGSize(width: view.width, height: gastosTableView.bottom + 20)
        
        totalSavedView.frame = CGRect(x: 10, y: 40, width: view.width - 20, height: 149)
        
        totalAhorradoLabel.frame = CGRect(x: 20, y: 20, width: view.width - 40, height: 30)
        ahorradoLabel.frame = CGRect(x: 20, y: totalAhorradoLabel.bottom + 10, width: view.width - 40, height: 70)
        
        gastosTitleLabel.frame = CGRect(x: 10, y: totalSavedView.bottom + 50, width: view.width - 20, height: 41)
        
        gastosTableView.frame = CGRect(x: 0, y: gastosTitleLabel.bottom + 20, width: view.width, height: 240)
    }
    
    func addSubviews() {
        
        // Default View
        view.addSubview(scrollView)
        
        // ScrollView
        scrollView.addSubview(totalSavedView)
        scrollView.addSubview(gastosTableView)
        scrollView.addSubview(gastosTitleLabel)
        scrollView.addSubview(gastosTableView)
        
        // Total Saved View
        totalSavedView.addSubview(totalAhorradoLabel)
        totalSavedView.addSubview(ahorradoLabel)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "gastosCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "gastosCell")
        
        let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label.text = "$1.33"
        label.textAlignment = .right
        label.textColor = .secondaryLabel
        
        
        cell.accessoryView = label
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "$15.94"
        
        
        cell.textLabel?.text = "Cine"
        return cell
    }
    
}
