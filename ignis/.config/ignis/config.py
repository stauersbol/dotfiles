from ignis import utils
from ignis import widgets
from modules import Bar
from ignis.app import IgnisApp
import os

app = IgnisApp.get_default()

app.apply_css(style_path=os.path.join(utils.get_current_dir(), "style.scss"))

for i in range(utils.get_n_monitors()):
    Bar(i)
