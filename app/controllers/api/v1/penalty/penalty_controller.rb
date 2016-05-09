module Api
  module V1
    module Penalty
      class PenaltyController < ApplicationController
        before_action :params_present?, only: [:shoot, :save]

        def create
          render json: GameService.new.match.as_json, status: 201
        end

        def shoot
          render json: GameService.new(params["match_id"].to_i).shoot([params["x"].to_i, params["y"].to_i]), status: 200
        end

        def save
          render json: GameService.new(params["match_id"].to_i).save([params["x"].to_i, params["y"].to_i]), status: 200
        end

        private

        def params_present?
          if params["match_id"].nil? || params["x"].nil? || params["y"].nil?
            render json: { error: "Missing params [match_id, x, y]" }, status: 404
          end
        end
      end
    end
  end
end
