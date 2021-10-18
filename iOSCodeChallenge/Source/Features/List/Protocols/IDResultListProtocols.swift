import UIKit

// MARK: - View
protocol IDResultListView
{
    
    var presenter: IDResultListPresenter? { get set }
    
    func showListSpaces(spaces: [IDResultModel])
}

// MARK: - Presenter
protocol IDResultListPresenter
{
    
    var view: IDResultListView? { get set }
    var interactor: IDResultListInteractor? { get set }
    var interactorSpace: IDSpaceInteractor? { get set }
    var router: IDResultListRouter? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    
    func userWantPullRefreshTable()
    func userClick(itemModel: IDResultModel)
    func userClickAddFavorite(itemModel: IDResultModel)
    func userClickRemoveFavorite(itemModel: IDResultModel)
}

// MARK: - Interactor
protocol IDResultListInteractorCallback
{
    func fetchedListSpaces(result: Result<[IDResultModel], IDResultListInteractorError>)
}

protocol IDResultListInteractor
{
    var presenter: IDResultListInteractorCallback? { get set }
    
    func fetchListSpaces()
}

// MARK: - Router
protocol IDResultListRouter
{
    func goToDetail(itemModel: IDResultModel)
}
