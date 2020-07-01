import axios from 'axios'

export function request(config){
  // 1.创建实例
  const instance = axios.create({
    baseURL: 'http://127.0.0.1/peanut/th5/public',
    timeout: 5000 
  })
  // 3.发送网络请求
  return instance(config)
}