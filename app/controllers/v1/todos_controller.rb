# frozen_string_literal: true
module V1
  # Todos Controller
  class TodosController < ApplicationController
    before_action :set_todo, only: %i[show update destroy]

    # GET /todos
    def index
      @todos = current_user.todos
      json_response(@todos)
    end

    # POST /todos
    def create
      @todo = current_user.todos.create!(todo_params)
      json_response(@todo, :created)
    end

    # GET /todos/:id
    def show
      json_response(@todo)
    end

    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      head :no_content
    end

    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end

    private

    # whitelist params
    def todo_params
      params.require(:todo).permit(:title)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
  end
end
