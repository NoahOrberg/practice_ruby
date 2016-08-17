#!/Users/reo/.rbenv/shims/ruby
require 'nokogiri'
require 'open-uri'
class Main
    def initialize
        doc= Nokogiri::HTML(open(ARGV[0]))
        objects= doc.xpath('//img')
        objects.map{|i| i.to_s[/http:.*?\.[pjg][npi][gf]/]}.delete_if{|item| item=~/.*%.*/}.compact!.each{|url|
            open(url[/[a-zA-Z0-9]+?\.[pjg][npi][gf]/],'wb'){|saved_file|
                open(url){|read_file|
                    saved_file.write(read_file.read)
                }
            }
        }
    end
end
Main.new
