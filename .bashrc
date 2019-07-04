export PATH=$PATH:"/D/git/bin"
export PATH=$PATH:"/D/git/usr/bin"
export PATH=$PATH:"/D/pandoc"
export PATH=$PATH:"/D/doc"


function setproxy() 
	{
    export {http,https}_proxy='http://172.20.93.28:3128'

}



function unsetproxy() 
	{
    unset {http,https}_proxy
}

alias ls='ls -la --color -h --group-directories-first'
alias doc='cd /c/Users/czpujp01/Documents'
alias panmark='pandoc -s --toc -H style.css index.md -o index.html'
# pandoc -s --toc -H style.css environment.md -o environment.html --metadata title=Blah

