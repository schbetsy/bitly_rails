class Url < ActiveRecord::Base
  belongs_to :user

  before_create :generate_url

  def generate_url
    new_url = nil
    until  new_url != nil
      if Url.find_by_short_url(random_string) == nil
        new_url = random_string
      end
    end
    self.short_url = new_url
  end

  private

  def random_string
    options = ('a' .. 'z').to_a + ('A' .. 'Z').to_a + (0..9).to_a
    options.sample(10).join
  end

end
