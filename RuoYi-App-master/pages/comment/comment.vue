<template>
	<view>
		评价:
	</view>
</template>

<script>
	import {  addComment } from '@/api/flowerApi'
	export default {
		data() {
			return {
				comment:{
					  commentContent:'',
					  orderId:"", 
					  userId:"", 
					  flowerId:','
				},
			};
		},
		onLoad(option) {
			
	
		},
		methods:{
			addBtn(){
				
			}
		}
		
	}
</script>

<style lang="scss">

</style>
