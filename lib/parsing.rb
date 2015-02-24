require 'open-uri'
require 'nokogiri'

def analyse(url)
  doc = Nokogiri::HTML(open(url))
  doc.css(".post-entry").to_s
end

def search_name(text)
  text.split(" ").select{|mot| mot[0] =~ /[A-Z]/}.join(" ")
end
