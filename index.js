/*
 * 小肥牛扫码点餐项目API子系统
 */
const PORT =8090;
const express=require("express");

//启动主服务器
var app=exrpess();
app.listen(PORT,()=>{
    console.log('Server Listening '+PORT+'...');
})