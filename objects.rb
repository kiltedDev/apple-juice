Shell 1:
File.open("apple.marshal", "w"){|to_file| Marshal.dump(apple, to_file)}

Shell 2:
apple = File.open("apple.marshal", "r"){|from_file| Marshal.load(from_file)}
