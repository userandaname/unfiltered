# unfiltered

unfiltered is a Roblox game that bypasses Roblox's chat filters, allowing players to send messages without any restrictions on what they can say.

## Features

- Bypasses Roblox chat filters (obviously!)
- Requires LegacyChatService to be enabled to function :(
- Displays messages in the chat window and via bubble chat

## Installation

1. Clone or download this repository to your local machine.
2. Open Roblox Studio and load your game.
3. In the Explorer panel, navigate to `ReplicatedStorage` and create a new `Folder` named `Events`.
4. Inside the `Events` folder, create a new `RemoteEvent` named `ChatEvent`.
5. Copy the contents of the `src` folder from this repository to the corresponding locations in your Roblox game:
   - `src/ServerScriptService/serverChat.lua` to `ServerScriptService/serverChat`
   - `src/StarterPlayer/StarterPlayerScripts/localChat.lua` to `StarterPlayer/StarterPlayerScripts/localChat`

## Usage

1. When a player joins the game, the `serverChat.lua` script will listen for their chat messages.
2. The message will be sent to all players using the `ChatEvent` RemoteEvent.
3. The `localChat.lua` script will handle displaying the message in the chat window and as a system message, while also deleting the designated frame from their message, bypassing Roblox's filters, making it seem like you sent the message!

## Contributing

Feel free to submit issues or pull requests if you have any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.