class Api::PlacesController < Lina::ApplicationController
  # def index
  define_action :index, {
    name: '请求读觅Place列表',
    description: '选择：全部 或 分页 数据',
    params: {
      type: 'object',
      properties: {
        page: {
          type: 'string',
          description: '页码，数字字符串'
        },
        per_page: {
          type: 'string',
          description: '每页Place数量，注意是从第一个算起'
        }
      }
    },
    return: {
      name: "显示读觅Place列表",
      description: '返回：全部 或 分页 数据',
      type: 'array',
      properties: {
        id: {
          type: 'integer'
        },
        name: {
          type: 'string'
        },
        category: {
          type: 'string'
        },
        latitude: {
          type: 'number',
          description: '纬度'
        },
        longitude: {
          type: 'number',
          description: '经度'
        },
        business_hours: {
          type: 'string',
          description: '营业时间段'
        },
        description: {
          type: 'string'
        },
        picture_01_url: {
          type: 'string'
        },
        picture_02_url: {
          type: 'string'
        },
        picture_03_url: {
          type: 'string'
        },
        html_url: {
          type: 'string',
          description: "host ip 与API相同，此字段为uri"
        },
        created_at: {
          type: 'string'
        }
      }
    }
    } do
      page = params[:page]
      per_page = params[:per_page]
      
      # handle invalid params
      begin
        Integer(page) if page
        Integer(per_page) if per_page
      rescue Exception
        render json: [{ error: "page或per_page参数不是数字字符串" }], status: 400
        return
      end

      # set @places
      per_page ||= 10
      if page
        @places = Place.paginate(page: page, per_page: per_page)
      else
        @places = Place.all
      end
    end

  define_action :show, {
    name: '请求读觅一个Place详情',
    description: '传入一个ID, 显示这个Place的信息',
    params: {
      type: 'object',
      required: [ :id ],
      properties: {
        id: {
          type: 'string',
          description: 'Place id'
        }
      }
    },
    return: {
      name: "显示读觅Place详情",
      description: '',
      type: 'object',
      properties: {
        id: {
          type: 'integer'
        },
        name: {
          type: 'string'
        },
        latitude: {
          type: 'number',
          description: '纬度'
        },
        longitude: {
          type: 'number',
          description: '经度'
        },
        business_hours: {
          type: 'string',
          description: '营业时间段'
        },
        description: {
          type: 'string'
        },
        picture_url: {
          type: 'string'
        },
        created_at: {
          type: 'string'
        },
        html_url: {
          type: 'string',
          description: "host ip 与API相同，此字段为uri"
        }
      }
    }
    } do
      # handle invalid params[:id]
      id = params[:id]
      begin
        Integer(id) if id
      rescue Exception
        render json: { error: "用户ID不是数字字符串" }, status: 400
        return
      end
      @place = Place.find_by_id id
    end
end
