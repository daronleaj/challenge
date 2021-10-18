
extension AnalyticsAgent
{
    
    struct SpaceScreen
    {
        
        static func trackListSpace()
        {
            trackView(screenName: .listSpace, screenClass: .space, dataSource: [:])
        }
        
        static func trackDetailSpace()
        {
            trackView(screenName: .detailSpace, screenClass: .space, dataSource: [:])
        }
    }
}
