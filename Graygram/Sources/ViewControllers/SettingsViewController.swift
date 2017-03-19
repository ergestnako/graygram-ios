//
//  SettingsViewController.swift
//  Graygram
//
//  Created by Suyeol Jeon on 20/03/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

  fileprivate struct Section {
    let items: [SectionItem]
  }

  fileprivate enum SectionItem {
    case version
    case logout
  }

  fileprivate struct CellData {
    var text: String
    var detailText: String?
  }

  fileprivate var sections: [Section] = [
    Section(items: [.version]),
    Section(items: [.logout]),
  ]

  fileprivate let tableView = UITableView(frame: .zero, style: .grouped).then {
    $0.register(SettingsCell.self, forCellReuseIdentifier: "cell")
  }

  init() {
    super.init(nibName: nil, bundle: nil)
    self.title = "Settings"
    self.tabBarItem.title = "Settings"
    self.tabBarItem.image = UIImage(named: "tab-settings")
    self.tabBarItem.selectedImage = UIImage(named: "tab-settings-selected")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.view.addSubview(self.tableView)

    self.tableView.snp.makeConstraints { make in
      make.edges.equalTo(0)
    }
  }

  fileprivate func cellData(for sectionItem: SectionItem) -> CellData {
    switch sectionItem {
    case .version:
      return CellData(text: "현재 버전", detailText: "0.0.0")

    case .logout:
      return CellData(text: "로그아웃", detailText: nil)
    }
  }

}

extension SettingsViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return self.sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sections[section].items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let sectionItem = self.sections[indexPath.section].items[indexPath.row]
    let cellData = self.cellData(for: sectionItem)
    cell.textLabel?.text = cellData.text
    cell.detailTextLabel?.text = cellData.detailText
    return cell
  }

}


extension SettingsViewController: UITableViewDelegate {



}