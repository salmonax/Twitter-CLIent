post_hash = {"created_at"=>"Thu Mar 21 18:17:07 +0000 2013", "id"=>314802870077751296, "id_str"=>"314802870077751296", "text"=>"another test tweet to check error handling @epicodus", "source"=>"<a href=\"http://www.ourpage.net\" rel=\"nofollow\">EpicodusProject1</a>", "truncated"=>false, "in_reply_to_status_id"=>nil, "in_reply_to_status_id_str"=>nil, "in_reply_to_user_id"=>nil, "in_reply_to_user_id_str"=>nil, "in_reply_to_screen_name"=>nil, "user"=>{"id"=>727196179, "id_str"=>"727196179", "name"=>"Marcie Morton", "screen_name"=>"marcie_mo", "location"=>"San Francisco, CA", "description"=>"", "url"=>nil, "entities"=>{"description"=>{"urls"=>[]}}, "protected"=>false, "followers_count"=>18, "friends_count"=>69, "listed_count"=>0, "created_at"=>"Tue Jul 31 00:44:29 +0000 2012", "favourites_count"=>7, "utc_offset"=>nil, "time_zone"=>nil, "geo_enabled"=>true, "verified"=>false, "statuses_count"=>49, "lang"=>"en", "contributors_enabled"=>false, "is_translator"=>false, "profile_background_color"=>"C6E2EE", "profile_background_image_url"=>"http://a0.twimg.com/images/themes/theme2/bg.gif", "profile_background_image_url_https"=>"https://si0.twimg.com/images/themes/theme2/bg.gif", "profile_background_tile"=>false, "profile_image_url"=>"http://a0.twimg.com/profile_images/2450300904/y9gc9pnxnnhi71xbvii6_normal.jpeg", "profile_image_url_https"=>"https://si0.twimg.com/profile_images/2450300904/y9gc9pnxnnhi71xbvii6_normal.jpeg", "profile_link_color"=>"1F98C7", "profile_sidebar_border_color"=>"C6E2EE", "profile_sidebar_fill_color"=>"DAECF4", "profile_text_color"=>"663B12", "profile_use_background_image"=>true, "default_profile"=>false, "default_profile_image"=>false, "following"=>true, "follow_request_sent"=>nil, "notifications"=>nil}, "geo"=>nil, "coordinates"=>nil, "place"=>nil, "contributors"=>nil, "retweet_count"=>0, "favorite_count"=>0, "entities"=>{"hashtags"=>[], "urls"=>[], "user_mentions"=>[{"screen_name"=>"epicodus", "name"=>"Epicodus", "id"=>1078596416, "id_str"=>"1078596416", "indices"=>[43, 52]}]}, "favorited"=>false, "retweeted"=>false, "lang"=>"en"} 
settings_hash = {"protected"=>false, "use_cookie_personalization"=>false, "time_zone"=>{"name"=>"Arizona", "utc_offset"=>-25200, "tzinfo_name"=>"America/Phoenix"}, "screen_name"=>"DeedleTweep", "sleep_time"=>{"start_time"=>nil, "end_time"=>nil, "enabled"=>false}, "geo_enabled"=>false, "language"=>"en", "always_use_https"=>true, "discoverable_by_email"=>false} 

def show_keys(hash,indent='')
  hash.keys.each do |key|
    if hash[key].class == Hash
      puts "#{indent} #{key} =>"
      show_keys(hash[key],' '*(indent.length+3))
    elsif hash[key].class == Array
      puts "#{indent} #{hash[key].join("\n")}"
    else
      puts "#{indent} #{key} => #{hash[key]}"
    end
  end
end

translation_hash = {"query"=>{"count"=>1, "created"=>"2013-03-21T23:16:02Z", "lang"=>"en-US", "diagnostics"=>{"publiclyCallable"=>"true", "url"=>[{"execution-start-time"=>"21", "execution-stop-time"=>"68", "execution-time"=>"47", "proxy"=>"DEFAULT", "content"=>"http://www.datatables.org/google/google.translate.xml"}, {"execution-start-time"=>"70", "execution-stop-time"=>"232", "execution-time"=>"162", "proxy"=>"DEFAULT", "content"=>"http://translate.google.com/translate_a/t?q=try%20to%20encode%20this%20%40DeedleTweep&client=t&text=&sl=auto&tl=sp"}], "user-time"=>"232", "service-time"=>"209", "build-version"=>"34910"}, "results"=>{"json"=>{"json"=>[{"json"=>{"json"=>["try to encode this @DeedleTweep", "try to encode this @DeedleTweep", "", ""]}}, "null", "en", "null", "null", "null", "null", "null", {"json"=>{"json"=>"en"}}, "0"]}}}}
show_keys(translation_hash)

# def parse(response)
#   JSON.parse(response.body).each do {}
# end