import argparse

from brightness import get_current_brightness, set_brightness
from fs import HOME_DIR, save_to_file, read_from_file

parser = argparse.ArgumentParser()
parser.add_argument(
    "-a", "--action", choices=["brightness_off", "brightness_restore"], required=True
)
args = parser.parse_args()


if args.action == "brightness_off":
    current_brightness = get_current_brightness()
    save_to_file(f"{HOME_DIR}/.local/state/.brightness", str(current_brightness))
    set_brightness(0)


if args.action == "brightness_restore":
    try:
        brightness_value = read_from_file(f"{HOME_DIR}/.local/state/.brightness")
    except FileNotFoundError:
        brightness_value = 50

    set_brightness(brightness_value)
