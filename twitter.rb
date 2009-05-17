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

class Twitter

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

  def initialize(account_id, username, password)
    @account_id = account_id
    @username = username
    @password = password
  end

  def get_statuses_per_page
    return 20
  end

  def fetch_page_of_statuses(page)
    Net::HTTP.start('twitter.com') do |http|
      req = Net::HTTP::Get.new("/statuses/user_timeline.xml?page=#{page}")
      req.basic_auth @username, @password
      resp = http.request(req)
      doc = REXML::Document.new resp.body
      if block_given?
        REXML::XPath.each(doc, '//statuses/status') do |status|
          tweet = Tweet.new status
          tweet.id = status.elements['id'].text
          tweet.text = status.elements['text'].text
          tweet.time = DateTime.parse status.elements['created_at'].text
          yield tweet
        end
      else
        return doc
      end
    end
  end

end
