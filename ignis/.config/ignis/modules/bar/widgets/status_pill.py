from ignis.services.audio import AudioService
from ignis import utils, widgets
from ignis.variable import Variable
import datetime

audio = AudioService.get_default()


class IndicatorIcon(widgets.Icon):
    def __init__(self, css_classes: list[str] = [], **kwargs):
        super().__init__(
            style="margin-right: 0.5rem;", css_classes=["unset"] + css_classes, **kwargs
        )


current_time = Variable(
    value=utils.Poll(
        1000, lambda x: datetime.datetime.now().strftime("%a, %d %b %y | %I:%M %p")
    ).bind("output")
)


class VolumeIcon(IndicatorIcon):
    def __init__(self):
        super().__init__(
            image=audio.speaker.bind("icon_name"),
        )


class StatusPill(widgets.Button):
    def __init__(self, monitor: int):
        self._monitor = monitor

        super().__init__(
            child=widgets.Box(
                child=[VolumeIcon(), widgets.Label(label=current_time.bind("value"))]
            )
        )
