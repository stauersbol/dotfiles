from ignis.utils import Utils
from modules.bar import Bar

for i in range(Utils.get_n_monitors()):
    Bar(i)
