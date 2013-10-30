class Story < ActiveRecord::Base
  include RankedModel
  ranks :position  
end
