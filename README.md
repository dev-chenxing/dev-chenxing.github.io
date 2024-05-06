# :books: [罗列书柜](https://amaliegay.github.io)

> 我书架上有的是书，你可随意取一本去
> 
> 　　　　　　　　　——「醒世恒言·卷三十八」

### 吾家藏书五十余卷

:blue_book: 电子书51册

## How to use

A set of scripts for downloading books from https://www.gushiwen.cn, and generating EPUBs. 

You need the following dependencies:

- [Ruby](https://rubyinstaller.org/)
- Run `bundle install` to install gem dependencies
- Bash, or [Git Bash](https://git-scm.com/downloads)
- [ImageMagick](https://imagemagick.org/script/download.php)

The optional `print_to_pdf.sh` script requires [MuPDF](https://mupdf.com/releases/index.html)

### To scrape books

- Add your list of books to scrape to `booklist.csv`
    - in the format of `url,title,author`
    - for example, `https://so.gushiwen.cn/guwen/book_46653FD803893E4FECEF70A63E964959.aspx,女仙外史,吕熊`
    - `url` is the table of contents page of the book
    - **`author` must not be empty**. If the author is unknown, use `佚名`
    - **`booklist.csv` must ends with empty last line**
- Run `sh scrape.sh`
- The books scraped will be stored in `books`

## 关于我
 
陈刑，生卒年不详，南海（今广东广州）人。因屡试不第，常流连网络撰写代码。
