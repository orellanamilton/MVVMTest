//
//  ViewController.swift
//  MVVMTest
//
//  Created by Milton Orellana on 26/05/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    var subscriptions = [AnyCancellable]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.didUpdate.sink {
            self.tableView.reloadData()
        }.store(in: &subscriptions)
        
        viewModel.reload()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.trending.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let movie = viewModel.trending[row]
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier, for: indexPath) as? MoviesTableViewCell else {
            fatalError()
        }
        cell.selectionStyle = .none
        cell.configure(for: movie)
        return cell
    }
}

