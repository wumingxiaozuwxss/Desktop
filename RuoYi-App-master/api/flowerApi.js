let config = {
	url:"",
	data:""
}

// 存取缓存
// uni.setStorageSync('userId', 'hello');
// uni.getStorageSync('userId');

const request = config => {
	console.log(config);
	return new Promise((resolve, reject) => {
		uni.request({
			method: 'post',
			timeout: 20000,
			url: 'http://localhost:8080/' + config.url,
			data: config.data,
			dataType: 'json'
		  }).then(response => {
			resolve(response)
		  })
		  .catch(error => {
			reject(error)
		  })
	  })
}

// 1 - 用户系列
// 登录
export function login(data) {
  return request({
    'url': 'user/login',
    'data': data
  })
}

// 注册
export function register(data) {
  return request({
    'url': 'user/add',
    'data': data
  })
}


// 2 - 鲜花类型
// 鲜花类型
export function flowerType() {
  return request({
    'url': 'flowerType/findType',
    'data': ''
  })
}

export function flowerByType(data) {
  return request({
    'url': 'flowerType/find',
    'data': data
  })
}


// 3 - 鲜花
// 鲜花查询
export function flower(data) {
  return request({
    'url': 'flower/find',
    'data': data
  })
}
// 通过分类的名称 查询相同的鲜花
export function flowerById(data) {
  return request({
    'url': 'flower/findById',
    'data': data
  })
}



//4 - 购物车

// 添加到购物车
export function addShopCart(data) {
  return request({
    'url': 'shopCart/add',
    'data': data
  })
}
// 查询购物车
export function findShopCart(data) {
  return request({
    'url': 'shopCart/find',
    'data': data
  })
}
// 删除购物车
export function delShopCart(data) {
  return request({
    'url': 'shopCart/del',
    'data': data
  })
}

// 5- 地址

// 查询
export function findLocation(data) {
  return request({
    'url': 'location/find',
    'data': data
  })
}
// 删除
export function delLocation(data) {
  return request({
    'url': 'location/del',
    'data': data
  })
}
// 修改
export function chengLocation(data) {
  return request({
    'url': 'location/cheng',
    'data': data
  })
}
// 新增
export function addLocation(data) {
  return request({
    'url': 'location/add',
    'data': data
  })
}

// 6- 订单
export function addOrder(data) {
  return request({
    'url': 'order/add',
    'data': data
  })
}

export function findOrder(data) {
  return request({
    'url': 'order/find',
    'data': data
  })
}



// 7- 评价
// 添加评价
export function addComment(data) {
  return request({
    'url': 'comment/add',
    'data': data
  })
}

// 通过鲜花查询
export function findFlowerComment(data) {
  return request({
    'url': 'comment/find',
    'data': data
  })
}






