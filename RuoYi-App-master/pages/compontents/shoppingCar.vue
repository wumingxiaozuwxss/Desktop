<template>
	<view class="">
		<uni-popup ref="popup" background-color="#fff">
			<view class="car">
				<view class="flower-info">
					<image class="image" :src="shoppingCarData.flowerImg" mode=""></image>
					<view style="margin-left: 150rpx;">
						<view class="flower-name">
							{{shoppingCarData.flowerName}}
						</view>
						<view class="price">
							￥{{shoppingCarData.flowerPrice}}
						</view>
					</view>

				</view>

				<view class="num-box">
					<view class="">
						数量
					</view>

					<view class="num">
						<uni-number-box v-model="num"  />
					</view>
				</view>
				<view class="bottom-btn">
					<view class="add-car" @click="toShopCart">
						加入购物车
					</view>
					<view class="buy-now" @click="tobuy">
						立即购买
					</view>
				</view>
			</view>
		</uni-popup>

	</view>

</template>

<script>
	import {
		flowerById,
		addShopCart,
		addOrder,
		flower,
		findFlowerComment
	} from '@/api/flowerApi'
	export default {
		data() {
			return {
				num: 1,
				// shoppingCarData:{
				// 	flowerDetail1: "http://localhost:8080/static/t1.jpg",
				// 	flowerDetail2: "http://localhost:8080/static/t2.jpg",
				// 	flowerDetail3: "http://localhost:8080/static/t3.jpg",
				// 	flowerId: 297024091,
				// 	flowerImg: "http://localhost:8080/static/1.jpg",
				// 	flowerName: "专属浪漫",
				// 	flowerPrice: 70,
				// 	flowerPriced: 84,
				// 	flowerSales: 1120,
				// 	flowerSpecification: "一束"
				// }
			}
		},
		props: {
			shoppingCarData: {
				type: Object
			}
		},
		onLoad: function() {
			// console.log(this.shoppingCarData,'shoppingcarData')
		},
		methods: {
			// 购买
			tobuy() {
				var flower = JSON.stringify(this.shoppingCarData)
				uni.navigateTo({
					url: "/pages/buy/buy?flower=" + flower
				})
			
			},
			changeValue(value) {
				this.num = value
			},
			toggle(type) {
				this.type = type
				this.$refs.popup.open(type)
			},
			toShopCart() {
				let userId = uni.getStorageSync('userId');
				let data = {
					userId: userId,
					flowerId: this.shoppingCarData.flowerId,
					shopNumber: this.num
				}
				addShopCart(data).then(res => {
					uni.showToast({
						title: "加入购物车成功",
						duration: 2000,
						icon: "success",
					});
					this.num =1
					this.$refs.popup.close()
				}).catch(err => {
					console.log(res)
				})
				// uni.navigateTo({
				// 	url:'/pages/shopCart/shopCart?flowerId='+ this.flower.flowerId
				// })
			},
			toOrder() {
			
				let id = uni.getStorageSync('userId');
				// addOrder()
				let data = {
					userId: id,
					orderPrice: this.shoppingCarData.flowerPrice,
					flowerId: this.shoppingCarData.flowerId,
					orderNumber: this.num,
				}		
				addOrder(data).then(res => {
					console.log("购买end", res[1].data);
				})
			
			}

		}
	}
</script>

<style lang="scss" scoped>
	.flower-info {
		display: flex;
		flex-direction: row;

	}

	.flower-name {
		padding: 10rpx 30rpx;
	}

	.car {
		position: relative;
		padding: 30rpx 30rpx 0 30rpx;
		background-color: white;
	}

	.image {
		width: 150rpx;
		height: 150rpx;
		position: absolute;
		top: -30rpx;

	}

	.price {
		color: #FF4500;
		padding: 30rpx;
	}

	.num-box {
		position: relative;
		display: flex;
		align-items: center;
	}

	.num {
		position: absolute;
		right: 0;
	}

	.bottom-btn {
		display: flex;
		justify-content: space-around;
		margin-top: 80rpx;
		width: 100%;

		.add-car {
			width: 250rpx;
			height: 50rpx;
			line-height: 50rpx;
			border-radius: 25rpx;
			text-align: center;
			background-color: orange;
			color: white;
		}

		.buy-now {
			width: 250rpx;
			height: 50rpx;
			line-height: 50rpx;
			border-radius: 25rpx;
			text-align: center;
			background-color: #FF4500;
			color: white;
		}
	}
</style>