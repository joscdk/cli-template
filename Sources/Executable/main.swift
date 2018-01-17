import Console
import Command
import App

let terminal = Terminal()

public struct CliCommands: CommandGroup {
    public var commands: CommandGroup.Commands
    
    public var options: [CommandOption]
    
    public var help: [String]
    
    public init() {
        self.commands = [
            "test-command": TestCommand()
        ]
        self.options = [
            CommandOption.value(
                name: "version",
                short: "v",
                default: "",
                help: ["Print version"]
            )
        ]
        self.help = []
    }
    
    public func run(using context: CommandContext) throws {
        if let version = context.options["version"] {
            context.console.info("Vapor CLI: 0.0.0")
        }
    }
}

try terminal.run(CliCommands(), input: &.commandLine)
