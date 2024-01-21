<template>
	<view style="padding: 0 0 30rpx 0;">
		<view v-for="item in orderList" class="orderitem">
			<image class="orderimg" :src="item.flower.flowerImg" mode=""></image>
			<view class="">
				<view class="">
					订单编号： {{item.orderId}} 
				</view>
				<view class="">
					商品名称 {{item.flower.flowerName}}
				</view>
				<view class="">
					订单价格 {{item.orderPrice}}
				</view>
				<view class="">
					订单数量 {{item.orderNumber}}
				</view>
				<view class="">
					订单总价  {{item.orderPrice * item.orderNumber}}
				</view>
				<view class="">
					收货地址 {{item.location.locationName}}
				</view>
				<view v-if="item.commentState == '1'">
					评价 ： {{item.comment.commentContent}}
				</view>
				<view v-if="item.commentState == '1'">
					<button class="mini-btn" type="primary" size="mini" >已评价</button>
				</view>
				<view v-else>

					<button class="mini-btn" type="warn" size="mini" @click="openCenter(item)">评价</button>
				</view>
			</view>		
		
		
		</view>
		<uni-popup ref="centerPopup" :type="'center'" :mask-click='false'>
			<view class="center-popup">
				<view class="head-title"> 评价 </view>
				<view class="head-close" @click="closeCenter">
					<text class="iconfont icon-close"></text>
				</view>
				<view class="form-item">
					<view class="center">
						<input type="text" placeholder="请输入评价" v-model="commentValData"
							placeholderStyle="color:#999;font-size:28rpx" />
					</view>
				</view>
		
				<view class="bottom-btn" @click="addBtnComment()"> 确定 </view>
		
			</view>
		</uni-popup>
	</view>
</template>

<script>
	
	import { findOrder, addComment } from '@/api/flowerApi'
	export default {
		data() {
			return {
				orderList:[],
				commentVal:"",
				commentValData:"",
				orderid:"",
				flowerId:""
			}
		},
		onShow() {
			 let id = uni.getStorageSync('userId');
			findOrder(id).then(res=>{
				console.log("订单",res[1].data.object);
				let data = res[1].data.object;
				for(let i of data){
					this.orderList.push({
						...i,
						commentVal:""
					})
				}
			})
		},
		methods: {
			openCenter(item) {
				console.log(item)
				this.orderid = item.orderId
				this.flowerId = item.flowerId
				this.orderid = item.orderId
				this.$refs.centerPopup.open();
			},
			closeCenter(item) {
			
				this.$refs.centerPopup.close();
			},
			addBtnComment(){
				  let id = uni.getStorageSync('userId');
				  let data = {
					  commentContent:this.commentValData,
					  orderId:this.orderid,
					  userId:id,
					  flowerId:this.flowerId
				  }
				addComment(data).then(res=>{
					console.log(res[1].data);
					this.$refs.centerPopup.close();
				})
			}
			
		}
	}
</script>

<style lang="scss" scoped>
	.orderimg{
		width: 300rpx;
		height: 300rpx;
		margin-right: 20rpx;
	}
.orderitem{
	display: flex;
	width: 95vw;
	box-sizing: border-box;
	background-color: white;
	border-radius: 10rpx;
	margin: 20px auto;
	padding: 30rpx;
}

	.center-popup {
		background: #fff;
		border-radius: 26rpx;
		width: 630rpx;
		padding: 30rpx;
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		align-items: center;

		.head-close {
			position: absolute;
			right: 30rpx;
			top: 34rpx;
		}

		.head-title {
			font-size: 36rpx;
		}

		.form-item {
			width: 100%;
			margin-top: 40rpx;

			.label {
				font-size: 30rpx;
				font-weight: 500;
			}

			.form-input {
				display: flex;
				margin-top: 30rpx;
				margin-bottom: 30rpx;

				.left {
					width: 120rpx;
					height: 84rpx;
					background: #eff2fb;
					color: #000;
					font-size: 30rpx;
					display: flex;
					align-items: center;
					justify-content: center;
					border-radius: 26rpx;
					margin-right: 20rpx;
				}

				.right {
					height: 84rpx;
					background: #eff2fb;
					border-radius: 26rpx;
					display: flex;
					align-items: center;
					padding-left: 30rpx;

					input {
						width: 100%;
						height: 100%;
					}

					flex: 1;
				}
			}
		}

		.center {
			height: 84rpx;
			background: #eff2fb;
			border-radius: 26rpx;

			input {
				width: 100%;
				height: 100%;
			}

			flex: 1;
			margin-bottom: 30rpx;
			padding-left: 30rpx;
		}

		.bottom-btn {
			width: 330rpx;
			height: 80rpx;
			background: #3b61f4;
			border-radius: 20rpx;
			color: #fff;
			display: flex;
			align-items: center;
			justify-content: center;
			margin-top: 47rpx;
		}
	}
</style>
