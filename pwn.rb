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

require File.dirname(__FILE__) + '/twitter'
require File.dirname(__FILE__) + '/search'

require 'sqlite3'
require 'logger'
require 'rexml/document'
require 'date'

class Pwn

  def self.setup
    begin
      db = SQLite3::Database.new 'db/pwn.db'
      db.execute_batch <<-SQL
        create table users (
          id integer primary key
        );
        create table accounts (
          id integer primary key,
          user_id integer not null,
          service string not null,
          credentials string
        );
        create table tweets (
          id integer primary key,
          account_id integer not null,
          twitter_id integer not null,
          tweet_text string not null,
          tweet_time datetime not null,
          path string not null
        );
        create table segments (
          id integer primary key,
          account_id integer not null,
          tweet_count integer not null,
          start_time datetime not null,
          end_time datetime not null
        );
      SQL
    ensure
      db.close unless db.nil?
    end
  end

  def self.teardown
    begin
      db = SQLite3::Database.new 'db/pwn.db'
      db.execute_batch <<-SQL
        drop table users;
        drop table accounts;
        drop table tweets;
        drop table segments;
      SQL
    ensure
      db.close unless db.nil?
    end
  end

  def initialize(twitter)
    @twitter = twitter
  end

  attr_reader :pwn_stats
  attr_reader :tweet_count
  attr_reader :segment_count

  def pwn
    begin
      db = SQLite3::Database.new 'db/pwn.db'
      log = Logger.new 'log/pwn.log'
      @page = 1
      @pwn_stats = []
      @pages_pwned = []
      @last_segment = nil
      pwn2 @twitter.account_id, db, log
      pwn2 @twitter.account_id, db, log
    ensure
      db.close unless db.nil?
      log.close unless log.nil?
    end
  end

  def pwn2(account_id, db, log)

    log.info "pwning #{@twitter.class.to_s} for page #{@page}"

    @pages_pwned << @page

    @last_segment ||= nil
    overlaps_begin = false
    overlaps_end = false
    tweet_count = 0
    start_time = nil
    end_time = nil

    @twitter.fetch_page_of_statuses(@page) do |status|
      end_time = status.time if end_time.nil?
      start_time = status.time
      if db.execute('select id from tweets where account_id = ? and twitter_id = ?', account_id, status.id).empty?
        fname = "data/#{@twitter.class.to_s.downcase}-#{status.id}"
        db.execute('insert into tweets values (NULL, ?, ?, ?, ?, ?)', account_id, status.id, status.text, status.time, fname)
        File.open(fname, 'w') { |f| f.write(status) }
        tweet_count += 1
      else
        overlaps_end = true if tweet_count < 1
        overlaps_begin = true if tweet_count > 0
      end
    end

    # If end_time or start_time is nil then return; there were no
    # tweets on this page.  The @pwn_stats duplicates some
    # functionality below.  This function really needs one exit
    # point.
    if start_time.nil? || end_time.nil?
      row = db.execute('select count(*) from tweets where account_id = ?', account_id)
      log.info "tweet count = #{row[0][0].to_i}"
      row = db.execute('select count(*) from segments where account_id = ?', account_id)
      log.info "segment count = #{row[0][0].to_i}"
      @pwn_stats << {:page => @page, :tweet_count => 0}
      return
    end

    # check for overrun
    if @last_segment
      row = db.execute('select id from segments where id = ? and end_time > ?', @last_segment, end_time)
      @last_segment = nil if row.empty?
    end

    # update segments
    if @last_segment
      db.execute('update segments set tweet_count = tweet_count + ?, start_time = ? where id = ?', tweet_count, start_time, @last_segment)
    end

    if !@last_segment && !overlaps_end && !overlaps_begin
      db.execute('insert into segments values (NULL, ?, ?, ?, ?)', account_id, tweet_count, start_time, end_time)
      @last_segment = db.last_insert_row_id
    end

    if overlaps_end && !@last_segment
      row = db.execute('select id from segments where account_id = ? and start_time <= ? and start_time >= ?', account_id, end_time, start_time)
      if !row.empty?
        db.execute('update segments set tweet_count = tweet_count + ?, start_time = ? where id = ?', tweet_count, start_time, row[0][0].to_i)
      end
      row = db.execute('select id from segments where account_id = ? and start_time < ?', account_id, end_time)
      if !row.empty?
        @last_segment = row.last[0].to_i
      end
    end

    if overlaps_begin
      row = db.execute('select id from segments where account_id = ? and end_time >= ? and end_time <= ?', account_id, start_time, end_time)
      if !row.empty?
        db.execute('update segments set tweet_count = tweet_count + ?, end_time = ? where id = ?', tweet_count, end_time, row[0][0].to_i)
      end
      row = db.execute('select id from segments where account_id = ? and end_time > ?', account_id, start_time)
      if !row.empty?
        @last_segment = row[0][0].to_i
      end
    end

    # detect overlap of segments and fix
    row = db.execute('select * from segments where account_id = ? and (start_time = ? or end_time = ?)', account_id, start_time, end_time)
    if row.length > 1
      db.execute('insert into segments values (NULL, ?, ?, ?, ?)', account_id, row[0][2].to_i + row[1][2].to_i - tweet_count, row[0][3], row[1][4])
      @last_segment = db.last_insert_row_id
      db.execute('delete from segments where account_id = ? and (start_time = ? or end_time = ?)', account_id, start_time, end_time)
    end

    row = db.execute('select count(*) from tweets where account_id = ?', account_id)
    @tweet_count = row[0][0].to_i
    log.info "tweet count = #{@tweet_count}"
    row = db.execute('select count(*) from segments where account_id = ?', account_id)
    @segment_count = row[0][0].to_i
    log.info "segment count = #{@segment_count}"

    @pwn_stats << {:page => @page, :tweet_count => tweet_count, :overlaps_begin => overlaps_begin, :overlaps_end => overlaps_end}

    # calculate next page
    if overlaps_end
      row = db.execute('select tweet_count from segments where account_id = ? and start_time <= ?', account_id, end_time)
      x = row.last[0].to_i / @twitter.get_statuses_per_page - 1
      x = x > 0 ? x : 0
      @page += x
    end
    if overlaps_begin
      row = db.execute('select tweet_count from segments where account_id = ? and end_time > ?', account_id, start_time)
      x = row[0][0].to_i / @twitter.get_statuses_per_page - 1
      x = x > 0 ? x : 0
      @page += x
    end

    @page += 1

  end

end
