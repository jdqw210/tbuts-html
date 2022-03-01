# --!/bin/sh

# --if user calls script incorrectly, let them know how to call it:
if [ $# -ne 2 ];
then
	echo "[:] Usage: $0 usernames.txt searchterm";
	exit -1
fi
# --ask user to confirm start of script, define variable $resp:
echo ""
read -p "[:] twint batch user tweetgrabber & search, shall we begin? (y/n) " resp
echo ""
# --if user enters 'y', begin loops to read/search tweets and save them:
if [ "$resp" = "y" ]; then
	# --create dir for search results/files:
	mkdir -p ~/tbuts-html/results
	cd ~/tbuts-html/results
	# --define variable $lines as each line in a file $1, and start for loop:
	lines=$(cat ../$1)
	for line in $lines;
		do
			# --tell the user what we are currently searching for:
			echo "[:] searching username $line, searchterm is $2..."
			# --create folder for current username
			mkdir -p ~/tbuts-html/results/$line
			# --use twint to return tweets matching our criteria, and output it to a .txt file:
			twint -s $2 -u $line >> ~/tbuts-html/results/$line/$line-$2.txt
			# --add necessary static html tags and css styles to the .html file for current search:
			echo "<!DOCTYPE html><html><head><meta charset="utf-8"><title>tweets from @"$line" - search term: "$2"</title><meta name="viewport" content="initial-scale=1.0"><style type="text/css" media="screen">html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,b,u,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}blockquote,q{quotes:none}blockquote::before,blockquote::after,q::before,q::after{content:"";content:none}table{border-collapse:collapse;border-spacing:5}body{background-color:#fff;color:#444;font-family:Consolas;line-height:1.7;-ms-content-zooming:none;margin-bottom:64px}h1,h2,h3,h4,h5,h6{font-weight:600;margin:.2em 0}article h1,article h2,article h3,article h4,article h5,article h6{text-align:left;line-height:1.3}h1{font-size:1.4em}h2{font-size:1.3em}h3,h4{font-size:1.2em}h5,h6{font-size:1.1em}p{margin-bottom:.75em}b,strong{font-weight:bold}i,em{font-style:italic}a{color:#444;text-decoration:underline}a:active,a:hover{outline:0}p,ul,ol,dl{margin:0 0 1.75em}ul,ol{padding-left:1.25em}li{padding-bottom:.2em;line-height:1.6}li p:last-child,li li:last-child{margin-bottom:-0.2em}ul li:last-child,ol li:last-child{padding-bottom:0}iframe,video{max-width:100%;height:auto}mark{padding:0 .2em}mark a{text-decoration:none}blockquote{font-style:italic;border-left:.25em solid #000;margin-left:-20px;padding-left:17px;margin-bottom:.5em;margin-top:.5em}blockquote cite{text-transform:uppercase;font-size:.8em;font-style:normal}blockquote cite::before{content:"â€”";margin-right:.5em}img{display:block;height:auto;margin-bottom:.5em;max-width:50%;padding-left:15px;padding-right:15px}figure{margin:0}figure figcaption{display:block;margin-top:.3em;font-style:italic;font-size:.8em}button{display:none !important}hr{display:block;height:1px;border:solid #666;border-width:1px 0 0;margin:1.6em 0;padding:0}small{font-size:.7em}dl{margin:1.6em 0}dl dt{float:left;width:11.25em;overflow:hidden;clear:left;text-align:right;-ms-text-overflow:ellipsis;text-overflow:ellipsis;white-space:nowrap;font-weight:bold;margin-bottom:1em}dl dd{margin-left:12.5em;margin-bottom:1em}pre{box-sizing:border-box;margin:4em 0;border:.0625em solid #efefef;width:100%;padding:1em;font-family:Consolas,monospace;white-space:pre;overflow:auto}pre code{font-size:.8em;line-height:1.6em;white-space:pre-wrap;background:transparent;border:none;padding:0;vertical-align:inherit}code{padding:.125em .375em;margin:0 .2em;font-family:Consolas,monospace;font-size:.8em;white-space:pre;border:1px solid #d3d3d3;overflow:auto}audio,video{max-width:43.75em}::-moz-selection{background:#666;color:#fff}::selection,mark{background:#666;color:#fff}table{border-collapse:collapse;margin-bottom:2em;width:100%}th,td{padding:.75em;text-align:left}thead tr{text-transform:uppercase;font-size:.85em;letter-spacing:1px;font-family:"Segoe UI",sans-serif;font-weight:600}tbody tr:nth-child(2n+1){background:rgba(0,0,0,.1)}tbody{border:solid #999;border-width:1px 0}figure{text-align:center}figure>*{margin:0 auto}header{text-align:center}.shared-by{margin-bottom:1em}@media(max-width: 719px){header>*:not(.preview),article{padding:0 1em}}@media(min-width: 720px){blockquote{margin-left:-1.4375em;padding-left:1.25em}header{margin-top:32px}.block{margin-left:auto;margin-right:auto;max-width:43.75em;padding:0 1.25em}}</style></head><body><header class="block"><h1>tweets from "$line" - search term: "$2"</h1><a href="https://nitter.net/$line" target="_blank" rel="noopener" class="tool">@"$line" - nitter.net</a></header><br><article class="block"><ul>" >> ~/tbuts-html/results/$line/$line-tweets-$2.html
			# --remove <, >, and whitespaces from returned tweet using sed, then pipe it to a while loop in the variable $tweet:
			sed -e 's/</<b>/g' -e 's/>/<\/b><br>/g' -e 's/<b<\/b><br>/<b>/g' -e '/^[ \t\r\n]*$/d' ~/tbuts-html/results/$line/$line-$2.txt | while read tweet; do
				# --output returned tweet to console for viewing:
				echo "$tweet"
				# --add html tags to returned tweet and output it to the .html file:
				echo "<li><p class="MsoQuote c23">"$tweet"</p></li><br>" >> ~/tbuts-html/results/$line/$line-tweets-$2.html
			# --finished loop:
			done
			# --add necessary static html tags to the end of the .html file:
			echo "</article></ul></body></html>" >> ~/tbuts-html/results/$line/$line-tweets-$2.html
			# --remove .txt files for less clutter in index:
			rm ~/tbuts-html/results/$line/*.txt
			# --tell user where the output(s) are located:
			echo "[:] .txt output is ~/tbuts-html/results/$line/$line-$2.txt"
			echo "[:] .html output is ~/tbuts-html/results/$line/$line-tweets-$2.html"
			echo ""
		# --loop complete:
		done
		# --remove old tweets.html index file:
		rm ./tweets.html
		# --let the user know the .html index tree is being generated:
		echo "[:] creating HTML index tree..."
		# --use tree to create an index for the directory and file structure:
		tree -h -H . >> tweets.html
		echo ""
		echo "[:] index tree complete."
	# --let user know the script has finished:
	echo "[:] tbuts-html task complete."
	echo ""
else
	echo "[:] exiting..."
	exit -1
fi