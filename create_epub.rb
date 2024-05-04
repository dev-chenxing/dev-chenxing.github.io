# frozen_string_literal: true

require 'gepub'

def generate_epub(url, title, author, contributors, _)
  book = GEPUB::Book.new
  book.identifier = url
  book.title = title
  book.creator = author
  contributors.each { |contributor| book.add_contributor contributor }
  book.language = 'zh'

  File.open 'style.css', mode: 'rb', encoding: 'utf-8' do |css|
    book.add_item('Styles/style.css', content: css)
  end

  File.open 'cover.png', mode: 'rb' do |png|
    book.add_item('Images/cover.png', content: png).cover_image
  end

  book.ordered do
    book.add_item('Text/cover.xhtml', content: StringIO.new(<<~COVER.chomp)).landmark(type: 'cover', title: '封面')
      <?xml version="1.0" encoding="utf-8"?>
      <!DOCTYPE html>
      <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
        <head>
          <link href="../Styles/style.css" rel="stylesheet" type="text/css"/>
          <title>封面</title>
        </head>
        <body>
          <div class="cover"><img alt="cover" src="../Images/cover.png"/></div>
        </body>
      </html>
    COVER
  end

  file = "#{title}.epub"
  book.generate_epub(file)
  puts "#{title}.epub created"
end
