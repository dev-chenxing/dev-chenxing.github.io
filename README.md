# 📚 [罗列书柜](https://amaliegay.github.io)

> 我书架上有的是书，你可随意取一本去
>
> 　　　　　　　　　——「醒世恒言·卷三十八」

### 吾家藏书五十余卷

|   |   |   |   |
|---|---|---|---|
|[三侠五义.epub](books/epub/三侠五义.epub)|[两晋演义.epub](books/epub/两晋演义.epub)|[何典.epub](books/epub/何典.epub)|[儒林外史.epub](books/epub/儒林外史.epub)|
|[儿女英雄传.epub](books/epub/儿女英雄传.epub)|[八仙得道传.epub](books/epub/八仙得道传.epub)|[刘公案.epub](books/epub/刘公案.epub)|[前汉演义.epub](books/epub/前汉演义.epub)|
|[北史演义.epub](books/epub/北史演义.epub)|[十二楼.epub](books/epub/十二楼.epub)|[南北史演义.epub](books/epub/南北史演义.epub)|[南史演义.epub](books/epub/南史演义.epub)|
|[后汉演义.epub](books/epub/后汉演义.epub)|[呼家将.epub](books/epub/呼家将.epub)|[女仙外史.epub](books/epub/女仙外史.epub)|[好逑传.epub](books/epub/好逑传.epub)|
|[孽海花.epub](books/epub/孽海花.epub)|[官场现形记.epub](books/epub/官场现形记.epub)|[小五义.epub](books/epub/小五义.epub)|[小八义.epub](books/epub/小八义.epub)|
|[常言道.epub](books/epub/常言道.epub)|[幻中游.epub](books/epub/幻中游.epub)|[新齐谐.epub](books/epub/新齐谐.epub)|[施公案.epub](books/epub/施公案.epub)|
|[春秋配.epub](books/epub/春秋配.epub)|[李公案.epub](books/epub/李公案.epub)|[林公案.epub](books/epub/林公案.epub)|[济公全传.epub](books/epub/济公全传.epub)|
|[海上花列传.epub](books/epub/海上花列传.epub)|[海国春秋.epub](books/epub/海国春秋.epub)|[狄公案.epub](books/epub/狄公案.epub)|[白牡丹.epub](books/epub/白牡丹.epub)|
|[红楼梦.epub](books/epub/红楼梦.epub)|[绣云阁.epub](books/epub/绣云阁.epub)|[绿野仙踪.epub](books/epub/绿野仙踪.epub)|[老残游记.epub](books/epub/老残游记.epub)|
|[老残游记续集.epub](books/epub/老残游记续集.epub)|[聊斋志异.epub](books/epub/聊斋志异.epub)|[花月痕.epub](books/epub/花月痕.epub)|[荡寇志.epub](books/epub/荡寇志.epub)|
|[薛丁山征西.epub](books/epub/薛丁山征西.epub)|[薛仁贵征东.epub](books/epub/薛仁贵征东.epub)|[薛刚反唐.epub](books/epub/薛刚反唐.epub)|[说唐演义全传.epub](books/epub/说唐演义全传.epub)|
|[说岳全传.epub](books/epub/说岳全传.epub)|[镜花缘.epub](books/epub/镜花缘.epub)|[阅微草堂笔记.epub](books/epub/阅微草堂笔记.epub)|[隋唐演义.epub](books/epub/隋唐演义.epub)|
|[雍正剑侠图.epub](books/epub/雍正剑侠图.epub)|[雷峰塔奇传.epub](books/epub/雷峰塔奇传.epub)|[鬼神传.epub](books/epub/鬼神传.epub)|

## How to use

A set of scripts for downloading books from https://www.gushiwen.cn, and generating EPUBs.

You need the following dependencies:

- [Ruby](https://rubyinstaller.org/)
- Run `bundle install` to install gem dependencies
- Bash, or [Git Bash](https://git-scm.com/downloads)
- [ImageMagick](https://imagemagick.org/script/download.php)

(Optional) `print_to_pdf.sh` script requires [MuPDF](https://mupdf.com/releases/index.html)

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
