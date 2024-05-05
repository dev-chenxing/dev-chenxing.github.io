def get_file_path(title, extension)
  books_dir = File.read('books_dir').chomp
  Dir.mkdir(books_dir) unless File.directory?(books_dir)
  File.join(books_dir, "#{title}.#{extension}")
end
