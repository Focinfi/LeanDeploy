::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = 'oDzI0sgiK40RaXTm_fne0yIgNvFZajLpwmmCSJe_'
  config.qiniu_secret_key    = 'pc55MugNNLHlUNluByiLxEmwLMuQI9HJK48RojaC'
  config.qiniu_bucket        = "dumi"
  config.qiniu_bucket_domain = "7xiwsa.com2.z0.glb.qiniucdn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

  # config.qiniu_up_host       = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
end