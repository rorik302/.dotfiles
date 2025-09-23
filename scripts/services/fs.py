class FileSystem:
    def save_to_file(self, path: str, data: str) -> None:
        with open(path, "w") as file:
            file.write(data)

    def read_from_file(self, path: str) -> str:
        with open(path, "r") as file:
            return file.read()


fs = FileSystem()
