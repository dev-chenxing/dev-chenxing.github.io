# frozen_string_literal: true

require 'gepub'

def generate_epub(url, title, author, contributors, chapters)
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
        <body class="center">
          <img alt="cover" src="../Images/cover.png"/>
        </body>
      </html>
    COVER

    book.add_item('Text/message.xhtml').add_content(StringIO.new(<<~MESSAGE.chomp))
      <?xml version="1.0" encoding="utf-8"?>
      <!DOCTYPE html>
      <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops">
      <head>
        <link href="../Styles/style.css" rel="stylesheet" type="text/css"/>
        <title>制作信息</title>
      </head>
      <body>
        <p>仅供个人学习交流使用，禁作商业用途。</p>
        <br>
        <div>
          <p>古诗文网　gushiwen.cn</p>
          <p>制　　作　陈　刑</p>
        </div>
      </body>
      </html>
    MESSAGE

    chapters.each_with_index do |chapter, index|
      item_href = "Text/#{index}.xhtml"
      content = chapter[1]
      book.add_item(item_href).add_content(StringIO.new(content))
    end
  end

  file = "#{title}.epub"
  book.generate_epub(file)
  puts "#{title}.epub created"
end
