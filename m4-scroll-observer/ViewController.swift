//
//  ViewController.swift
//  m4-scroll-observer
//
//  Created by Chen,Meisong on 2019/7/12.
//  Copyright © 2019 xyz.chenms. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Constants
    private struct Constants {
        static let cellID = "cellID"
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellID)
        if #available(iOS 11.0, *) {
            table.contentInsetAdjustmentBehavior = .never
        }
        
        return table
    }()
    
    private lazy var topBarA: TopBarA = {
        let topBarA = TopBarA()
        
        return topBarA
    }()
    
    private lazy var scrollConverter : M42DirectionProgressScrollConverter = {
        let scrollConverter = M42DirectionProgressScrollConverter()
        scrollConverter.progress0OffsetX = 0
        scrollConverter.scrollUpProgress1OffsetX = 60
        scrollConverter.scrollDownProgress1OffsetX = -60
        
        return scrollConverter
    }()
    
    private lazy var datas: [String] = {
        let datas = temp_list_data_generator.indexTextArray(40)
        
        return datas
    }()
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        makeLayout()
    }
}

extension ViewController {
    private func addSubViews() {
        view.addSubview(tableView)
        view.addSubview(topBarA)
    }
    private func makeLayout() {
        tableView.frame = UIScreen.main.bounds
        topBarA.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let progress = scrollConverter.scrollUpProgress(scrollView) {
            topBarA.scrollUp(progress)
        }
        if let progress = scrollConverter.scrollDownProgress(scrollView) {
            topBarA.scrollDown(progress)
        }
    }
}

