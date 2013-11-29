require_relative 'scraper'

class UpworthyScraper < Scraper

  def scrape_page(i)
    doc = Nokogiri::HTML(open("http://www.upworthy.com/page/#{i}"))
    doc.css('.nugget-info h3 a').each do |link|
      add_headline! link.content
    end
  end

end

UpworthyScraper.new.scrape!