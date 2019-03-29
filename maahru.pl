#!/usr/bin/env perl
use LWP::UserAgent;
no warnings 'uninitialized';
use Term::ANSIColor;
$ua = LWP::UserAgent->new();
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.9.1) Gecko/20090624 Firefox/3.5");
system "clear";
print color('bold red');
print "\n\n					   	 	    Project\n";
print "\n 						          : Maahro :\n\n\n";
print color('bold yellow');
print "[ + ] Programmer: 	Haroon Awan\n";
print "[ + ] License: 		GNU\n";
print "[ + ] Version: 		1.0\n";
print "[ + ] Contact: 		mrharoonawan\@gmail\.com \n";
print "[ + ] Environment: 	Shell & Perl under Kali\n";
print "[ + ] Github: 		Https://www.github.com/haroonawanethicalhacker\n";
print "[ + ] Design Scheme: 	Enumerate sub domains and automatically find all aliases and cname records for possible takeover\n";
print "[ + ] Usage: 		$0 url.com\n\n\n";
print color('reset');
print color('bold green');
$site="$ARGV[0]";
print "[ + ] Enter Domain : "; 
chomp(my $site = <STDIN>);
print "\n[ + ] Enter OSINT word file : ";
chomp(my $filename = <STDIN>);
sleep (1);
print "\n[ + ] Contacting target ...\n";
sleep (1);
print "\n[ + ] Please wait, using brute force\n";
print "\n[ + ] Verfying and writing sub domains data in subdomains.txt\n";
if (length $site) {
open("subdomainslist",$filename);
while(<subdomainslist>)     {
chomp($_);
$sub = $_;
$url=$address='http://'.$sub.'.'.$site;
$req = $ua->get("$url");
if ($req->is_success)   {
print "\n$url";
open("save",">>subdomains.txt");
print save "$url\n";
close("sav");
                  }
                            }
close("subdomainslist");
                        }
print "\n[ + ] Done\n";
print "\n[ + ] Enumerating all possible cname records\n";
$cleaner = system("./cleaner.sh");
$sysc = system("dig -f subdomains ANY | awk '/CNAME/ {print}'");
print "\n[ + ] Finished, enumerated all possible aliases and cname records\n";
print color('reset');
print "\n";
exit;