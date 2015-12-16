module V1
  class GraphqlController < ApplicationController
    def new
    end

    def create
      query_string = params[:query]
      query_variables = params[:variables] || {}
      result = FormCheckSchema.execute(query_string, variables: query_variables)
      render json: result
    end
  end
end
