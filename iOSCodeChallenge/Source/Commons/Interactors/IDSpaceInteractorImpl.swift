
// MARK: - Protocols IDSpaceInteractorCallback
protocol IDSpaceInteractorCallback
{
}

// MARK: - Protocols IDSpaceInteractor
protocol IDSpaceInteractor
{
    var presenter: IDSpaceInteractorCallback? { get set }
    
    func addSpaceFavorie(item: IDResultModel)
    func removeSpaceFavorie(item: IDResultModel)
}

final class IDSpaceInteractorImpl
{
    
    // MARK: - Presenter
    var presenter: IDSpaceInteractorCallback?
    
    // MARK: - Session
    var session: SessionDataManager?
    
    init(session: SessionDataManager)
    {
        self.session = session
    }
}

extension IDSpaceInteractorImpl: IDSpaceInteractor
{
    func addSpaceFavorie(item: IDResultModel)
    {
        if let code = item.code {
            session?.addSpace(code)
        }
    }
    
    func removeSpaceFavorie(item: IDResultModel)
    {
        if let code = item.code {
            session?.deleteSpace(code)
        }
    }
}
