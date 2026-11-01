# Roblox Studio Black Box Template

Displays a centered, black `620 × 460` draggable panel for each player. It
contains grey list entries for Italian-brainrot-themed server names and green
Join buttons. The buttons currently log the selected name to Output; connect
them to your own approved game matchmaking flow as needed.

Use the `−` button to collapse the panel to its top bar; press `+` to restore
it. The `×` button closes the UI for the current player.

## Install

1. Open your experience in Roblox Studio.
2. In Explorer, navigate to `StarterPlayer > StarterPlayerScripts`.
3. Insert a LocalScript and replace its contents with `BlackBoxUI.client.lua`.
4. Test using Play, then publish your experience from Roblox Studio.

## Customization

- Change `box.Size` to set the box dimensions.
- Change `box.Position` to move it.
- Change `box.BackgroundColor3` to use a different color.
