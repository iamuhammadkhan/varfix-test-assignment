//
//  GarmentsListViewController.swift
//  Varfix-Test-Assignment
//
//  Created by Muhammad Khan on 11/6/21.
//

import UIKit

final class GarmentsListViewController: UIViewController {
    
    lazy var viewModel: GarmentListViewModel? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        setupTableView()
        viewModel = GarmentListViewModel()
        viewModel?.delegate = self
    }
    
    private func setupTableView() {
        if let tableView = tableView {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: GarmentTableViewCell.identifier, bundle: nil),
                               forCellReuseIdentifier: GarmentTableViewCell.identifier)
        }
    }
    
    @IBAction private func addButtonTapped(_ sender: UIBarButtonItem) {
        let vc: AddGarmentViewController = UIStoryboard(storyboard: .addGarment).instantiateViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func segmentChanged(_ sender: UISegmentedControl) {
        viewModel?.sortGarments(with: sender.selectedSegmentIndex)
    }
}

extension GarmentsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getGarments().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GarmentTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(with: viewModel?.getGarment(at: indexPath.row))
        return cell
    }
}

extension GarmentsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension GarmentsListViewController: GarmentListProtocol {
    func garmentListUpdated() {
        tableView.reloadData()
    }
}

extension GarmentsListViewController: AddNewgarmentProtocol {
    func newGarmentAdded(garment: Garment) {
        viewModel?.addNewGarment(with: garment)
    }
}
