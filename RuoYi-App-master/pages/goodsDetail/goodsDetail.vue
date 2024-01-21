<template>
	<view class="goods">
		<view>
			<image class="goods-img" :src="flower.flowerImg" alt="" />
		</view>
		<view class="goods-detail">
			<view class="goods-price">
				<view class="current-price">
					￥{{flower.flowerPrice}}
				</view>
				<view class="original-price">
					￥{{flower.flowerPriced}}
				</view>
			</view>
			<view class="goods-name">
				{{flower.flowerName}}
			</view>
			<view class="sold">
				已售{{flower.flowerSales}}
			</view>
		</view>
		<view class="evaluate">
			<view class="evaluate-title">
				商品评价({{commentList.length}})
			</view>
			<view v-if="commentList!=''">
				<view class="evaluate-info" v-for="i in commentList" v-if="i.commentContent!=''">
					<view class="evaluate-user">
						<image class="head" src="../../static/images/head.png" mode=""></image>
						<view class="">
							{{i.userName}}
						</view>
					</view>
					<view class="">
						{{i.commentContent}}
					</view>

				</view>
			</view>
			<view v-else class="evaluate-no">
				暂无评价
			</view>
		</view>
		<view>
			<image class="flowerDetail" :src="flower.flowerDetail1" alt="">
				<image class="flowerDetail" :src="flower.flowerDetail2" alt="">
					<image class="flowerDetail" :src="flower.flowerDetail3" alt="">
		</view>

		<view class="bottom">
			<uni-goods-nav :fill="true" :options="options" :buttonGroup="buttonGroup" @click="onClick"
				@buttonClick="buttonClick" />
		</view>

		<!-- <view>
			<button class="mini-btn" type="primary" size="mini" @click="toShopCart">购物车</button>
			<button class="mini-btn" type="warn" size="mini" @click="toOrder(flower)">购买</button>
		</view> -->
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
				options: [{
					icon: 'cart',
					text: '购物车'
				}],
				buttonGroup: [{
						text: '加入购物车',
						backgroundColor: '#ff0000',
						color: '#fff'
					},
					{
						text: '立即购买',
						backgroundColor: '#ffa200',
						color: '#fff'
					}
				],
				goodsDetail: {
					swiper: [{
							image: '/static/images/banner/banner01.jpg'
						},
						{
							image: '/static/images/banner/banner02.jpg'
						},
						{
							image: '/static/images/banner/banner03.jpg'
						}
					],
					goodsid: '0',
					goodsimg: '/static/images/banner/banner01.jpg',
					title: '【今日特价】情有独钟99朵玫瑰限时抢购',
					price: '99',
					originalPrice: '299',
					sold: 50000,
					collect: 100,
				},
				score: [{
						userImage: '/static/images/banner/banner01.jpg',
						userName: '小红',
						date: '2023-01-09',
						mark: 5,
						evaluate: '花很好，花很好，花很好，花很好，花很好，花很好，花很好',
						evaluateImage: [{
								image: '/static/images/banner/banner01.jpg'
							},
							{
								image: '/static/images/banner/banner02.jpg'
							},
							{
								image: '/static/images/banner/banner03.jpg'
							}
						]
					},
					{
						userImage: '/static/images/banner/banner01.jpg',
						userName: '小红',
						date: '2023-01-09',
						mark: 5,
						evaluate: '花很好，花很好，花很好，花很好，花很好，花很好，花很好',
						evaluateImage: [{
								image: '/static/images/banner/banner01.jpg'
							},
							{
								image: '/static/images/banner/banner02.jpg'
							},
							{
								image: '/static/images/banner/banner03.jpg'
							}
						]
					}
				],
				detailImage: [{
						image: '/static/images/banner/banner01.jpg'
					},
					{
						image: '/static/images/banner/banner02.jpg'
					},
					{
						image: '/static/images/banner/banner03.jpg'
					}
				],
				current: 0,
				mode: 'round',
				flower: null, //商品信息
				userId: "", // 用户信息
				commentList: [], // 用户评价

			}
		},
		onLoad: function(option) {
			// 获取上个页面的参数
			console.log("上个页面的参数", option.flowerId);
			flowerById(option.flowerId).then(res => {
				let result = res[1].data.object;
				this.flower = {
					...result
				};
			});
			findFlowerComment(option.flowerId).then(res => {
				console.log(res[1].data);
				let result = res[1].data.object;
				for (let i of result) {
					this.commentList.push({
						userName: i.user.userName,
						commentContent: i.commentContent
					})
				};
			})


		},
		methods: {
			onClick() {
				uni.reLaunch({
					url: "/pages/shopCart/shopCart"
				})
			},
			buttonClick(e) {
				if (e.content.text == '加入购物车') {
					console.log("点击了加入购物车")
					this.toShopCart()
				} else {
					// this.toOrder(this.flower)
					this.tobuy()
				}

			},
			change(e) {
				this.current = e.detail.current;
			},
			// 加入购物车
			toShopCart() {
				// shop_id,shop_number,flower_id,user_id
				let userId = uni.getStorageSync('userId');
				let data = {
					userId: userId,
					flowerId: this.flower.flowerId,
					shopNumber: 1
				}
				addShopCart(data).then(res => {
					console.log(res)
					uni.showToast({
						title: "加入购物车成功",
						duration: 2000,
						icon: "success",
					});
				}).catch(err => {
					console.log(res)
				})
				// uni.navigateTo({
				// 	url:'/pages/shopCart/shopCart?flowerId='+ this.flower.flowerId
				// })
			},
			// 购买
			tobuy() {
				var flower = JSON.stringify(this.flower)
				uni.navigateTo({
					url: "/pages/buy/buy?flower=" + flower
				})

			}
			// toOrder() {

			// 	let id = uni.getStorageSync('userId');
			// 	// addOrder()
			// 	let data = {
			// 		userId: id,
			// 		orderPrice: this.flower.flowerPrice,
			// 		flowerId: this.flower.flowerId,
			// 		orderNumber: 1,
			// 		locationId:"431077617",// 从 selectLocation 选择
			// 	}
			// 	console.log("购买", data, );
			// 	let orders = [data,data];
			// 	addOrder(orders).then(res => {
			// 		console.log("购买end", res[1].data);
			// 	})

			// }
		}
	}
