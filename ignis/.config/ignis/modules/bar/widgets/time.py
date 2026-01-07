from ignis.widgets import Widget
from ignis.utils import Utils
from ignis.variable import Variable
import datetime

current_time = Variable(
    value=Utils.Poll(
        1000, lambda x: datetime.datetime.now().strftime("%a, %d %b %y | %I:%M %p")
    ).bind("output")
)


class Time(Widget.Box):
    def __init__(self):
        super().__init__(
            child=[Widget.Label(label=current_time.bind("value"))],
            css_classes=["time", "widget-box"],
        )
