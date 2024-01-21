<template>
	<view>
		<view class="">
			<view class="goods-item" v-for="item in shopCartList">
				<image class="goods-image" :src="item.flower.flowerImg" mode=""></image>
				<view class="goods-info">
					<view class="goods-title">
						{{item.flower.flowerName}}
					</view>
					<view class="goods-price">
						<view class="price">
							￥{{item.flower.flowerPrice}}
						</view>
						<view style="position: absolute; right: 0;">
								<uni-number-box v-model="item.shopNumber"  />
						</view>
					</view>
					<view class="change-location" @click="tobuy(item.flower)">
						立即购买
					</view>
				</view>
			</view>

		</view>
		<!-- 		flowerId: 297061880
			shopId: 579058386
			shopNumber: 5
			userId: 192181812
			
			flowerDetail1: "http://localhost:8080/static/t1.jpg"
			flowerDetail2: "http://localhost:8080/static/t2.jpg"
			flowerDetail3: "http://localhost:8080/static/t3.jpg"
			flowerId: 297061880
			flowerImg: "http://localhost:8080/static/2.jpg"
			flowerName: "我的女神"
			flowerPrice: 190
			flowerPriced: 228
			flowerSales: 3040
			flowerSpecification: "一束" -->
	<!-- 	<view v-for="item in shopCartList">
			商品：{{item.flower.flowerName}}
			规格：{{item.flower.flowerSpecification}}
			数量：{{item.shopNumber}}
			价格：{{item.flower.flowerPrice}}
			总价：{{item.flower.flowerPrice * item.shopNumber}}
			<button class="mini-btn" type="primary" size="mini" @click="delShop(item.shopId)">删除</button>
			<button class="mini-btn" type="warn" size="mini" @click="addBtn(item)">购买</button>
		</view> -->
	</view>
</template>

<script>
	import {
		findShopCart,
		delShopCart,
		addOrder,
		findLocation
	} from '@/api/flowerApi'
	export default {
		data() {
			return {
				shopCartList: [] //购物车
			};
		},
		onLoad: (option) => {

		},
		onShow: function() {
			this.shopCartList = [];
			let userId = uni.getStorageSync("userId");
			findShopCart(userId).then(res => {
				console.log(res[1].data.object);
				let result = res[1].data.object;
				for (let i of result) {
					this.shopCartList.push({
						...i
					})
				}
				console.log("进入购物车", this.shopCartList);
			})
		},
		methods: {
			// 购买
			tobuy(item) {
				var flower = JSON.stringify(item)
				uni.navigateTo({
					url: "/pages/buy/buy?flower=" + flower
				})
			
			},
			delShop(id) {
				delShopCart(id).then(res => {
					console.log(res[1].data);
				})
			},
			// findLocation
			
			selectLocation(){
				let id = uni.getStorageSync('userId');
				findLocation(id).then(res=>{
					let result = res[1].data.object; // 这就是所有的地址 可以选择
				})
			},
			
			// 添加购物车
			addBtn(item) {
				let id = uni.getStorageSync('userId');
				let data = {
					userId: id,
					orderPrice: item.flower.flowerPrice,
					flowerId: item.flower.flowerId,
					orderNumber: item.shopNumber,
					locationId:"431077617",// 从 selectLocation 选择
					
					
				};
				addOrder(data).then(res => {
					console.log("购买end", res[1].data);
					delShopCart(item.shopId).then(res => {
						console.log(res[1].data);
					})
				})
			}
			// 跳转订单


		}
	}
</script>

<style lang="scss" scoped>
	.change-location {
		width: 150rpx;
		background-color: #FF4500;
		height: 50rpx;
		line-height: 50rpx;
		border-radius: 10rpx;
		color: white;
		text-align: center;
		margin-top: 30rpx;
		position: absolute;
		right: 30rpx;
		bottom: 20rpx;
		margin-top: 20rpx;
	}
	.goods-item {
		display: flex;
		flex-direction: row;
		background-color: white;
		padding: 30rpx 30rpx 90rpx 30rpx;
		position: relative;

		.goods-info {
			display: flex;
			flex-direction: column;
			width: 100%;


			.goods-title {
				padding:10rpx 30rpx;
			}

			.goods-price {
				display: flex;
				flex-direction: row;
				padding: 10rpx 30rpx;
				width: 100%;
				position: relative;
				.price {
					color: #FF4500;
				}
			}
		}
	}

	.goods-image {
		width: 120rpx;
		height: 120rpx;
		border-radius: 10rpx;
	}
</style>