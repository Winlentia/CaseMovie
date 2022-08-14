//
//  MainViewController.swift
//  CaseMovie
//
//  Created by Winlentia on 11.08.2022.
//

import UIKit

class MainViewController: BaseViewController {
    
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
        tableView.contentInsetAdjustmentBehavior = .never
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.registerCell(type: PopularMovieTableViewCell.self)
        tableView.registerCell(type: PersonTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie"
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
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.isHidden = false
    }
    
    fileprivate func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                if self.viewModel.isSearchActive {
                    self.tableView.scrollToRow(at: .init(row: 0, section: 0), at: .top, animated: true)
                }
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let numberOfSections = viewModel.numberOfSections()
        if numberOfSections == 0 {
            tableView.setEmptyMessage("No Results")
        } else {
            tableView.removeEmptyMessage()
        }
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isSearchActive {
            
            switch viewModel.searchData.results[indexPath.section]{
            case .Movie:
                guard let cell = tableView.dequeueCell(withType: PopularMovieTableViewCell.self, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
                
                cell.configureCell(viewModel: .init(movie: viewModel.searchData.movieResults[indexPath.row]))
                return cell
            case .Person:
                guard let cell = tableView.dequeueCell(withType: PersonTableViewCell.self, for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
                
                cell.configureCell(viewModel: .init(actor: viewModel.searchData.personResults[indexPath.row]))
                return cell
            }
            
        } else {
            guard let cell = tableView.dequeueCell(withType: PopularMovieTableViewCell.self, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
            
            cell.configureCell(viewModel: .init(movie: viewModel.popularMovieData[indexPath.row]))
            return cell
        }
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.isSearchActive {
            switch viewModel.searchData.results[indexPath.section]{
            case .Person:
                if let personId = viewModel.searchData.personResults[indexPath.row].id {
                    self.navigationController?.pushViewController(PersonDetailViewController(viewModel: .init(personId: personId)), animated: true)
                }
            case .Movie:
                if let movieId = viewModel.searchData.movieResults[indexPath.row].id {
                    self.navigationController?.pushViewController(MovieDetailViewController(viewModel: .init(movieId: movieId)), animated: true)
                }
            }
        } else {
            if let movieId = viewModel.popularMovieData[indexPath.row].id {
                self.navigationController?.pushViewController(MovieDetailViewController(viewModel: .init(movieId: movieId)), animated: true)
            }
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > viewModel.popularMovieData.count - 5 {
            viewModel.fetchMovies()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if viewModel.isSearchActive {
            switch viewModel.searchData.results[section]{
            case .Person:
                return "Persons"
            case .Movie:
                return "Movies"
            }
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.isSearchActive {
            return 35
        } else {
            return 0
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchWorkItem?.cancel()

        let requestWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.viewModel.search(query: searchText)
        }

        searchWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300),
                                      execute: requestWorkItem)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.search(query: "")
    }
}


