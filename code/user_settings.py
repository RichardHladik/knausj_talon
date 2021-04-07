import csv
import os
from pathlib import Path
from typing import Dict, List, Tuple
from talon import resource, fs

# NOTE: This method requires this module to be one folder below the top-level
#   knausj folder.
SETTINGS_DIR = Path(__file__).parents[1] / "settings"

if not SETTINGS_DIR.is_dir():
    os.mkdir(SETTINGS_DIR)


def get_list_from_csv(
    filename: str, headers: Tuple[str, str], default: Dict[str, str] = {}
):
    """Retrieves list from CSV"""
    path = SETTINGS_DIR / filename
    assert filename.endswith(".csv")

    if not path.is_file():
        with open(path, "w", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerow(headers)
            for key, value in default.items():
                writer.writerow([key] if key == value else [value, key])

    # Now read via resource to take advantage of talon's
    # ability to reload this script for us when the resource changes
    with resource.open(str(path), "r") as f:
        rows = list(csv.reader(f))

    # print(str(rows))
    mapping = {}
    if len(rows) >= 2:
        actual_headers = rows[0]
        if not actual_headers == list(headers):
            print(
                f'"{filename}": Malformed headers - {actual_headers}.'
                + f" Should be {list(headers)}. Ignoring row."
            )
        for row in rows[1:]:
            if len(row) == 0:
                # Windows newlines are sometimes read as empty rows. :champagne:
                continue
            if len(row) == 1:
                output = spoken_form = row[0]
            else:
                output, spoken_form = row[:2]
                if len(row) > 2:
                    print(
                        f'"{filename}": More than two values in row: {row}.'
                        + " Ignoring the extras."
                    )
            # Leading/trailing whitespace in spoken form can prevent recognition.
            spoken_form = spoken_form.strip()
            mapping[spoken_form] = output

    return mapping

def register_csv_listener(filename: str):
    def decorate(listener):
        listener_noop = lambda: listener(filename)
        def new_listener(name, flags):
            if Path(name).parts[-1] != filename:
                return
            listener_noop()
        fs.watch(str(SETTINGS_DIR), new_listener)
        listener_noop()
        return listener_noop
    return decorate

def register_csv_to_context(ctx, filename: str, listname: str, headers: Tuple[str] = ("Original", "Talon name"), default={}):
    @register_csv_listener(filename)
    def listener(fn):
        ctx.lists[listname] = get_list_from_csv(
            fn,
            headers=headers,
            default=default,
        )
    return listener
