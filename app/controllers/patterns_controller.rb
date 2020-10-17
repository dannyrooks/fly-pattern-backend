class PatternsController < ApplicationController
    
    def index
        patterns = Pattern.all
        render json: patterns
    end

    def create
        pattern = Pattern.new(pattern_params)
        if pattern.save
            render json: pattern
        else
            render json: {error: 'Error creating pattern'}
        end
    end

    def show
        pattern = pattern.find_by(id: params[:id])
        render json: pattern
    end

    def update
        if pattern.update(pattern_params)
            render json: pattern
        else
            render json: {error: 'Error creating pattern'}
        end
    end

    def destroy
        pattern = Pattern.find_by(id: params[:id])
        pattern.destroy
    end

    private

    def pattern_params
        param.require(:pattern).permit(:name, :category, :comment)
    end

end