</script>

<style lang="scss" scoped>
	.goods {
		padding-bottom: 100rpx;
	}

	.goods-img {
		width: 100vw;
		height: 50vw;
	}

	.goods-detail {
		width: 95vw;
		margin: 2.5vw auto;
		background-color: white;
		border-radius: 10rpx;
		padding: 20rpx;
		display: flex;
		flex-direction: column;

		.goods-price {
			display: flex;
			flex-direction: row;
			align-items: center;

			.current-price {
				color: #FF4500;
				font-size: 50rpx;
				font-weight: bold;
				margin-right: 30rpx;
			}

			.original-price {
				font-size: 30rpx;
				color: #999;
				text-decoration: line-through;
			}

		}

		.goods-name {
			padding: 20rpx 0;
		}

		.sold {
			color: #999;
			font-size: 25rpx;
		}
	}

	.evaluate {
		width: 95vw;
		margin: 2.5vw auto;
		background-color: white;
		padding: 20rpx;

		.evaluate-title {
			font-size: 40rpx;
			font-weight: bold;
		}

		.evaluate-info {
			padding: 20rpx 0;

			.evaluate-user {
				display: flex;
				flex-direction: row;
				align-items: center;
				margin-bottom: 20rpx;

				.head {
					width: 50rpx;
					height: 50rpx;
					margin-right: 20rpx;
				}

			}
		}

		.evaluate-no {
			width: 100%;
			color: #999;
			text-align: center;
		}
	}

	.flowerDetail {
		width: 100vw;
	}

	.bottom {
		width: 100vw;
		position: fixed;
		bottom: 0;
	}


	.price {
		color: #FF4500;
		font-size: 35rpx;
		font-weight: bold;
	}

	.originalPrice {
		color: #999;
		text-decoration: line-through;
	}

	.swiper-item {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: center;
		align-items: center;
		color: #fff;
		height: 800rpx;
		line-height: 800rpx;
	}

	.swiper {
		height: 820px;
	}
</style>