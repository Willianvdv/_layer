# -*- encoding : utf-8 -*-

module Api
  class ResourceController < ApiController
    def create
      resource = model_class.new resource_params
      if resource.save
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

    protected

      def resource_params
        public_send "#{controller_name.tableize.singularize}_params"
      end

      def load_resource
        @resource = model_class.find params[:id]
      end

      def model_class
        controller_name.classify.constantize
      end
  end
end
