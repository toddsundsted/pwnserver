=begin

Pwnserver gets your data.
Copyright (C) 2009 Todd Sundsted

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

=end

require 'net/http'
require 'rexml/document'
require 'date'

class Search

  class Tweet

    attr_accessor :id, :text, :time

    def initialize(body)
      @body = body
    end

    def to_s
      @body.to_s
    end

  end

  attr_reader :account_id

  def initialize(account_id)
    @account_id = account_id
  end

  def get_statuses_per_page
    return 40
  end

  def fetch_page_of_statuses(page)
    Net::HTTP.start('search.twitter.com') do |http|
      req = Net::HTTP::Get.new("/search.atom?q=coworking&rpp=40&page=#{page}")
      resp = http.request(req)
      doc = REXML::Document.new resp.body
      if block_given?
        REXML::XPath.each(doc, '//feed/entry') do |status|
          tweet = Tweet.new status
          tweet.id = status.elements['id'].text.split(':')[2]
          tweet.text = status.elements['title'].text
          tweet.time = DateTime.parse status.elements['published'].text
          yield tweet
        end
      else
        return doc
      end
    end
  end

end
