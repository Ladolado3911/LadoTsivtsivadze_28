//
//  ViewController.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import UIKit

class NewsController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    private var newsManager: DataDistributor!
    private var viewModel: NewsViewModelProtocol!
    private var dataSource: NewsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()


        
    }
    
    func configViewModel() {
        newsManager = DataDistributor.shared
        viewModel = NewsViewModel(newsManager: newsManager)
        dataSource = NewsDataSource(tableview: tblView, viewModel: viewModel)
        
        dataSource.loadData()
    }
}

