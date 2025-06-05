# Configuration file for ipython.
from catppuccin.extras.pygments import MacchiatoStyle
from pygments.styles import get_style_by_name
from pygments.util import ClassNotFound

c = get_config()  # noqa

# c.Application.verbose_crash = True

c.InteractiveShell.theme = "linux"

c.TerminalInteractiveShell.auto_match = True
c.TerminalInteractiveShell.true_color = True
c.TerminalInteractiveShell.theme = "linux"

try:
    catppucin_macchiato = get_style_by_name("catppuccin-macchiato")
    c.TerminalInteractiveShell.highlighting_style_overrides = catppucin_macchiato.styles
except ClassNotFound as e:
    print(f"Failed to find pygments style 'catppuccin-macchiato': {e}")

c.PlainTextFormatter.max_width = 88
