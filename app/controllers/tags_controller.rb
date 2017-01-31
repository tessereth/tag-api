class TagsController < ApplicationController
  def create
    entity = Entity.find_or_create_by(entity_params)
    entity.tags = []
    params[:tags].each do |tag|
      entity.tags << Tag.find_or_create_by(name: tag)
    end
  end

  def show
    entity = Entity.includes(:tags).find_by!(entity_params)
    ret = {entity_type: entity.entity_type, entity_id: entity.entity_id, tags: []}
    ret[:tags] = entity.tags.map(&:name)
    render json: ret
  end

  def destroy
    # this leaves behind tags with no entities but it's a trade off between the performance
    # hit of extra database queries ever delete and the database potentially growing unchecked
    # I just went with the easy one for now
    entity = Entity.find_by!(entity_params)
    entity.destroy
  end

  private

  def entity_params
    params.permit(:entity_type, :entity_id)
  end
end
