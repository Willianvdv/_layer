# -*- encoding : utf-8 -*-

module Api
  class ResourceController < ApiController
    def create
      resource = model_class.new resource_attributes
      if resource.save
        begin
          Pusher.trigger 'resources', 'created', resource_attributes
        rescue Pusher::Error => e
          # TODO: Catch this exception
        end

        render json: resource
      else
        render status: :bad_request, json: { errors: resource.errors }
      end
    end

    def update
      if @resource.update resource_params
        render json: @resource
      else
        render status: :bad_request, json: { errors: @resource.errors }
      end
    end

    def index
      render json: @resources
    end

    protected

    def resource_attributes
      # Extend this method for custom model attributes
      resource_params
    end

    def resource_params
      public_send "#{controller_name.tableize.singularize}_params"
    end

    def load_resource
      @resource = model_class.find params[:id]
    end

    def load_resources
      @resources = model_class.all
    end

    def model_class
      controller_name.classify.constantize
    end
  end
end
