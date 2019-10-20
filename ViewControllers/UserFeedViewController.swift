

import UIKit

class UserFeedViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let viewModel = UserFeedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.tableFooterView = UIView()
    }

    func registerCell() {
          
        tableView.register(UINib(nibName: UserFeedCell.identifier, bundle: nil), forCellReuseIdentifier: UserFeedCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.delegate = self
        viewModel.loadData()
    }
}

extension UserFeedViewController:  ViewModelDataSourceDelegate {
    func dataSourceDidFinishingLoading() {
       tableView.reloadData()
    }
    
    func dataSourceDidLoadingWithError(error: RequestError?) {
        
    }
    
    func dataSourceDidStartLoading() {
        
    }
}


extension UserFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return configureCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAt(index:indexPath)
    }
    
    
    func configureCell(indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell: UserFeedCell = tableView.dequeueReusableCell(withIdentifier: UserFeedCell.identifier) as? UserFeedCell, let vm = viewModel.viewModelForCell(index: indexPath)  {
                cell.viewModel = vm
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func didSelectRowAt(index:IndexPath){
        if let _ = configureCell(indexPath: index) as? UserFeedCell  {
           //ToDo: do something
        }
    }
    
    
}
