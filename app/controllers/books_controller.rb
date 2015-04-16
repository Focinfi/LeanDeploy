class BooksController < Lina::ApplicationController
  # def index
  define_action :index, {
    name: 'index',
    description: '',
    params: {
      type: 'object',
      properties: {
      }
    },
    return: {
      type: 'object',
      required: [ 'name', 'id' ],
      properties: {
        name: {
          type: 'string',
        },
        id: {
          type: 'integer',
        }
      }
    }
  } do
    # write code here, It's the same as before
    @user = Book.all
    render json: @user
  end

  # def show
  define_action :show, {
    name: 'show',
    description: '',
    required: [ 'id' ],
    params: {
      type: 'object',
      properties: {
        id: {
          type: 'string',
          description: '用户ID',
        }
      }
    },
    return: {
      type: 'object',
      required: [ 'name', 'id' ],
      properties: {
        name: {
          type: 'string',
        },
        id: {
          type: 'integer',
        }
      }
    }
  } do
    # write code here, It's the same as before
    @user = Book.find(params[:id])
    render json: { name: @user.name, id: @user.id }
  end
end
