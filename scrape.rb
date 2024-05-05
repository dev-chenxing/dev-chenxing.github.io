# frozen_string_literal: true

require 'csv'
require 'httparty'
require 'nokogiri'
load 'create_epub.rb'
load 'utils.rb'

def scrape_chapter(url)
  response = HTTParty.get(url)
  return unless response.code == 200

  document = Nokogiri::HTML4(response.body)

  container = document.css('.cont')
  title = container.css('b').text
  content = '<div>'
  content += "<h1>#{container.css('b').first.parent}</h1>"
  content += container.css('.contson').to_s.strip
  content += '</div>'
  puts content
  [title, content]
end

def parse_chapter_a(chapter_a, base_url)
  chapter_title = chapter_a.text
  return unless chapter_title != '跋'

  url = base_url + chapter_a.attribute('href')
  puts "下载 #{chapter_title} 中 ( #{url} )"
  scrape_chapter(url)
end

def create_csv(book_url, title, base_url)
  response = HTTParty.get(book_url)
  return unless response.code == 200

  body = []
  CSV.open(get_file_path(title, 'csv'), 'w+', write_headers: false, headers: %w[Title Body]) do |csv|
    Nokogiri::HTML4(response.body).css('span a').each do |chapter_a|
      chapter = parse_chapter_a(chapter_a, base_url)
      if chapter
        body.push(chapter)
        csv << chapter
      end
    end
  end
  body
end

def read_csv(title)
  body = []
  file = File.expand_path(get_file_path(title, 'csv'), __dir__)
  CSV.foreach(file) do |chapter|
    body.push(chapter)
  end
  body
end

def scrape(book_url, base_url, title, author, contributors)
  body = if File.exist?(get_file_path(title, 'csv'))
           read_csv(title)
         else
           create_csv(book_url, title, base_url)
         end
  # body = create_csv(book_url, title, base_url)
  generate_epub(book_url, title, author, contributors, body)
end

base_url = 'https://so.gushiwen.cn'
contributors = %w[古诗文网 陈刑]

booklist = File.expand_path('booklist.csv', __dir__)
CSV.read(booklist).each do |book_data|
  book_url = book_data[0]
  book_title = book_data[1]
  author = book_data[2]
  scrape(book_url, base_url, book_title, author, contributors)
end
