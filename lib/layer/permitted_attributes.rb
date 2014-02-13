module PermittedAttributes
  @@user_attributes = [:identifier]
  @@item_attributes = [:name]
  @@event_attributes = [:user_id, :item_id, :event]

  def user_params
    params.require(:user).permit(@@user_attributes).tap do |whitelisted|
      whitelisted[:properties] = params[:user][:properties]
    end
  end

  def item_params
    params.require(:item).permit(@@item_attributes).tap do |whitelisted|
      whitelisted[:properties] = params[:item][:properties]
    end
  end

  def event_params
    params.require('event').permit(@@event_attributes)
  end
end