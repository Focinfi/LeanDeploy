#!/usr/bin/env ruby
require 'qiniu'
Qiniu.establish_connection! :access_key => 'oDzI0sgiK40RaXTm_fne0yIgNvFZajLpwmmCSJe_',
                            :secret_key => 'pc55MugNNLHlUNluByiLxEmwLMuQI9HJK48RojaC'

put_policy = Qiniu::Auth::PutPolicy.new(
    bucket,    
    key,        # 最终资源名，可省略，即缺省为“创建”语义
    expires_in, # 相对有效期，可省略，缺省为3600秒后 uptoken 过期
    deadline    # 绝对有效期，可省略，指明 uptoken 过期期限（绝对值），通常用于调试
)

uptoken = Qiniu::Auth.generate_uptoken(put_policy)

code, result, response_headers = Qiniu::Storage.upload_with_put_policy(
    put_policy,     # 上传策略
    local_file,     # 本地文件名
    key,            # 最终资源名，可省略，缺省为上传策略 scope 字段中指定的Key值
    x_var           # 用户自定义变量，可省略，需要指定为一个 Hash 对象
)