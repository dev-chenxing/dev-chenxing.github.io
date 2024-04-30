require 'httparty'
require 'nokogiri'
require 'csv'

def scrape_chapter(url)
  response = HTTParty.get(url)
  if response.code == 200
    document = Nokogiri::HTML4(response.body)

    container = document.css('.cont')
    title = container.css('b').text
    body = container.css('.contson').children.to_s.strip
    puts body
    chapter = [title, body]
    return chapter
  end
end

def scrape(book_url, base_url, title)
  response = HTTParty.get(book_url)
  if response.code == 200
    CSV.open(
      title + '.csv',
      'w+',
      write_headers: false,
      headers: %w[Title, Body]
    ) do |csv|
      document = Nokogiri::HTML4(response.body)

      book_container = document.css('.bookcont')
      chapters_to_scrape = book_container.css('span a')
      chapters_to_scrape.each do |chapter_a|
        chapter_title = chapter_a.text
        if chapter_title != "跋"
          url = base_url + chapter_a.attribute("href")
          puts '下载 ' + chapter_title + ' 中 (' + url + ')'
          chapter = scrape_chapter(url)
          csv << chapter
        end
      end
    end
  end
end

book_url = 'https://so.gushiwen.cn/guwen/book_46653FD803893E4FECEF70A63E964959.aspx'
base_url = 'https://so.gushiwen.cn'
book_title = '女仙外史'
scrape(book_url, base_url, book_title)
