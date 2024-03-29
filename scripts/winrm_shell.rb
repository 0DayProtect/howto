#!/usr/bin/ruby

# Description:
#
# Ruby script that calls an almost interactive shell via WinRM (TCP/5985) on an Windows machine.

# Dependencies:
# gem install winrm

# Author: Sh11td0wn (Github)

#          *** Do NOT use this for illegal or malicious use ***                     
#      By running this, YOU are using this program at YOUR OWN RISK.                 
#  This software is provided "as is", WITHOUT ANY guarantees OR warranty. 
# ./winrm_shell.rb -h
# ruby winrm_shell.rb -s x.x.x.x -d domain -u Administrator -p test1test!

# Modules
require 'winrm'
require 'optparse'

# Options handling
options = {}
OptionParser.new do |parser|

	parser.banner = "
    Description:

    Ruby script that calls an almost interactive shell via WinRM (TCP/5985) on an Windows machine.

    Usage: ./winrm_shell.rb [options]

    Example:
    ./winrm_shell.rb -s 192.169.0.5 -d contoso.com -u bob -p 'P@ssw0rd'

    Obs. Options --server, --user and --password are REQUIRED!

    Options:
	"

   	parser.on("-h", "--help", "Show this help message") do ||
		puts parser
		puts
		exit
  	end
	# Whenever we see -f or --foo, with an argument, save the argument.
	parser.on("-s", "--server SERVER", "The server hostname or IP address.") do |v|
    	options[:server] = v
	end
	
	parser.on("-d", "--domain DOMAIN", "The domain name.") do |v|
    	options[:domain] = v
	end
	  
	parser.on("-u", "--user USER", "The username.") do |v|
    	options[:user] = v
	end
	
	parser.on("-p", "--password PASSWORD", "The user's plain text password or NTLM hash.") do |v|
    	options[:password] = v
	end
end.parse!

# WinRM connection
conn = WinRM::Connection.new(
  endpoint: "http://#{ options[:server] }:5985/wsman",
  user: "#{ options[:domain] }\\#{ options[:user] }",
  password: "#{ options[:password] }",
)

# Almost interactive shell (changes directory successfully)
command=""
conn.shell(:powershell) do |shell|
    until command == "exit\n" do
        output = shell.run("-join($id,'PS ',$(whoami),'@',$env:computername,' ',$((gi $pwd).Name),'> ')")
        print(output.output.chomp)
        command = gets        
        output = shell.run(command) do |stdout, stderr|
            STDOUT.print stdout
            STDERR.print stderr
        end
    end    
    puts "Exiting with code #{output.exitcode}"
end
