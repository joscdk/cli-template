import Console
import Foundation

public final class MyCustomCommand: Command {
    public let id = "my-custom-command"

    public let help: [String] = [
        "Example of a Custom CLI command"
    ]

    public let console: ConsoleProtocol

    public init(console: ConsoleProtocol) {
        self.console = console
    }

    public func run(arguments: [String]) throws {
	do {
            let result = try console.backgroundExecute(
                program: "ls",
                arguments: [
			"-la"
                ]
            )
            console.info(result)
        } catch ConsoleError.backgroundExecute(_, _, output: let error) {
            console.error(error)
        }
    }
}
