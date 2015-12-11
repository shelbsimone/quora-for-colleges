class Question < ActiveRecord::Base
    validates_presence_of :content
    validates_length_of :content, :maximum => 140
    
    belongs_to :user
    has_many :comments
    
end
