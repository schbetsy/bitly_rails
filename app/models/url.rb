class Url < ActiveRecord::Base
  belongs_to :user

  before_create :generate_url

  def generate_url
    new_url = nil
    until  new_url != nil
      random_string = Faker::Base.regexify(/[a-zA-Z0-9]{10}/)
      if Url.find_by_short_url(random_string) == nil
        new_url = random_string
      end
    end
    self.short_url = new_url
  end

end
