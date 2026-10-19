# Start here: your first Claude Code session

You'll go from this folder to a real website you can open on your phone. Do one part per sitting if you like. Nothing breaks if you stop partway.

## Part 0: See it work (2 minutes)
Double-click `index.html`. Your planner opens in your browser with all five classes already loaded. That's the app. Everything from here on makes it live online instead of only on this Mac.

## Part 1: Install Claude Code (5 minutes)
1. Open **Terminal**: press `Cmd + Space`, type `Terminal`, and press Enter.
2. Paste this line and press Enter. It shows no progress for a minute, so just wait:
   ```
   curl -fsSL https://claude.ai/install.sh | bash
   ```
3. When it says it installed, **close Terminal and open a new window**. Then check it worked:
   ```
   claude --version
   ```
   If it says `command not found: claude`, paste these two lines, then open a new Terminal window:
   ```
   echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```

## Part 2: Open this project in Claude Code
1. Move this `dixons-planner` folder somewhere you'll keep it, like **Documents**.
2. In Terminal, type `cd ` (with a space after it), drag the `dixons-planner` folder onto the Terminal window, and press Enter. That's the Mac shortcut for typing a folder's path.
3. Start Claude Code:
   ```
   claude
   ```
   The first time, a browser window opens so you can log in with your Claude account.

Claude Code automatically reads `CLAUDE.md` in this folder, so it already knows what the project is and that you're new to this.

## Part 3: Your first prompts (copy them one at a time)
1. `Explain what's in this folder and how the app works, like I've never coded before.`
2. `Let's do roadmap step 1: set up git and put this on GitHub. Walk me through anything I need to click.`
3. `Roadmap step 2: publish it with GitHub Pages and give me the link.`

Then open that link on your phone. Your planner now lives outside of Claude.

**Later sittings:** `Roadmap step 3: set up Supabase so my data syncs and I can log in.` Then steps 4–6.

## Terminal basics
- Type and press **Enter** to send. You can't click inside the terminal, so use the arrow keys.
- **Esc** stops Claude mid-task. **↑** brings back your last message.
- When Claude asks permission to edit a file or run a command, read the one-line summary, then press Enter for **Yes**.
- `/help` lists commands. `/exit` (or Ctrl + D twice) quits. Run `claude -c` next time to pick up where you left off.

## Accounts you'll make along the way (all free)
- **GitHub** (github.com): stores your code and hosts the website.
- **Supabase** (supabase.com): the database and logins, for step 3.
