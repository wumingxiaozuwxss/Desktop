<template>
	<view>
		<view class="">
			<view class="add-btn" @click="tolocation()" v-if="location==''">
				选择地址
			</view>
			<view class="location"  @click="tolocation()"  v-else>
				{{location.locationName}}
			</view>
			<view class="goods-item" v-for="item in flowerData">
				<image class="goods-image" :src="item.flowerImg" mode=""></image>
				<view class="goods-info">
					<view class="goods-title">
						{{item.flowerName}}
					</view>
					<view class="goods-price">
						<view class="price">
							￥{{item.flowerPrice}}
						</view>
						<view style="position: absolute; right: 0;">
								<uni-number-box v-model="item.orderNumber" />
						</view>
					</view>
				</view>
			</view>
			<view class="add-btn" @click="toOrder">
				立即购买
			</view>

		</view>
	</view>
</template>

<script>
	import {
		findShopCart,
		delShopCart,
		addOrder,
		findLocation,
		flower
	} from '@/api/flowerApi'
	export default {
		data() {
			return {
				shopCartList: [], //购物车
				flowerData:[],
				location:""
			};
		},
		onLoad(option) { 
			console.log(option,'option')
			var flowerData = JSON.parse(option.flower)
			console.log(flowerData,'flower')
			this.flowerData.push(flowerData)
			console.log(this.flowerData)

		},
		onShow: function() {
			console.log(this.location,'schoolname')
			
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
			toOrder() {
			
				let id = uni.getStorageSync('userId');
				this.flowerData.forEach((item)=>{
					item.userId = id
					item.locationId = this.location.locationId
				})
				
				// addOrder()
				// let data = {
				// 	userId: id,
				// 	orderPrice: this.flower.flowerPrice,
				// 	flowerId: this.flower.flowerId,
				// 	orderNumber: 1,
				// 	locationId:"431077617",// 从 selectLocation 选择
				// }
				// console.log("购买", data, );
				// let orders = [data,data];
				addOrder(this.flowerData).then(res => {
					console.log("购买end", res[1].data);
					uni.navigateTo({
						url:"/pages/order/order"
					})
				})
			
			},
			tolocation(){
				uni.navigateTo({
					url:"/pages/location/location?type='select'"
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

<style lang="scss">
	.location{
		width: 95vw;
		box-sizing: border-box;
		padding: 30rpx;
		background-color: white;
		border-radius: 10rpx;
		margin: 20rpx auto;
	}
	.add-btn {
		width: 600rpx;
		background-color: #FF4500;
		height: 60rpx;
		line-height: 60rpx;
		border-radius: 10rpx;
		color: white;
		text-align: center;
		margin: 30rpx auto;
	}
	.goods-item {
		display: flex;
		flex-direction: row;
		background-color: white;
		padding: 30rpx;

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