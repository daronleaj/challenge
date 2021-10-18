
extension AnalyticsAgent
{
    
    struct SpaceEvent
    {
          
        static func selectSpace(code: String)
        {
            let spaceBlock = SpaceBlock(spacePropertyCode: code)
            trackEvent(nameEvent: .selectSpace, params: [], dataSource: spaceBlock.dictionary)
        }
        
        static func addSpace(code: String)
        {
            let spaceBlock = SpaceBlock(spacePropertyCode: code)
            trackEvent(nameEvent: .addSpace, params: [], dataSource: spaceBlock.dictionary)
        }
        
        static func removeSpace(code: String)
        {
            let spaceBlock = SpaceBlock(spacePropertyCode: code)
            trackEvent(nameEvent: .removeSpace, params: [], dataSource: spaceBlock.dictionary)
        }
    }
}
