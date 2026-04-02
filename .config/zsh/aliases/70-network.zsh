alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | perl -nle'/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)/ && print $1'"
alias whois='whois -h whois-servers.net'

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

unset method
