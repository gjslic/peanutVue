<template>

<el-row :gutter="0">
			<el-carousel :interval="0" arrow="hover" height="500px">
				<el-carousel-item v-for="item in dataimg" :key="item">
				
							<div>
								<img :src="item.src">
							</div>
					
				</el-carousel-item>
			</el-carousel>
		</el-row>

</template>

<script>

export default {
    name:'Banner',
        data() {

        return {

         dataimg: [{
						src: require('../assets/images/banner.jpg'),
					
					},
					{
						src: require('../assets/images/banner01.jpg'),
					
					},
					{
						src: require('../assets/images/banner02.jpeg'),
					
					}
				],

        };
    }
}
</script>

<style scoped>
.el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }

  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
 
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #99a9bf;
  } 

img {

  /*设置图片宽度和浏览器宽度一致*/

  width: 100%;

  height: 100%;

}


</style>