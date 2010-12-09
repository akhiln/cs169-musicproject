class Genre < ActiveRecord::Base
  has_many :songs
  def to_s
    if self.genre_name != nil
      self.genre_name.to_s
    else
      ""
    end
  end
end
