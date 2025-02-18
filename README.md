# dofiles

This is my dotfiles repository.

There are many like it, but this one is mine.

## Screenshots

- TODO

## Introduction

I suppose this project has its genesis it my attempts to improve
my software development skills.

I first learned to _program_ as a CS minor in undergrad, well over a decade ago.
While I'm grateful for the education I received, one thing I found sorely lacking
was any emphasis on the _tools of the software craftsperson's trade_. Perhaps this
is a consequence of having studied CS, mathematics, and statistics,
rather than SWE, but emphasis was always on algorithms and data structures
from a more theoretical perspective.

In recent years, however, I have gained an appreciation for the importance
of cultivating one's skill with the command line. Related to this, I have also
learned what profound joy and reward there is in cultivating a
well-functioning and beautiful development environment.

Thus it is that I decided to take the organizing of my dotfiles more seriously
and publish this repository.

I intend to continue cultivating and refining this repo indefinitely, as a garden.

So, welcome to my garden. I hope you enjoy walking through. If nothing else,
I hope it inspires you to cultivate your own garden, or reinvigorates a love
for the garden that may already be in your keeping.

## Installation

I use [toml-bombadil](https://github.com/oknozor/toml-bombadil) to manage
symlinking of my dotfiles. I highly recommend that you check it out!

Assuming you've installed _toml-bombadil_ and all of the [tools](#tools)
mentioned below, you can install the dotfiles by running the following:

```sh
bombadil link -p desktop
```

My next goal in building out this repo is to set up an `install.sh` script to make
bootstrapping easier. At that point I will also refactor some of the dotfiles
themselves, leveraging _toml-bombadil's_ templating abilities to make them platform
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
> ([gruvbox](https://github.com/morhetz/gruvbox)
> was my go-to theme for most of those years),
> I finally settled upon [Catppuccin](https://catppuccin.com/)
> (macchiato) to theme my various. Aside from being a great color scheme,
> I love how configurable (four different variants,
> with even more "accent" colors) and _pervasive_ Catppuccin is.
> There might be color schemes that I like more _in isolation_, but
> the widespread availability of official ports and
> the community's emphasis on documentation means I can give
> basically my _entire system_ a consistent look and feel.
> Check out the `themes/catppuccin/` folder,
> which has several of these ports that I'm using
> throughout my system.
>
> I've also done some font-hopping, with my current favorite being
> [NerdFonts'](https://www.nerdfonts.com/) port of
> [Monaspace](https://monaspace.githubnext.com/) (called _Monaspice_).
> You can preview the font
> [here](https://www.programmingfonts.org/#monaspace-neon)
> if you're interested! (I prefer the Argon variant myself.)

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
starting on their Neovim odyssey.

After a couple of months using AstroNvim, however, I decided I wanted to really
understand how Neovim and its configuration worked. Thus, I made the switch to a
[kickstart](https://github.com/nvim-lua/kickstart.nvim)-based config
(actually, I'm using [kickstart-modular](https://github.com/dam9000/kickstart-modular.nvim)).
This config is maintained in the `editor/kickstart-nvim/` directory.

In the remainder of this section, I'll highlight some of the key plugins I'm using.

- [Folke](https://github.com/folke)'s plugins should be their own section
  - [Lazy](https://github.com/folke/lazy.nvim): plugin manager
  - [flash](https://github.com/folke/flash.nvim):
    jump around the buffer in a flash
  - [which-key](https://github.com/folke/which-key.nvim): keymap popup/organizer
  - [noice](https://github.com/folke/noice.nvim):
    replacement ui for messages, cmdline, and the popupmenu
  - [trouble](https://github.com/folke/trouble.nvim):
    handy list viewer for diagnostics, quickfixes, etc.
  - [snacks](https://github.com/folke/snacks.nvim): tons of small QoL plugins.
    I'm using just about all of the included "snacks" (modules),
    but here I'll highlight those that provide some core functionality:
    - [dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md):
      aesthetic, useful landing page when entering neovim
      - (with `{ example = "advanced" }`)
    - [indent](https://github.com/folke/snacks.nvim/blob/main/docs/indent.md):
      indent guides & scopes
    - [notifier](https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md):
      pretty notification interface and history
    - [picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md):
      an amazing Telescope replacement/fuzzy finder
    - [statuscolumn](https://github.com/folke/snacks.nvim/blob/main/docs/statuscolumn.md):
      pretty statuscolumn
    - [zen](https://github.com/folke/snacks.nvim/blob/main/docs/zen.md):
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
    you can easily install _omz_ plugins via antigen.
- [starship](https://starship.rs/): shell prompt

### System

Currently, I'm running [Pop!\_OS](https://pop.system76.com/) (22.04),
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
