# tbuts-html - twint batch user tweetgrabber & search (html output)
A bash script utilizing twint to read a .txt file of twitter usernames and output tweets as .html file(s)
 
This script requires 

	twint, see https://github.com/twintproject/twint for info

	tree, see https://linux.die.net/man/1/tree for info
 
Usage:

	sh tbuts-html.sh usernames.txt searchterm

	Create a .txt file in the main directory and add twitter usernames you would like to search, one per line.

	Execute script and enter a term to search for.

Example: 

	sh tbuts-html.sh users.txt freedom

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

Running the script multiple times with the same usernames in the usernames.txt file should automatically put the result files into their respective folders, as long as the entries are spelled the same (ie. uppercase, lowercase matches).