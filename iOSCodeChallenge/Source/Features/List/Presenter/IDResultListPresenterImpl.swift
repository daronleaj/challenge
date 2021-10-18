import UIKit

final class IDResultListPresenterImpl
{
    
    //MARK: - View
    var view: IDResultListView?
    
    //MARK: - Interactor
    var interactor: IDResultListInteractor?
    var interactorSpace: IDSpaceInteractor?
    
    //MARK: - Router
    var router: IDResultListRouter?
}

// MARK: - Presenter methods
extension IDResultListPresenterImpl: IDResultListPresenter
{
    
    func viewDidLoad()
    {
        //Nothing to do here
    }
    
    func viewWillAppear()
    {
        interactor?.fetchListSpaces()
    }
    
    func viewDidAppear()
    {
        //Nothing to do here
    }
    
    func userWantPullRefreshTable()
    {
        interactor?.fetchListSpaces()
    }
    
    func userClick(itemModel: IDResultModel)
    {
        router?.goToDetail(itemModel: itemModel)
    }
    
    func userClickAddFavorite(itemModel: IDResultModel)
    {
        interactorSpace?.addSpaceFavorie(item: itemModel)
    }
    
    func userClickRemoveFavorite(itemModel: IDResultModel)
    {
        interactorSpace?.removeSpaceFavorie(item: itemModel)
    }
}

// MARK: - IDResultListInteractorCallback methods
extension IDResultListPresenterImpl: IDResultListInteractorCallback
{
    func fetchedListSpaces(result: Result<[IDResultModel], IDResultListInteractorError>)
    {
        switch result {
        case .success(let elementList):
            DispatchQueue.main.async {
                self.view?.showListSpaces(spaces: elementList)
            }
        case .failure(_ ):
            DispatchQueue.main.async {
                self.view?.showListSpaces(spaces: [])
            }
        }
    }
}

// MARK: - IDSpaceInteractorCallback methods
extension IDResultListPresenterImpl: IDSpaceInteractorCallback
{
}
