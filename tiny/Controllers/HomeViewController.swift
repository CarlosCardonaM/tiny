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
        view.backgroundColor = UIColor.purple
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

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.width, height: view.heigth)
        scrollView.contentSize = CGSize(width: view.width, height: view.heigth + 500)
        
        totalSavedView.frame = CGRect(x: 10, y: 20, width: view.width - 20, height: 165)
        
        totalAhorradoLabel.frame = CGRect(x: 20, y: 20, width: view.width - 40, height: 30)
    }
    
    func addSubviews() {
        
        // Default View
        view.addSubview(scrollView)
        
        // ScrollView
        scrollView.addSubview(totalSavedView)
        
        // Total Saved View
        totalSavedView.addSubview(totalAhorradoLabel)
    }

}
