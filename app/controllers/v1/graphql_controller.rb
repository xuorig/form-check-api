module V1
  class GraphqlController < ApplicationController
    def new
    end

    def create
      query_string = params[:query]
      query_variables = params[:variables] || {}
      result = FormCheckSchema.execute(
        query_string,
        variables: query_variables,
        context: {},
        debug: true
      )
      puts result
      render json: result
    end

    def introspection
      introspection = FormCheckSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)
      render json: introspection
    end
  end
end
