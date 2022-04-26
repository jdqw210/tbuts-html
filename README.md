# tbuts-html - twint batch user tweetgrabber & search (html output)
A bash script utilizing twint and tree to read .txt files of twitter usernames and search terms (respectively) and output tweets as .html file(s) with an index
 
This script requires 

	twint, see https://github.com/twintproject/twint for info
	(I would recommend installing this via pip install twint instead of git clone)

	tree, see https://linux.die.net/man/1/tree for info
 
Usage:

	sh tbuts-html.sh usernames.txt searchterms.txt

	Create a .txt file in the main directory and add twitter usernames you would like to search terms for, one per line.
	
	Create another .txt file in the main directory and add terms to search each twitter account for, one per line.

Example: 

	sh tbuts-html.sh users.txt search.txt

After the script completes, you should have a directory and files structured as such:

	[ 20K]    .
	├── [4.0K]    username1
	│   ├── [  81]    username1-searchterm1.txt
	│   ├── [3.2K]    username1-searchterm2.txt
	│   ├── [4.1K]    username1-tweets-searchterm1.html
	│   └── [7.5K]    username1-tweets-searchterm2.html
	├── [4.0K]    username2
	│   ├── [ 410]    username2-searchterm1.txt
	│   ├── [2.3K]    username2-searchterm2.txt
	│   ├── [4.4K]    username2-tweets-searchterm1.html
	│   └── [6.6K]    username2-tweets-searchterm2.html
	├── [4.0K]    username3
	│   ├── [ 354]    username3-searchterm1.txt
	│   ├── [ 644]    username3-searchterm2.txt
	│   ├── [4.4K]    username3-tweets-searchterm1.html
	│   └── [4.7K]    username3-tweets-searchterm2.html

.......etc.

In the top directory you should find tweets.html, this is the main browseable index page.


Update 2022-04-26: If you encounter the error:

	ImportError: cannot import name 'CeilTimeout' from 'aiohttp.helpers'
	
Try installing aiohttp==3.7.0 by running:

	pip install aiohttp==3.7.0