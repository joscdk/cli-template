import Console
import Command
import Foundation

public final class TestCommand: Command {
    /// See Command.arguments
    public let arguments: [CommandArgument]
    
    /// See Command.options
    public let options: [CommandOption]
    
    /// See Command.help
    public var help: [String]

    public init() {
        arguments = []
        options = [
            CommandOption.value(
                name: "test",
                short: "t",
                default: nil,
                help: ["Test option"]
            )
        ]
        help = [
            "Test command"
        ]
    }
    
    public func run(using context: CommandContext) throws {
        context.console.info("It works 🎉")
        
        if let test = context.options["test"] {
            context.console.info(test)
        }
    }
}


