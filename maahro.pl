#!/usr/bin/perl
# *************************************************************************************** #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#                     Agreement between "Haroon Awan" and "You"(user).                    #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#  1. By using this piece of software your bound to these point.                          #
#  2. This an End User License Agreement (EULA) is a legal between a software application #
#     author "Haroon Awan" and (YOU) user of this software.                               #
#  3. This software application grants users rights to use for any purpose or modify and  #
#     redistribute creative works.                                                        #
#  4. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#     what you do with by/this software as your free to use this software.                #
#  5. Any other purpose(s) that it suites as long as it is not related to any kind of     #
#     crime or using it in un-authorized environment.                                     #
#  6. You can use this software to protect and secure your data information in any        #
#     environment.                                                                        #
#  7. It can also be used in state of being protection against the unauthorized use of    #
#     information.                                                                        #
#  8. It can be used to take measures achieve protection.                                 #
# *************************************************************************************** #

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
print "[ + ] License: 		EULA\n";
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
print "[ + ] Enter OSINT word file : ";
chomp(my $filename = <STDIN>);
print "[ + ] Please wait, contacting target using dictionary attack to find sub domains\n";
print "[ + ] Verfying and writing sub domains data in subdomains.txt\n";
print "[ + ] Generating sub domains list: ";
sleep (1);
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
print "\n";
print "[ + ] Done\n";
print "\n[ + ] Enumerating all possible aliases and cname records\n";
$cleaner = system("./cleaner.sh");
$sysc = system("dig -f subdomains ANY | awk '/CNAME/ {print}'");
print "[ + ] Enumerated all possible aliases and cname records\n";
print color('reset');
print "\n\n";
exit;
