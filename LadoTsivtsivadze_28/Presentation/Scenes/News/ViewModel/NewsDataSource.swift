//
//  NewsDataSource.swift
//  LadoTsivtsivadze_28
//
//  Created by Ladolado3911 on 6/8/21.
//

import Foundation
import UIKit



class NewsDataSource: TableDataSource {
    
    var tableView: UITableView!
    var viewModel: NewsViewModelProtocol!
    var data: [NewsModel] = []
    
    init(tableview tableView: UITableView, viewModel viewmodel: NewsViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.viewModel = viewmodel
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "NewsCell")
    }
    
    func loadData() {
        viewModel.fetchData { (newsModelArr) in
            self.data = newsModelArr
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
        cell!.configure(object: data[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.width * 0.35
    }
}
