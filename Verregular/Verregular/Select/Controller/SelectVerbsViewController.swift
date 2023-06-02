//
//  SelectVerbsViewController.swift
//  Verregular
//
//  Created by Азалия Халилова on 20.04.2023.
//

import UIKit
import SnapKit

final class SelectVerbsViewController: UITableViewController {
    // MARK: - Properties
    private var dataSource = IrregularVerbs.shared
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select verbs".localized
        view.backgroundColor = .white
        tableView.register(SelectVerbTableViewCell.self, forCellReuseIdentifier: "SelectVerbTableViewCell")
    }
}

    // MARK: - UITableViewDataSource
extension SelectVerbsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.verbs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectVerbTableViewCell", for: indexPath) as? SelectVerbTableViewCell else { return UITableViewCell() }
        
        let verb = dataSource.verbs[indexPath.row]
        cell.configure(with: verb, isSelected: verb.selected)
        return cell
    }
}
    
    // MARK: - UITableViewDelegate
extension SelectVerbsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        IrregularVerbs.shared.toggleSelected(index: indexPath)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
