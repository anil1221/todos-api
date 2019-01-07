# frozen_string_literal: true

module V1
  # Items Controller
  class ItemsController < ApplicationController
    before_action :set_todo
    before_action :set_item, only: %i[show update destroy]

    # GET /todos/items
    def index
      @items = @todo.items
      json_response(@items)
    end

    # POST /todos/items
    def create
      @item = @todo.items.create!(item_params)
      json_response(@item, :created)
    end

    # GET /todos/items/:id
    def show
      json_response(@item)
    end

    # PUT /todos/items/1
    def update
      @item.update!(item_params)
      json_response(@item)
    end

    def destroy
      @item.destroy
      head :no_content
    end

    private

    def set_todo
      @todo = Todo.find(params[:todo_id])
    end

    def set_item
      @item = @todo.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :done)
    end
  end
end