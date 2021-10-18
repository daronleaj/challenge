import UIKit

class IDResultListTableViewController: UITableViewController
{
    // MARK: - Presenter
    var presenter: IDResultListPresenter?
    
    // MARK: Var
    private var spaces: [IDResultModel]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    @objc func pullRefreshTable()
    {
        presenter?.userWantPullRefreshTable()
    }

}

// MARK: - Table view data source
extension IDResultListTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let results = spaces else { return 0 }
        
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDResultListTableViewCell.identifier, for: indexPath) as! IDResultListTableViewCell
        let elementCell = spaces![indexPath.row]
        cell.fill(withResult: elementCell, delegateOutput: self)
//        cell.elevate(elevation: 10)

        return cell
    }
}

// MARK: - Table view delegate
extension IDResultListTableViewController
{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let spaces = spaces, spaces.count > indexPath.row {
            presenter?.userClick(itemModel: spaces[indexPath.row])
        }
    }
}

// MARK: - IDResultListView
extension IDResultListTableViewController: IDResultListView
{
    func showListSpaces(spaces: [IDResultModel])
    {
        self.spaces = spaces
        checkRefreshControl()
        
        tableView.reloadData()
    }
}

// MARK: - IDResultListTableViewCellOutput
extension IDResultListTableViewController: IDResultListTableViewCellOutput
{
    func clickAddFavorite(item: IDResultModel)
    {
        if let row = self.spaces?.firstIndex(where: {$0.code == item.code}) {
            self.spaces?[row].setFavorite(favorite: true)
        }
        
        presenter?.userClickAddFavorite(itemModel: item)
    }
    
    func clickRemoveFavorite(item: IDResultModel)
    {
        if let row = self.spaces?.firstIndex(where: {$0.code == item.code}) {
            self.spaces?[row].setFavorite(favorite: false)
        }
        presenter?.userClickRemoveFavorite(itemModel: item)
    }
}

// MARK: - Private Methods
private extension IDResultListTableViewController
{
    
    func setUpView()
    {
        title = R.string.titleList^
        
        //Configure tableview
        let nib = UINib(nibName: String(describing: IDResultListTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: IDResultListTableViewCell.identifier)
        tableView.estimatedRowHeight = 240.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        //Set logic to refresh
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.clear
        refreshControl?.tintColor = UIColor.black
        
        refreshControl?.attributedTitle = NSMutableAttributedString(string: R.string.pullToRefreshTable^)
        
        refreshControl?.addTarget(self, action: #selector(IDResultListTableViewController.pullRefreshTable), for: UIControl.Event.valueChanged)
    }
    
    func checkRefreshControl()
    {
        //Set end refreshControl
        if let refreshC = refreshControl, refreshC.isRefreshing {
            refreshControl?.endRefreshing()
        }
    }
}
