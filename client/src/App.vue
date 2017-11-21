<template>
  <div  id="app">
<div @click='p'>
	<iframe @load='loaded' ref=iframe src="http://localhost:5984/_utils"/>
</div>
	<button @click='io'/>
    <img src="./assets/logo.png">
  </div>
</template>

<script>
export default {
  name: 'app',
	methods: {
p(){console.log(9)},
loaded(ev){
	console.log(ev.target)	
//ev.target.contentDocument.addEventListener('click', ev => {
//	console.log(e)
//})
},
io(){
	this.$socket.emit('update', 'rien')
	}
}
}
</script>

<style>
	iframe{
	width: 100%;
	height: 100%;
}
#app {
display: grid;
grid: 500px auto / 3fr 0.1fr 1fr;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
