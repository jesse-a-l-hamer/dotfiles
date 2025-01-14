# dofiles

This is my dotfiles repository.

There are many like it, but this one is mine.

## Screenshots

- TODO

## Introduction

I suppose this project has its genesis it my attempts to improve
my software development skills.

My formal background is in pure mathematics, though I'm also a
trained data scientist with now several years of experience under my belt as a
practicing AI Scientist. I first learned to program in C++ as an undergraduate
CS minor, thinking it might help in my career as a mathematician.
In graduate school, my coursework exposed me to other languages:
MATLAB (differential equations),
R (statistics, topological data analysis),
and eventually Python.

While I'm largely grateful for the education I received, one rather glaring
omission (in hindsight, anyways) from the curriculum was any mention
of the *tools of the trade*, so to speak. Principal emphasis was on the encoding
of algorithms into the syntax of this-or-that language. We were of course given
instructions on setting up a basic development environment, but the importance
of this environment to the craft of software was, sadly, completely downplayed.

Now, in every field, there is some highly non-linear relationship between the
rates of acquiring new knowledge *within the field*,
and acquiring new knowledge *of the scope of the field*.
(The former kind of knowledge are often called the "known *knowns*",
while the latter are the "known *unknowns*".) In other words: the more one learns
within a field, the more one comes to appreciate how little they
actually know within the field; and the pace at which this void of unknowns
grows only becomes faster and faster, as one learns more within the field.
I will further hypothesize that there are in this relationship two inflection points.
The first occurs when the overconfidence of the novice transitions to
the despair of one who realizes how insignificant they truly are before
the vastness of the intellectual pursuit to which they've
already devoted so much time. The despair is caused by the realization
that one *cannot* know all--no matter the time or effort put in.
Eventually (hopefully), however, this despair gives way to a serene acceptance;
one appreciates the vastness of the unknown as the opportunity of unending
adventure; one accepts that their lot in life is not to conquer,
but merely to walk.

This pattern has characterized several of my learning paths, and
software development has been no exception. I slipped into the despair late into
graduate school, as I began searching for jobs and realizing how woefully
unprepared I felt. I am now happy to report that I find myself in the
midst of that second inflection point.

This repository is one that I will continually tweak and tinker with, because
I have found that I genuinely love tinkering with and learning about computers.

## Installation

