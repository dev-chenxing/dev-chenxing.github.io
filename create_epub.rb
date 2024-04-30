require 'gepub'

def generate_epub(url, title, author, contributors, body)
  gbook = GEPUB::Book.new do |book|
    book.identifier = url
    book.title = title
    book.creator = author
    contributors.each do |contributor|
      book.add_contributor contributor
    end
    book.language = 'zh'

    book.ordered do
      item = book.add_item(title + '.xhtml')
      item.add_content StringIO.new('
        <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
            <title>%s</title>
          </head>
          <body>
            %s
          </body>
        </html>' % [title, body.join('')]
      )end
  end

  gbook.generate_epub(title + ".epub")
end
