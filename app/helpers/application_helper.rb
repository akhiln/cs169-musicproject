# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def facebook_like(url) 
    { :src=>"http://www.facebook.com/plugins/like.php?href="+convert_url(url)+"&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;font=segoe+ui&amp;colorscheme=dark&amp;height=80", 
      :scrolling=>:no, 
      :frameborder=>"0", 
      :style=>"border:none; overflow:hidden; width:450px; height:80px;", 
      :allowTransparency=>:true
    }
  end

  def facebook_box(url)
    { :src=>"http://www.facebook.com/plugins/likebox.php?href="+convert_url(url)+"&amp;width=300&amp;colorscheme=dark&amp;connections=10&amp;stream=false&amp;header=true&amp;height=287", 
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
  
end
