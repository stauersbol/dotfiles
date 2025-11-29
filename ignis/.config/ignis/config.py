from ignis import utils
from ignis import widgets
from ignis.widgets import Widget


def left(monitor_name: str) -> Widget.Box:
    left = Widget.Box(child=[Workspaces(monitor_name)])


def bar(monitor_id: int = 0) -> Widget.Window:
    monitor_name = utils.get_monitor(monitor_id).get_connector()  # type: ignore
    widgets_box = Widget.CenterBox


for i in range(utils.get_n_monitors()):
    bar(i)
