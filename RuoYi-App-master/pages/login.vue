<template>
  <view class="normal-login-container">
    <view class="logo-content align-center justify-center flex">
     <!-- <image style="width: 100rpx;height: 100rpx;" :src="globalConfig.appInfo.logo" mode="widthFix">
      </image> -->
      <text class="title" v-if="displayBtn">鲜花商店登录</text>
	  <text class="title" v-else>鲜花商店注册</text>
    </view>
    <view class="login-form-content">
      <view class="input-item flex align-center">
        <view class="iconfont icon-user icon"></view>
        <input v-model="loginForm.userName" class="input" type="text" placeholder="请输入账号" maxlength="30" />
      </view>
      <view class="input-item flex align-center">
        <view class="iconfont icon-password icon"></view>
        <input v-model="loginForm.userPassword" type="password" class="input" placeholder="请输入密码" maxlength="20" />
      </view>
      <view class="action-btn" >
		    <button @click="loginBtn" v-if="displayBtn"  class="login-btn cu-btn block bg-blue lg round">登录</button>
			<button @click="registerBtn" v-else  class="login-btn cu-btn block bg-green lg round">注册</button>
      </view>
	  <view class="reg text-center" v-if="displayBtn">
        <text class="text-grey1">没有账号？</text>
        <text @click="displayBtn=false" class="text-blue">立即注册</text>
      </view>
	  <view class="reg text-center" v-else>
	    <text class="text-grey1">已有账号</text>
	    <text @click="displayBtn=true" class="text-blue">立即登录</text>
	  </view>
    </view>
     
  </view>
</template>

<script>
	import { login ,register } from '@/api/flowerApi'
	  export default {
		data() {
		  return {
			loginForm: {
			  userName: "admin",
			  userPassword: "123",
			  userId: "",
			},
			displayBtn:true
		  }
		},
		created() {
		},
		methods: {
			
			loginBtn(){
				login(this.loginForm).then(res=>{
					let result = res[1].data.object;
					if(result != null){
						this.loginForm.userId = result.userId;
						uni.setStorageSync('userId', result.userId);
						this.$tab.reLaunch('/pages/index');
						console.log("登录成功");
					}else{
						console.log("登录失败");
					}
				}).catch(err=>{
					console.log("222",err);
				})
			},
			registerBtn(){
				register(this.loginForm).then(res=>{
					let result = res[1].data.object;
					if(result != null){
						console.log("注册成功");
						uni.setStorageSync('userId', result.userId);
					}else{
						console.log("注册失败");
					}
				})
				
			}
		 
		}
	  }
</script>

<style lang="scss">
  page {
    background-color: #ffffff;
  }

  .normal-login-container {
    width: 100%;

    .logo-content {
      width: 100%;
      font-size: 21px;
      text-align: center;
      padding-top: 15%;

      image {
        border-radius: 4px;
      }

      .title {
        // margin-left: 10px;
		width: 100vw;
		text-align: center;
      }
    }

    .login-form-content {
      text-align: center;
      margin: 20px auto;
      margin-top: 15%;
      width: 80%;

      .input-item {
        margin: 20px auto;
        background-color: #f5f6f7;
        height: 45px;
        border-radius: 20px;

        .icon {
          font-size: 38rpx;
          margin-left: 10px;
          color: #999;
        }

        .input {
          width: 100%;
          font-size: 14px;
          line-height: 20px;
          text-align: left;
          padding-left: 15px;
        }

      }

      .login-btn {
        margin-top: 40px;
        height: 45px;
      }
      
      .reg {
        margin-top: 15px;
      }
      
      .xieyi {
        color: #333;
        margin-top: 20px;
      }
      
      .login-code {
        height: 38px;
        float: right;
      
        .login-code-img {
          height: 38px;
          position: absolute;
          margin-left: 10px;
          width: 200rpx;
        }
      }
    }
  }

</style>
