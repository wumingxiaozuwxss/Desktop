<template>
	<view style="padding-top: 40rpx;">


		<view v-for="item in locationList" class="location"  @click="select(item)">
			<view>{{item.locationName}}</view>
			<view style="display: flex;">
				<view class="change-location" @click.stop="chengBtn(item)">修改</view>
				<!-- <view class="change-location" style="margin-left: 30rpx;" @click="delBtn(item)">删除</view> -->
			</view>

		</view>
		<view class="add-btn" @click="addBtn()">
			新增
		</view>
		<uni-popup ref="centerPopup" :type="'center'" :mask-click='false'>
			<view class="center-popup">
				<view class="head-title"> 地址 </view>
				<view class="head-close" @click="closeCenter">
					<text class="iconfont icon-close"></text>
				</view>
				<view class="form-item">
					<view class="center">
						<input type="text" placeholder="请输入地址" v-model="name"
							placeholderStyle="color:#999;font-size:28rpx" />
					</view>
				</view>

				<view class="bottom-btn" @click="handleNeed()"> 确定 </view>

			</view>
		</uni-popup>
	</view>
</template>

<script>
	import {
		addLocation,
		chengLocation,
		delLocation,
		findLocation
	} from '@/api/flowerApi'
	export default {
		data() {
			return {
				location: {
					locationId: "",
					locationName: "",
					locationState: "",
					userId: ''
				},
				locationList: [],
				userId: '',
				id: "",
				name: "",
				type: "add",
				typeData:""
			};
		},
		onLoad(option) {
			if(option.type){
				this.typeData = option.type
			}
		
		},
		onShow() {
			// console.log("进入地址");
			this.location.userId = uni.getStorageSync('userId');
			findLocation(this.location.userId).then(res => {
				let data = res[1].data.object;
				for (let i of data) {
					this.locationList.push({
						locationId: i.locationId,
						locationName: i.locationName,
						locationState: i.locationState,
						userId: i.userId
					})
				}
			});
		},
		methods: {
			closeCenter() {
				this.$refs.centerPopup.close();
			},
			select(item){
				
              let pages = getCurrentPages();
              let prevPage = pages[pages.length - 2];
              prevPage.$vm.schoolName = item;
              uni.navigateBack({
              	delta: 1
              })
			},
			addBtn() {
				this.$refs.centerPopup.open();
			},
			addbtn1() {
				this.location.locationName = this.name
				let data = this.location;
				addLocation(data).then(res => {
					console.log(res);
					this.$refs.centerPopup.close();
					this.location.userId = uni.getStorageSync('userId');
					findLocation(this.location.userId).then(res => {
						let data = res[1].data.object;
						this.locationList=[]
						for (let i of data) {
							this.locationList.push({
								locationId: i.locationId,
								locationName: i.locationName,
								locationState: i.locationState,
								userId: i.userId
							})
						}
					});
				})
			},
			// delBtn(item) {
			// 	delLocation(item).then(res => {
			// 		uni.showToast({
			// 			title: "删除成功",
			// 			duration: 2000,
			// 			icon: "success",
			// 		});
			// 	})
			// },
			chengBtn(item) {
				this.id = item.locationId
				this.$refs.centerPopup.open();
			},
			handleNeed() {
				if (this.type == 'add') {
					this.addbtn1()
				} else {
					this.locationList.forEach((item) => {
						if (item.locationId == this.id) {
							item.locationName = this.name
							chengLocation(item).then(res => {
								this.$refs.centerPopup.close();
							})
						}
					})
				}

			}

		}

	}
</script>

<style lang="scss" scoped>
	.location {
		width: 95vw;
		box-sizing: border-box;
		padding: 30rpx;
		margin-bottom: 30rpx;
		background-color: white;
		border-radius: 10rpx;
	}

	.change-location {
		width: 100rpx;
		background-color: #FF4500;
		height: 40rpx;
		line-height: 40rpx;
		border-radius: 10rpx;
		color: white;
		text-align: center;
		margin-top: 30rpx;
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