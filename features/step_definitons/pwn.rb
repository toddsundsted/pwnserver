require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'pwn')
require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'twitter')
require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'search')

require 'spec/expectations'
require 'rexml/document'
require 'mocha'

doc = REXML::Document.new <<EOF
<statuses>
<status>
  <id>976871888</id>
  <text>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</text>
  <time>Mon Oct 27 02:55:38 +0000 2008</time>
</status>
<status>
  <id>940935248</id>
  <text>Sed tempus, diam sed euismod accumsan, eros diam pulvinar sem, a aliquam ante tellus ac mauris.</text>
  <time>Tue Sep 30 19:01:10 +0000 2008</time>
</status>
<status>
  <id>933522322</id>
  <text>Maecenas justo erat, congue eu, pulvinar sit amet, tempor nec, lectus.</text>
  <time>Wed Sep 24 21:08:02 +0000 2008</time>
</status>
<status>
  <id>933449446</id>
  <text>Mauris orci felis, bibendum a, congue ac, gravida nec, arcu.</text>
  <time>Wed Sep 24 20:06:18 +0000 2008</time>
</status>
<status>
  <id>933369970</id>
  <text>Nullam elit mi, vehicula non, pretium ac, pellentesque non, nibh.</text>
  <time>Wed Sep 24 18:59:07 +0000 2008</time>
</status>
<status>
  <id>932962496</id>
  <text>Proin nulla mauris, tincidunt eget, fringilla vel, mattis eget, lorem.</text>
  <time>Wed Sep 24 13:24:05 +0000 2008</time>
</status>
<status>
  <id>928821067</id>
  <text>Quisque vulputate erat.</text>
  <time>Sat Sep 20 23:14:02 +0000 2008</time>
</status>
<status>
  <id>919188540</id>
  <text>Sed vel neque id justo posuere consequat.</text>
  <time>Fri Sep 12 17:40:37 +0000 2008</time>
</status>
<status>
  <id>902212342</id>
  <text>Duis felis.</text>
  <time>Thu Aug 28 22:48:37 +0000 2008</time>
</status>
<status>
  <id>894633996</id>
  <text>Suspendisse dapibus mi rhoncus ipsum.</text>
  <time>Thu Aug 21 17:46:09 +0000 2008</time>
</status>
<status>
  <id>893914065</id>
  <text>Suspendisse potenti.</text>
  <time>Thu Aug 21 01:43:49 +0000 2008</time>
</status>
<status>
  <id>893589523</id>
  <text>Fusce magna.</text>
  <time>Wed Aug 20 19:17:56 +0000 2008</time>
</status>
<status>
  <id>893588303</id>
  <text>Curabitur quis est.</text>
  <time>Wed Aug 20 19:16:31 +0000 2008</time>
</status>
<status>
  <id>888801234</id>
  <text>Nullam pellentesque mattis magna.</text>
  <time>Fri Aug 15 19:56:54 +0000 2008</time>
</status>
<status>
  <id>867542486</id>
  <text>Mauris mauris pede, venenatis eu, congue ut, laoreet vitae, ipsum.</text>
  <time>Thu Jul 24 22:47:52 +0000 2008</time>
</status>
<status>
  <id>860730050</id>
  <text>Aenean tempus magna hendrerit ligula.</text>
  <time>Thu Jul 17 09:26:05 +0000 2008</time>
</status>
<status>
  <id>851577959</id>
  <text>Pellentesque suscipit lorem vel lacus.</text>
  <time>Mon Jul 07 00:02:49 +0000 2008</time>
</status>
<status>
  <id>848502311</id>
  <text>Cras faucibus dui.</text>
  <time>Wed Jul 02 15:11:28 +0000 2008</time>
</status>
<status>
  <id>846568885</id>
  <text>Etiam pellentesque odio sit amet libero.</text>
  <time>Mon Jun 30 01:53:33 +0000 2008</time>
</status>
<status>
  <id>846564566</id>
  <text>Vestibulum diam massa, lacinia ac, tincidunt a, fermentum id, erat.</text>
  <time>Mon Jun 30 01:45:29 +0000 2008</time>
</status>
<status>
  <id>846563952</id>
  <text>Duis cursus.</text>
  <time>Mon Jun 30 01:44:21 +0000 2008</time>
</status>
<status>
  <id>846553397</id>
  <text>Curabitur ultricies augue nec dui.</text>
  <time>Mon Jun 30 01:24:13 +0000 2008</time>
</status>
<status>
  <id>846551780</id>
  <text>Curabitur ultricies est at nunc.</text>
  <time>Mon Jun 30 01:21:02 +0000 2008</time>
