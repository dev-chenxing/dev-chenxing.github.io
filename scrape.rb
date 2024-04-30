# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
load 'create_epub.rb'

def scrape_chapter(url)
  response = HTTParty.get(url)
  return unless response.code == 200

  document = Nokogiri::HTML4(response.body)

  container = document.css('.cont')
  title = container.css('b').text
  body = container.css('.contson').children.to_s.strip
  puts body
  [title, body]
end

def parse_chapter_a(chapter_a, base_url)
  chapter_title = chapter_a.text
  return unless chapter_title != '跋'

  url = base_url + chapter_a.attribute('href')
  puts "下载 #{chapter_title} 中 ( #{url} )"
  scrape_chapter(url)
end

def scrape(book_url, base_url, title, author, contributors)
  response = HTTParty.get(book_url)
  return unless response.code == 200

  body = []
  Nokogiri::HTML4(response.body).css('span a').each do |chapter_a|
    chapter = parse_chapter_a(chapter_a, base_url)
    body.push(chapter) if chapter
  end
  generate_epub(book_url, title, author, contributors, body)
end

book_url = 'https://so.gushiwen.cn/guwen/book_46653FD803893E4FECEF70A63E964959.aspx'
base_url = 'https://so.gushiwen.cn'
book_title = '女仙外史'
author = '吕熊'
contributors = %w[古诗文网 陈刑]
scrape(book_url, base_url, book_title, author, contributors)
