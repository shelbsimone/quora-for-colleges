class Question < ActiveRecord::Base
    validates_presence_of :content
    validates_length_of :content, :maximum => 140
    has_many :comments
    
    belongs_to :user
    
end