</status>
<status>
  <id>846547273</id>
  <text>Phasellus luctus, libero ac venenatis pharetra, massa est sodales turpis, vitae pulvinar erat ipsum vitae ipsum.</text>
  <time>Mon Jun 30 01:12:27 +0000 2008</time>
</status>
<status>
  <id>846295785</id>
  <text>Duis euismod neque ac mi.</text>
  <time>Sun Jun 29 17:09:35 +0000 2008</time>
</status>
<status>
  <id>844929536</id>
  <text>Quisque euismod elementum nibh.</text>
  <time>Fri Jun 27 12:53:55 +0000 2008</time>
</status>
<status>
  <id>841548177</id>
  <text>Duis in enim vitae nisl ullamcorper hendrerit.</text>
  <time>Mon Jun 23 11:06:04 +0000 2008</time>
</status>
<status>
  <id>839981450</id>
  <text>Pellentesque posuere, nunc sed aliquam pellentesque, mi dui dapibus lacus, at hendrerit nulla nisi id magna.</text>
  <time>Sat Jun 21 02:07:49 +0000 2008</time>
</status>
<status>
  <id>839185961</id>
  <text>Suspendisse et velit feugiat enim sollicitudin auctor.</text>
  <time>Fri Jun 20 03:16:23 +0000 2008</time>
</status>
<status>
  <id>839139409</id>
  <text>Curabitur vitae felis a tellus volutpat ultricies.</text>
  <time>Fri Jun 20 01:50:57 +0000 2008</time>
</status>
<status>
  <id>838982522</id>
  <text>Maecenas ac nisi.</text>
  <time>Thu Jun 19 21:16:17 +0000 2008</time>
</status>
<status>
  <id>838981434</id>
  <text>Praesent neque mi, bibendum ut, fringilla et, pretium sit amet, orci.</text>
  <time>Thu Jun 19 21:14:45 +0000 2008</time>
</status>
<status>
  <id>838921109</id>
  <text>Quisque sit amet lectus.</text>
  <time>Thu Jun 19 19:39:37 +0000 2008</time>
</status>
<status>
  <id>838801765</id>
  <text>Proin aliquam, odio in gravida interdum, mi massa consequat dui, eu bibendum erat lorem sit amet quam.</text>
  <time>Thu Jun 19 16:47:51 +0000 2008</time>
</status>
<status>
  <id>838778122</id>
  <text>Nunc egestas accumsan nulla.</text>
  <time>Thu Jun 19 16:15:04 +0000 2008</time>
</status>
<status>
  <id>838268812</id>
  <text>Mauris non libero vehicula lectus ornare laoreet.</text>
  <time>Thu Jun 19 01:26:13 +0000 2008</time>
</status>
<status>
  <id>838140423</id>
  <text>Ut nec dolor.</text>
  <time>Wed Jun 18 21:50:57 +0000 2008</time>
</status>
<status>
  <id>837220961</id>
  <text>Integer quis odio id mi interdum tincidunt.</text>
  <time>Tue Jun 17 21:20:13 +0000 2008</time>
</status>
<status>
  <id>837183828</id>
  <text>Ut hendrerit venenatis nibh.</text>
  <time>Tue Jun 17 20:32:27 +0000 2008</time>
</status>
<status>
  <id>836307814</id>
  <text>Donec auctor.</text>
  <time>Mon Jun 16 21:12:58 +0000 2008</time>
</status>
<status>
  <id>834749739</id>
  <text>In consequat diam ut neque.</text>
  <time>Sat Jun 14 17:03:56 +0000 2008</time>
</status>
<status>
  <id>834066962</id>
  <text>Nam feugiat augue ut nisl hendrerit dignissim.</text>
  <time>Fri Jun 13 17:52:34 +0000 2008</time>
</status>
<status>
  <id>833956326</id>
  <text>Nulla sed mauris vel felis pellentesque hendrerit.</text>
  <time>Fri Jun 13 15:30:19 +0000 2008</time>
</status>
<status>
  <id>832673883</id>
  <text>Sed eros nulla, dictum id, rutrum ut, pretium porttitor, enim.</text>
  <time>Thu Jun 12 02:18:47 +0000 2008</time>
</status>
<status>
  <id>831830846</id>
  <text>Proin mollis orci ac neque rhoncus molestie.</text>
  <time>Wed Jun 11 02:25:20 +0000 2008</time>
</status>
<status>
  <id>831790496</id>
  <text>Etiam porta auctor nunc.</text>
  <time>Wed Jun 11 01:15:50 +0000 2008</time>
</status>
<status>
  <id>831396285</id>
  <text>Quisque viverra, quam sit amet pharetra consequat, tellus diam mollis tellus, sit amet tincidunt leo pede id leo.</text>
  <time>Tue Jun 10 14:59:53 +0000 2008</time>
