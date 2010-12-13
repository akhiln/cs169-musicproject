# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def facebook_like(url) 
    { :src=>"http://www.facebook.com/plugins/like.php?href="+convert_url(url)+"&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=segoe+ui&amp;colorscheme=light&amp;height=80", 
      :scrolling=>:no, 
      :frameborder=>"0", 
      :style=>"border:none; overflow:hidden; width:450px; height:80px;", 
      :allowTransparency=>:true
    }
  end

  def facebook_box(url)
    { :src=>"http://www.facebook.com/plugins/activity.php?href="+convert_url(url)+"&amp;width=300&amp;colorscheme=dark&amp;connections=10&amp;stream=false&amp;header=true&amp;height=287", 
      :scrolling=>:no, 
      :frameborder=>"0", 
      :style=>"border:none; overflow:hidden; width:300px; height:287px;", 
      :allowTransparency=>:true
    }   
  end
  
  def convert_url(url)
    converted_url = url.gsub('/', '%2F')
    converted_url = converted_url.gsub(':', '%3A')
    converted_url
  end

  def time_elapsed_since(dt)
    seconds = Time.zone.now - dt
    amount = 1
    min_amt, hr_amt, day_amt = (seconds/60).to_i, (seconds/3600).to_i, (seconds/(3600*24)).to_i
    unit = "minute"
    if min_amt < 60
      amount = min_amt if min_amt >= 2
    elsif hr_amt < 24
      amount = hr_amt
      unit = "hour"
    else
      amount = day_amt
      unit = "day"
    end
    unit += "s" if amount > 1
    sprintf("%d %s ago",amount,unit)
  end

end
