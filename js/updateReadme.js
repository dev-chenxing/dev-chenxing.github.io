const fs = require("fs");

const path = "books/epub";

const books = fs.readdirSync(path);

const getBookLink = (file) => {
    return `${path}/${file}`;
};

const getTableOfBooks = () => {
    let tableOfBooks = "";
    tableOfBooks += "|   |   |   |   |\n";
    tableOfBooks += "|---|---|---|---|\n";

    for (const index in books) {
        const book = books[index];
        const link = getBookLink(book);
        if (index % 4 == 0) {
            tableOfBooks += `|[${book}](${link})|`;
        } else if (index % 4 == 3) {
            tableOfBooks += `[${book}](${link})|\n`;
        } else {
            tableOfBooks += `[${book}](${link})|`;
        }
    }
    return tableOfBooks;
};

const translate2Chinese = (number) => {
    const digits = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
    const positions = ["", "十", "百", "千", "万"];
    const charArray = String(number).split("");
    const numberOfDigits = charArray.length;
    const firstChar = charArray[0];
    let result = "";
    if (firstChar == "0") {
        result += "零";
    } else if (firstChar == "1") {
        if (numberOfDigits == 1) {
            result += digits[Number(firstChar)];
        } else {
            result += positions[numberOfDigits - 1];
        }
    } else {
        result += digits[Number(firstChar)] + positions[numberOfDigits - 1];
    }

    if (numberOfDigits > 1) {
        if (!charArray.slice(1, numberOfDigits).every((element) => element == "0")) {
            result += "余";
        }
    }

    return result;
};

const generateReadme = () => {
    const fileName = "README.md";

    let content = "# 📚 [罗列书柜](https://amaliegay.github.io)\n\n";
    content += "> 我书架上有的是书，你可随意取一本去\n>\n> 　　　　　　　　　——「醒世恒言·卷三十八」\n\n";

    const numberOfBooks = translate2Chinese(books.length);
    content += `### 吾家藏书${numberOfBooks}卷\n\n`;

    const tableOfBooks = getTableOfBooks();
    content += tableOfBooks;
    content += "\n\n";

    content += "## How to use\n\n";
    content += "A set of scripts for downloading books from https://www.gushiwen.cn, and generating EPUBs.\n\n";
    content += "You need the following dependencies:\n\n";
    content += "- [Ruby](https://rubyinstaller.org/)\n";
    content += "- Run `bundle install` to install gem dependencies\n";
    content += "- Bash, or [Git Bash](https://git-scm.com/downloads)\n";
    content += "- [ImageMagick](https://imagemagick.org/script/download.php)\n\n";
    content += "(Optional) `print_to_pdf.sh` script requires [MuPDF](https://mupdf.com/releases/index.html)\n\n";

    content += "### To scrape books\n\n";
    content += "- Add your list of books to scrape to `booklist.csv`\n";
    content += "  - in the format of `url,title,author`\n";
    content += "  - for example, `https://so.gushiwen.cn/guwen/book_46653FD803893E4FECEF70A63E964959.aspx,女仙外史,吕熊`\n";
    content += "  - `url` is the table of contents page of the book\n";
    content += "  - **`author` must not be empty**. If the author is unknown, use `佚名`\n";
    content += "  - **`booklist.csv` must ends with empty last line**\n";
    content += "- Run `sh scrape.sh`\n";
    content += "- The books scraped will be stored in `books`\n\n";

    content += "## 关于我\n\n";
    content += "陈刑，生卒年不详，南海（今广东广州）人。因屡试不第，常流连网络撰写代码。\n";

    fs.writeFileSync(fileName, content);
};

generateReadme();