</status>
<status>
  <id>831374002</id>
  <text>Duis ut massa eget ligula congue fermentum.</text>
  <time>Tue Jun 10 14:30:10 +0000 2008</time>
</status>
<status>
  <id>831339193</id>
  <text>Proin feugiat.</text>
  <time>Tue Jun 10 13:42:40 +0000 2008</time>
</status>
<status>
  <id>830718418</id>
  <text>Aenean accumsan neque sit amet erat.</text>
  <time>Mon Jun 09 19:04:02 +0000 2008</time>
</status>
<status>
  <id>829368492</id>
  <text>Nam placerat dui quis purus.</text>
  <time>Sat Jun 07 21:41:12 +0000 2008</time>
</status>
<status>
  <id>829169953</id>
  <text>Aenean quam sapien, molestie congue, viverra at, sagittis eget, quam.</text>
  <time>Sat Jun 07 15:47:08 +0000 2008</time>
</status>
<status>
  <id>827991968</id>
  <text>Aliquam non felis.</text>
  <time>Thu Jun 05 21:52:04 +0000 2008</time>
</status>
<status>
  <id>826057648</id>
  <text>Integer magna.</text>
  <time>Tue Jun 03 15:13:43 +0000 2008</time>
</status>
<status>
  <id>825212752</id>
  <text>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</text>
  <time>Mon Jun 02 14:56:00 +0000 2008</time>
</status>
<status>
  <id>824083259</id>
  <text>Praesent rhoncus sem vitae sem.</text>
  <time>Sat May 31 16:22:13 +0000 2008</time>
</status>
<status>
  <id>823444593</id>
  <text>Phasellus cursus tincidunt libero.</text>
  <time>Fri May 30 16:12:42 +0000 2008</time>
</status>
<status>
  <id>822752361</id>
  <text>Duis nec urna.</text>
  <time>Thu May 29 19:48:57 +0000 2008</time>
</status>
<status>
  <id>821898551</id>
  <text>Nam sodales massa sed augue.</text>
  <time>Wed May 28 18:03:24 +0000 2008</time>
</status>
<status>
  <id>821259909</id>
  <text>Nullam et leo at odio auctor convallis.</text>
  <time>Tue May 27 22:33:42 +0000 2008</time>
</status>
</statuses>
EOF

gg = nil
rr = nil

Before do
  begin
    Pwn.teardown
  rescue SQLite3::SQLException
  end
  Pwn.setup
  @twitter = Twitter.new 13, 'foo', 'bar'
  @twitter.expects(:get_statuses_per_page).at_least(1).returns(3)
  @zero = Pwn.new @twitter

  gg = REXML::XPath.match(doc, '//statuses/status')

  gg.each do |g|
    g.expects(:id).at_least(1).returns(g.elements['id'].text)
    g.expects(:text).at_least(1).returns(g.elements['text'].text)
    g.expects(:time).at_least(1).returns(DateTime.parse(g.elements['time'].text))
  end

  rr = gg[0..19]
  gg[0..19] = nil

end

After do
end

Given /^(\d+) tweets?$/ do |tweetc|
  gg = gg[0..tweetc.to_i-1]
end

When /^I tweet$/ do
  gg.insert(0, rr.pop)
end

When /^I pwn twitter ?a?g?a?i?n?$/ do
  9.times do |p|
    if gg.length >= (p+1)*3
      @twitter.expects(:fetch_page_of_statuses).with(p+1).multiple_yields([gg[p*3]], [gg[p*3+1]], [gg[p*3+2]])
    elsif gg.length >= p*3+2
      @twitter.expects(:fetch_page_of_statuses).with(p+1).multiple_yields([gg[p*3]], [gg[p*3+1]])
    elsif gg.length >= p*3+1
      @twitter.expects(:fetch_page_of_statuses).with(p+1).multiple_yields([gg[p*3]])
    else
      @twitter.expects(:fetch_page_of_statuses).with(p+1).then.returns
    end
    @twitter.expects(:fetch_page_of_statuses).with(10).then.returns
  end
  @zero.pwn
end

Then /^I pwn page (\d+)$/ do |page|
  @zero.pwn_stats.collect{|s|s[:page]}.should include(page.to_i)
end

Then /^I collect (\d+) new tweets? from page (\d+)$/ do |tweetc, page|
  @zero.pwn_stats.detect{|s|s[:page]==page.to_i}[:tweet_count].should == tweetc.to_i
end

Then /^I have (\d+) segments?$/ do |segmentc|
  @zero.segment_count.should == segmentc.to_i
end

Then /^I have (\d+) unique tweets?$/ do |tweetc|
  @zero.tweet_count.should == tweetc.to_i
end
