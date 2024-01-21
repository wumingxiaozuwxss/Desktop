<template>
	<view class="mine-container" :style="{height: `${windowHeight}px`}">
		<uni-easyinput prefixIcon="search" v-model="value" placeholder="鲜花" @iconClick="iconClick">
		</uni-easyinput>
		<uni-swiper-dot  :current="current" :mode="mode">
			<swiper class="swiper-box" @change="change">
				<swiper-item v-for="(item ,index) in swiperInfo" :key="index">
					<view class="swiper-item">
						<image :src="item.image" />
					</view>
				</swiper-item>
			</swiper>
		</uni-swiper-dot>		
		<!-- <view class="container"> -->
		<uni-notice-bar show-icon scrollable
			text="特大喜讯特大喜讯鲜花商城小程序上线了" />
		<!-- </view> -->
		<uni-grid :column="4" :highlight="true" @change="change" :showBorder="false">
			<uni-grid-item v-for="(item, index) in type.slice(0,8)" :index="index" :key="index" >
				<view class="grid-item-box" style="background-color: #fff;" @click="toType(item.typeName)">
					<image class="type-image" :src="item.flowerImg"></image>
					<text class="text">{{item.typeName}}</text>
				</view>
			</uni-grid-item>
		</uni-grid>
		<view class="goods">
			<view class="goods-item" v-for="(item,index) in flowerList" @click="toGoodsDetail(item.flowerId)">
				<image class="goods-image" :src=item.flowerImg mode=""></image>
				<view class="goods-info">
					<view class="goods-title">
						{{item.flowerName}}
					</view>
					<view class="goods-price">
						<view class="">
							<view class="price">
								{{item.flowerPrice}}
							</view>
							<view class="originalPrice">
								{{item.flowerPriced}}
							</view>
						</view>
						<image class="shoppingcar-icon" src="/static/images/shoppingCar.png"  @click.stop="addCar(item)"></image>
					</view>
				</view>
			</view>
		</view>
 <shopping-car ref="car" :shoppingCarData="shoppingcarData"></shopping-car>
	</view>
</template>

<script>
	import { flowerType ,flower} from '@/api/flowerApi'
	import shoppingcar from "./compontents/shoppingCar.vue"
	export default {	
		components: {
		    'shopping-car': shoppingcar
		  },
		data() {
			return {
				shoppingcarData:"",
				swiperInfo: [{
						image: 'http://localhost:8080/static/2.jpg'
					},
					{
						image: 'http://localhost:8080/static/1.jpg'
					},
					{
						image: 'http://localhost:8080/static/3.jpg'
					}
				],
				current: 0,
				mode: 'round',
				type: [], // 种类
				flowerList:[] // 鲜花的集合
			}
		},
		onLoad: function() {
			this.load();
		},
		methods: {
			
			addCar(item){
				this.shoppingcarData=item
				this.$refs.car.toggle('bottom');
			},
			toshoppingcar(){
				uni.navigateTo({
					url:"./compontents/shoppingCar"
				})
			},
			// 商品分类 + 商品
			load(){
				let data = null;
				flowerType(data).then(res=>{
					let result = res[1].data.object;
					for(let item of result){
					    // console.log(item);
						this.type.push({
							flowerId:item.flowerId,
							typeId:item.typeId,
							typeName:item.typeName,
							flowerImg:item.flower.flowerImg
						})
					}
				})
				// 请求鲜花
				flower(data).then(res=>{
						console.log(res[1].data.object);
						let result = res[1].data.object;
						for(let item of result){
							this.flowerList.push({
								 flowerId: item.flowerId,
								 flowerImg: item.flowerImg,
								 flowerName: item.flowerName,
								 flowerPrice: item.flowerPrice,
								 flowerPriced: item.flowerPriced,
								 flowerSales: item.flowerSales,
								 flowerSpecification: item.flowerSpecification,
								 flowerDetail1:item.flowerDetail1,
								 flowerDetail2: item.flowerDetail2,
								 flowerDetail3: item.flowerDetail3
							})
						}
				}).catch(err=>{
					console.log("报错",err)
				})
			},
			
			
			toGoodsDetail(flowerId){
				uni.navigateTo({
					url:'/pages/goodsDetail/goodsDetail?flowerId='+ flowerId
				})
				
			},
			toType(typeName){
				uni.reLaunch({
					url:'/pages/type/type?typeName='+ typeName
				})
			},
			toLocation(){
				uni.navigateTo({
					url:'/pages/location/location'
				})
			},
			change(e) {
				this.current = e.detail.current;
			}
		}
	}
</script>

<style lang="scss">
	.goods {
		width: 100vw;
		padding: 20rpx;
		box-sizing: border-box;
		display: flex;
		flex-wrap: wrap;
		justify-content: start;

		.goods-item {
			width: 50%;
			display: flex;
			align-items: center;
			flex-direction: column;
			margin-bottom: 20rpx;

			.goods-image {
				width: 40vw;
				height: 40vw;
				border-radius: 15rpx 15rpx 0 0;
			}

			.goods-info {
				width: 40vw;
				.goods-title {
					width: 40vw;
					margin: 10rpx 0;
					display: -webkit-box;
					-webkit-box-orient: vertical;
					-webkit-line-clamp: 2;
					overflow: hidden;
				}
				.goods-price{
					display: flex;
					justify-content: space-between;
					align-items: center;
					.price{
						color: #FF4500;
						font-size: 35rpx;
						font-weight: bold;
					}
					.originalPrice{
						color: #999;
						text-decoration: line-through;
					}
				}
				
				.shoppingcar-icon {
					width: 40rpx;
					height: 40rpx;
				}
			}

		}


	}

	page {
		background-color: #f5f6f7;
	}

	.mine-container {
		width: 100%;
		height: 100%;
	}

	.swiper-item {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		justify-content: center;
		align-items: center;
		color: #fff;
		height: 300rpx;
		line-height: 300rpx;
	}

	.image {
		width: 25px;
		height: 25px;
	}

	.text {
		font-size: 14px;
		margin-top: 5px;
	}

	.example-body {
		/* #ifndef APP-NVUE */
		// display: block;
		/* #endif */
	}

	.grid-dynamic-box {
		margin-bottom: 15px;
	}

	.grid-item-box {
		flex: 1;
		// position: relative;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: column;
		align-items: center;
		justify-content: center;
		padding: 15px 0;
	}

	.grid-item-box-row {
		flex: 1;
		// position: relative;
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
		align-items: center;
		justify-content: center;
		padding: 15px 0;
	}

	.grid-dot {
		position: absolute;
		top: 5px;
		right: 15px;
	}

	.swiper {
		height: 420px;
	}

	/* #ifdef H5 */
	@media screen and (min-width: 768px) and (max-width: 1425px) {
		.swiper {
			height: 630px;
		}
	}

	@media screen and (min-width: 1425px) {
		.swiper {
			height: 830px;
		}
	}

	/* #endif */
	/* 	.type-box{
		width: 90vw;
		margin: 20upx auto;
	} */
	.type-image {
		width: 100upx;
		height: 100upx;
		border-radius: 50upx;
	}

	/* 公告栏 */
	.container {
		/* margin-bottom: 20rpx; */
	}
</style>