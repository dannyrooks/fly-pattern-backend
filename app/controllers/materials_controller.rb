class MaterialsController < ApplicationController
    # before_action :set_pattern
    before_action :set_material

    # def index
    #     materials = @pattern.materials
    #     # materials = Material.all
    #     render json: materials
    # end

    def index 
        @pattern = Pattern.find_by(id: params[:pattern_id])
        if @pattern
            @materials = @pattern.materials
        else
            @materials = Material.all
        end
        render json: @materials
    end

    # def create  
    #     material = @pattern.materials.new(material_params)
    #     # material = Material.new(material_params)
    #     if material.save
    #         render json: material
    #     else
    #         render json: {error: 'Error creating material'}
    #     end
    # end

    def create
        @pattern = Pattern.find_by(id: params[:pattern_id])
        if @pattern
            @material = @pattern.materials.build(material_params)
            if @material.save
                render json: @material
            else
                render json: {error: 'Material cannot be created'}
            end
        end
    end

    # def show
    #     material = Material.find_by(id: params[:pattern_id])
    #     render json: material
    # end

    def show
        @pattern = Pattern.find_by(id: params[:pattern_id])
        if @pattern
            @materials = @pattern.materials.find_by(id: params[:id])
        else
            @material = Material.find_by(id: params[:id])
        end
        render json: @material
    end

    def update
        if @material.update(material_params)
            render json: @material
        else
            render json: {error: 'Error updating material'}
        end
    end

    # def destroy
    #     material = Material.find_by(id: params[:pattern_id])
    #     material.destroy
    # end

    def destroy
        if @pattern
            @materials = @pattern.materials.find_by(id: params[:id])
        else
            @material = Material.find_by(id: params[:id])
        end
        @material.destroy
    end

    private

    # def set_pattern
    #     @pattern = Pattern.find(params[:pattern_id])
    # end

    def set_material
        @material = Material.find_by(id: params[:id])
    end

    def material_params
        params.require(:material).permit(:name, :description, :pattern_id)
    end
end