I use [toml-bombadil](https://github.com/oknozor/toml-bombadil) to manage
symlinking of my dotfiles. I highly recommend that you check it out!

Assuming you've installed *toml-bombadil* and all of the [tools](#tools)
mentioned below, you can install the dotfiles by running the following:

```sh
bombadil link -p desktop
```

My next goal in building out this repo is to set up an `install.sh` script to make
bootstrapping easier. At that point I will also refactor some of the dotfiles
themselves, leveraging *toml-bombadil's* templating abilities to make them platform
agnostic.

Ultimately, I'd like to have a single repository which is capable of syncing my
environment across all of my current (and future) devices.
This way, trying out a new distro or refreshing my existing system can
be as painless as possible.

## Tools

I have tried to organize the dotfiles into high-level groups which are as
sensible as possible. The list below is not an exhaustive list of the tools I'm
currently using, but it does capture most of the key tools I use and whose
configurations I have so far messed with.

> [!note] Theming and Fonts
> After theme-hopping for several years
([gruvbox](https://github.com/morhetz/gruvbox)
was my go-to theme for most of those years),
I finally settled upon [Catppuccin](https://catppuccin.com/)
(macchiato) to theme my various. Aside from being a great color scheme,
I love how configurable (four different variants,
with even more "accent" colors) and *pervasive* Catppuccin is.
There might be color schemes that I like more *in isolation*, but
the widespread availability of official ports and
the community's emphasis on documentation means I can give
basically my *entire system* a consistent look and feel.
Check out the `themes/catppuccin/` folder,
which has several of these ports that I'm using
throughout my system.
> I've also done some font-hopping, with my current favorite being
[NerdFonts'](https://www.nerdfonts.com/) port of
[Monaspace](https://monaspace.githubnext.com/) (called *Monaspice*).
You can preview the font
[here](https://www.programmingfonts.org/#monaspace-neon)
if you're interested! (I prefer the Argon variant myself.)

### Browser

- [Zen](https://zen-browser.app/): exciting new Firefox-based browser

### CLI

- [bat](https://github.com/sharkdp/bat): like `cat`, but better
- [bottom](https://github.com/ClementTsang/bottom): system monitoring
- [espanso](https://github.com/espanso/espanso): text expander
- [glow](https://github.com/charmbracelet/glow): render markdown documents with 🌈*pizazz*🌠
- [lazygit](https://github.com/jesseduffield/lazygit): cool, easy to use TUI git-interface
- [neofetch](https://github.com/dylanaraps/neofetch): print out a quick system
summary with nice ascii art
- [tealdeer](https://github.com/tealdeer-rs/tealdeer): rust-based tldr replacement;
simple, community-driven man pages
- [weathercrab](https://github.com/ttytm/wthrr-the-weathercrab): rust-based
weather app
- [yazi](https://github.com/sxyazi/yazi): terminal file manager, written in rust

Other noteworthy CLI tools I use whose configs do not appear here:

- [eza](https://github.com/eza-community/eza): rust-based ls replacement
- [zoxide](https://github.com/ajeetdsouza/zoxide): rust-based cd replacement
- [delta](https://github.com/dandavison/delta): rust-based git diff/merge tool
- [funzzy](https://github.com/cristianoliveira/funzzy): rust-based filesystem watcher
- [dust](https://github.com/bootandy/dust): rust-based du-replacement
- [hexyl](https://github.com/sharkdp/hexyl): rust-based hex viewer
- [procs](https://github.com/dalance/procs): rust-based ps replacement
- [ripgrep (rg)](https://github.com/BurntSushi/ripgrep): rust-based grep replacement
- [rm-improved (rip)](https://github.com/nivekuil/rip): rust-based rm replacement
- [xsv](https://github.com/paulgirard/xsv): rust-based program for handling csv files
- [fzf](https://github.com/junegunn/fzf): fuzzy-finder
- [keepassxc](https://keepassxc.org/): password manager

### Editor

I recently switched from [JetBrains](https://www.jetbrains.com/)
([Intellij](https://www.jetbrains.com/idea/),
[PyCharm](https://www.jetbrains.com/idea/))
to [Neovim](https://neovim.io/), and I'm absolutely loving it.
As an AI/Data Scientist, the only itch that Neovim can't scratch is
Jupyter Notebook support, but there are plugins to work around this,
and if need be, I can just fire up [JupyterLab](https://jupyter.org/) in my browser.

When I started using Neovim, I was using the [AstroNvim](https://astronvim.com/)
distribution, which I would still highly recommend to anybody just
starting on their Neovim odyssey. Though AstroNvim has a lot of great stuff built-in,
you will still find yourself wanting to tinker with it after a bit of use
(this is simply the Neovim way, I'm afraid). The `editor/astro-nvim/` directory
contains my AstroNvim configuration. To use this configuration, you'll need to change
the editor profile being used in `bombadil.toml`:

```toml
# bombadil.toml
...
[profiles.desktop]
extra_profiles = [
  "browser-zen",
  "cli-go",
  "cli-node_js",
  "cli-rust",
  "cli-other",
  # "editor-astro_nvim", <-- uncomment this line
  "editor-kickstart_nvim", # <-- comment this line
  "git",
  "system-pop_os",
  "music-youtube_music",
  "python-3_12",
  "shell-bash",
  "shell-sh",
  "shell-zsh",
  "shell-multi",
  "terminal-wezterm",
]
```

After a couple of months using AstroNvim, however, I decided I wanted to really
understand how Neovim and its configuration worked. Thus, I made the switch to a
[kickstart](https://github.com/nvim-lua/kickstart.nvim)-based config
(actually, I'm using [kickstart-modular](https://github.com/dam9000/kickstart-modular.nvim),
which is just a modularized fork of the original kickstart).
This config is maintained in the `editor/kickstart-nvim/` directory.

In the remainder of this section, I'll highlight some of the key plugins I'm using.

- [Folke](https://github.com/folke)'s plugins should be their own section
  - [Lazy](https://github.com/folke/lazy.nvim): plugin manager
  - [which-key](https://github.com/folke/which-key.nvim): keymap popup/organizer
  - [noice](https://github.com/folke/noice.nvim):
    replacement ui for messages, cmdline, and the popupmenu
  - [snacks](https://github.com/folke/snacks.nvim): tons of small QoL plugins.
  I'm using just about all of the included "snacks" (modules),
  but here I'll highlight those that provide some core functionality:
    - [dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md):
    aesthetic, useful landing page when entering neovim
      - (with `{ example = "advanced" }`)
    - [indent](https://github.com/folke/snacks.nvim/blob/main/docs/indent.md):
    indent guides & scopes
    - [notifier](https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md)
    pretty notification interface and history
    - [statuscolumn](https://github.com/folke/snacks.nvim/blob/main/docs/statuscolumn.md)
    pretty statuscolumn
    - [zen](https://github.com/folke/snacks.nvim/blob/main/docs/zen.md)
    "Zen mode", for distraction-free coding
- [blink.cmp](https://github.com/Saghen/blink.cmp): completion
- [lualine](https://github.com/nvim-lualine/lualine.nvim): statusline
- [obsidian](https://github.com/epwalsh/obsidian.nvim):
integration between the
[Obsidian](https://obsidian.md/) note-taking app and Neovim

### Git

This directory just contains my basic `.gitconfig` file. Nothing too fancy.

### Music

I use YouTube Music, by way of [th-ch](https://github.com/th-ch/youtube-music).
Eventually I'll try to ween myself off of the webapp-interface,
but it works well enough for now and admits of several cool
customizations.

### Python

As an AI/Data Scientist, Python is my primary language. Here are some of the tools
I enjoy using:

- [uv](https://docs.astral.sh/uv/):
a fast package manager, virtual environment manager, and tool manager
- [ruff](https://astral.sh/ruff):
a fast linter, formatter, and language server
- [basedpyright](https://docs.basedpyright.com/latest/):
static type analysis

### Shell

I use [zsh](https://www.zsh.org/) as my primary shell.
Here are some of the accompanying tools I use with it:

- [antigen](https://github.com/zsh-users/antigen): plugin manager
  - special mention to [Oh My Zsh](https://ohmyz.sh/),
  which I used for some time before the switch to antigen.
  In fact, I was only comfortable making the switch since
  you can easily install *omz* plugins via antigen.
- [starship](https://starship.rs/): shell prompt

### System

Currently, I'm running [Pop!_OS](https://pop.system76.com/) (22.04),
which I have not altered much from the default
[System76](https://www.gnome.org/)-managed distribution.
As such, I'm currently using [GNOME 42](https://www.gnome.org/) as my DE.

Whenever [System76](https://www.gnome.org/) releases
[COSMIC](https://github.com/pop-os/cosmic-epoch)
I'll switch over to that.

Eventually I'll give [Arch](https://archlinux.org/) a try
(the whole point of creating this repo was to encourage experimenting, after all!).

### Terminal

I use [WezTerm](https://wezfurlong.org/wezterm/) as my terminal emulator. It has
builtin multiplexing and image support, plus it's highly configurable via lua.
