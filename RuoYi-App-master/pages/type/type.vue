<template>
	<view class="box">
		<view class="left">
			<view v-for="(item,index) in typeList">
				<view class="left-btn"  :class="tabindex==index?'selectindex':''"  @click="getType(item.typeName,index)">{{item.typeName}}</view>
			</view>
		</view>
		

		<view class="right">
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
							<image class="shoppingcar-icon" src="/static/images/shoppingCar.png" mode="" @click.stop="addCar(item)"></image>
						</view>
					</view>
				</view>
			</view>
		</view>
		<shopping-car ref="car" :shoppingCarData="shoppingcarData"></shopping-car>

	</view>
</template>

<script>
	
	import { flowerType,flowerByType } from '@/api/flowerApi'
	import shoppingcar from "../compontents/shoppingCar.vue"
	export default {
		components: {
		    'shopping-car': shoppingcar
		  },
		data() {
			return {
				shoppingcarData:"",
				tabindex:0,
				typeList:[],// 分类的选项
				typeId:'',//分类id
				flowerList:[],//鲜花的id 
			};
		},
		onLoad: function(option) {
			// 获取上个页面的参数
			this.start();
			console.log("分类11111",option);
			// getType(item.typeName);
		},
		methods:{
			addCar(item){
				this.shoppingcarData=item
				this.$refs.car.toggle('bottom');
			},
			start(){
				flowerType().then(res=>{
					let result = res[1].data.object;
					for(let i of result){
						console.log("分类",i);
						this.typeList.push({
							...i
						})
					};
					this.getType(this.typeList[0].typeName)
				}).catch(err=>{
					console.log(err);
				})
			},
			// 获取分类的鲜花
			getType(e,index){
				console.log(e,index,'参数')
				this.tabindex = index
				
				this.flowerList = [];
				flowerByType(e).then(res=>{
					let result = res[1].data.object;
					for(let i of result){
						this.flowerList.push({
							...i.flower
						})
					}
					console.log("11111",this.flowerList);
					
				}).catch(err=>{
					console.log(err);
				})
			},
			// 去商品详情页面
			toGoodsDetail(flowerId){
				uni.navigateTo({
					url:'/pages/goodsDetail/goodsDetail?flowerId='+ flowerId
				})
				
			},
			
		}
		
	}
</script>

<style lang="scss">
	.box{
		display: flex;
		flex-direction: row;
		.right{
			width: 75vw;
			background-color: white;
			min-height: 100vh;
			.goods {
					// width: 100vw;
					width: 75vw;
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
							width: 30vw;
							height: 30vw;
							border-radius: 15rpx 15rpx 0 0;
						}
			
						.goods-info {
							width: 30vw;
							.goods-title {
								width: 30vw;
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
		}
		.left{
			width: 25vw;
			
			
			.left-btn{
				color: #999;
				padding: 30rpx;
				
			}
			.selectindex{
				border-left: solid #FF4500 5rpx;
				color: #FF4500;
				background-color: white;
			}

		}

		
	}


</style>
