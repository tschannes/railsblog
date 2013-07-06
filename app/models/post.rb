class Post < ActiveRecord::Base

	validates :title, :text, presence: true,
                    length: { minimum: 5 }
    validates :lead, presence: true,
                    length: { minimum: 5, maximum: 140 }


end
