import Console
import Foundation

public final class TestCommand: Command {
    public let id = "test-command"
    
    public let help: [String] = [
        "Example of a CLI command"
    ]
    
    public let console: ConsoleProtocol
    
    public init(console: ConsoleProtocol) {
        self.console = console
    }
    
    public func run(arguments: [String]) throws {
        console.info("It works 🎉")
    }
}


