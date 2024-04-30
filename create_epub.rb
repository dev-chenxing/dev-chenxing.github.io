# frozen_string_literal: true

require 'gepub'

def get_content(title, body)
  "
  <html xmlns='http://www.w3.org/1999/xhtml'>
  <head>
  <title>#{title}</title>
  </head>
  <body>
  #{body.join('<br>')}
  </body>
  </html>"
end

def generate_epub(url, title, author, contributors, body)
  gbook = GEPUB::Book.new do |book|
    book.identifier = url
    book.title = title
    book.creator = author
    contributors.each { |contributor| book.add_contributor contributor }
    book.language = 'zh'
    book.ordered { book.add_item("#{title}.xhtml").add_content StringIO.new(get_content(title, body)) }
  end

  gbook.generate_epub("#{title}.epub")
end
