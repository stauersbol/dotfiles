from ignis import widgets
from ignis.widgets import Widget

from modules.bar.widgets.workspaces import Workspaces


class Bar(Widget.Window):
    __gtype_name__ = "Bar"

    def __init__(self, monitor: int):
        super().__init__(
            anchor=["top"],
            exclusivity="exclusive",
            monitor=monitor,
            namespace=f"ignis_BAR_{monitor}",
            layer="top",
            kb_mode="none",
            child=Widget.CenterBox(
                css_classes=["bar-widget"],
                start_widget=widgets.Box(child=[Workspaces()]),
            ),
        )
