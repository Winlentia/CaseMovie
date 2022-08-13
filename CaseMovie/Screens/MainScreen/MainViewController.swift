//
//  MainViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var viewModel = MainViewModel()
    private var searchWorkItem: DispatchWorkItem?
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search Movie or Actor"
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .blue
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.registerCell(type: PopularMovieTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
        view.backgroundColor = .yellow
        setupUI()
        bindViewModel()
        viewModel.fetchMovies()
    }
    
    func setupUI() {
        setupTableView()
        
        setupSearchBar()
    }
    
    fileprivate func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = false
    }
    
    fileprivate func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularMovieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: PopularMovieTableViewCell.self, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(viewModel: .init(movie: viewModel.popularMovieData[indexPath.row]))
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieId = viewModel.popularMovieData[indexPath.row].id {
            self.navigationController?.pushViewController(MovieDetailViewController(viewModel: .init(movieId: movieId)), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > viewModel.popularMovieData.count - 5 {
            viewModel.fetchMovies()
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        searchWorkItem?.cancel()

                // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.viewModel.search(query: searchText)
            print("requestActivated")
        }

        // Save the new work item and execute it after 250 ms
        searchWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300),
                                      execute: requestWorkItem)
        }
}


