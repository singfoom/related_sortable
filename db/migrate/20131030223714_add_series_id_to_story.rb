class AddSeriesIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :series_id, :integer
  end
end
