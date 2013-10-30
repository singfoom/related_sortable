class Story < ActiveRecord::Base
  include RankedModel
  ranks :position

  belongs_to :series  
end
