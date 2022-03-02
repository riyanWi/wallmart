html = Nokogiri.HTML(content)

products = html.css('div.flex-wrap div.mb1.ph1')

products.each do |product|
    url = product.at_css('a')['href']
    if url
        urlfull = URI.join('https://www.walmart.com', url).to_s
        pages << {
            url: urlfull,
            page_type: 'products',
            method: "GET",
            headers: {
                "accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
                "sec-ch-ua" => '"Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"'
            },
            fetch_type: "browser",
        }
    end
end

page_links = html.css('[aria-label="pagination"] li a')

page_links.each do |link|
    url = link['href']
    if url
        urlfull = URI.join('https://www.walmart.com', url).to_s
        pages << {
            url: urlfull,
            page_type: 'listings',
            method: "GET",
            headers: {
                "accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
                "sec-ch-ua" => '"Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"'
            },
            fetch_type: "browser",
        }
    end
end
