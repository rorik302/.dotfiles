from pathlib import Path

HOME_DIR: Path = Path.home()


def save_to_file(path: str, data: str):
    with open(path, "w") as file:
        file.write(data)


def read_from_file(path: str):
    with open(path, "r") as file:
        return file.read()
