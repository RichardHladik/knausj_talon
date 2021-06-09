from typing import List

from talon import Context, Module, actions
from ..code.user_settings import get_list_from_csv, register_csv_listener

mod = Module()
ctx = Context()

mod.list("quick_url", desc="Quick url")
mod.list("quick_url_template", desc="Quick url template")

@register_csv_listener("quick_urls.csv")
def quick_urls_update(filename):
    urls = get_list_from_csv(
        filename,
        headers=("URL", "Talon name"),
        default=[],
    )

    quick_url = {}
    quick_url_template = {}

    for k, v in urls.items():
        if v.endswith("##"):
            quick_url_template[k] = v[:-2]
        else:
            quick_url[k] = v

    ctx.lists["self.quick_url"] = quick_url
    ctx.lists["self.quick_url_template"] = quick_url_template

def focus_browser():
    actions.user.switcher_focus("firefox")
    actions.sleep("100ms")

def quick_url(url: str, go: bool, preparer):
    preparer()
    actions.insert(url)
    actions.sleep("50ms")
    if not go:
        actions.key("right")
    else:
        actions.key("enter")

@mod.action_class
class Actions:
    def quick_url_prepare_current():
        """Prepare the browser for inputting the URL in the current tab"""
        focus_browser()
        actions.key("ctrl-l")
        actions.sleep("20ms")
        actions.key("ctrl-a")
        actions.sleep("20ms")

    def quick_url_prepare_new():
        """Prepare the browser for inputting the URL in new tab"""
        focus_browser()
        actions.key("ctrl-t")

    def quick_url_current(url: str, go:int=1):
        """Opens the URL in the web browser, in the current tab"""
        quick_url(url, bool(go), actions.user.quick_url_prepare_current)

    def quick_url_new(url: str, go:int=1):
        """Opens the URL in the web browser, in the new tab"""
        quick_url(url, bool(go), actions.user.quick_url_prepare_new)
