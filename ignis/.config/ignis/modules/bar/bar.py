from ignis.widgets import Widget

from modules.bar.widgets import Tray, Workspaces, Time, StatusPill


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
                start_widget=Widget.Box(child=[Workspaces()]),
                center_widget=Widget.Box(child=[Time()]),
                end_widget=Widget.Box(child=[Tray(), StatusPill(monitor=monitor)]),
            ),
        )
