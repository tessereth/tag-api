class StatsController < ApplicationController
  def index
    # there's a way to do this with #inject but I find this easier to read
    result = []
    Tag.find_each do |tag|
      add_tag_stats(result, tag)
    end
    render json: result
  end

  def show
    entity = Entity.includes(:tags).find_by!(entity_params)
    result = []
    entity.tags.each do |tag|
      add_tag_stats(result, tag)
    end
    render json: result
  end

  private

  def entity_params
    params.permit(:entity_type, :entity_id)
  end

  def add_tag_stats(result, tag)
    # there's probably a way to do this without hitting the database
    # to get every single count but this will do for MVP
    count = tag.entities.count
    result << {tag: tag.name, count: count} if count > 0
  end
end
