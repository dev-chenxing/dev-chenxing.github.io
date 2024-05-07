# frozen_string_literal: true

def get_file_path(title, extension)
  books_dir = File.read('books_dir').chomp
  Dir.mkdir(books_dir) unless File.directory?(books_dir)
  dir = File.join(books_dir, extension)
  Dir.mkdir(dir) unless File.directory?(dir)
  File.join(dir, "#{title}.#{extension}")
end
